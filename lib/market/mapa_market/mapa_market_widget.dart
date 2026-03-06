import 'dart:async';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mapa_market_model.dart';

export 'mapa_market_model.dart';

class MapaMarketWidget extends StatefulWidget {
  const MapaMarketWidget({super.key});

  static String routeName = 'MapaMarket';
  static String routePath = '/mapaMarket';

  @override
  State<MapaMarketWidget> createState() => _MapaMarketWidgetState();
}

class _MapaMarketWidgetState extends State<MapaMarketWidget> {
  late MapaMarketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Set<gmaps.Marker> _markers = {};
  List<PublicacionMarketRecord> _publicaciones = [];
  bool _isLoading = true;
  bool _locationReady = false;

  // Default: Buenos Aires, Argentina
  static const _defaultCenter = gmaps.LatLng(-34.6037, -58.3816);
  gmaps.LatLng _userLocation = _defaultCenter;
  double _initialZoom = 5.0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaMarketModel());
    _initializeMap();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _initializeMap() async {
    await _getUserLocation();
    if (mounted) {
      setState(() => _locationReady = true);
    }
    await _loadPublicaciones();
  }

  Future<void> _getUserLocation() async {
    try {
      // Try device GPS first
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.medium,
            timeLimit: Duration(seconds: 10),
          ),
        );
        if (mounted) {
          setState(() {
            _userLocation =
                gmaps.LatLng(position.latitude, position.longitude);
            _initialZoom = 10.0;
          });
        }
        return;
      }
    } catch (_) {
      // GPS failed, try user profile location
    }

    // Fallback: user's profile GeoPoint from Firestore
    try {
      final userEmail = FFAppState().correoUsuarioLogueado;
      if (userEmail.isNotEmpty) {
        final userDocs = await queryUsuarioRecordOnce(
          queryBuilder: (q) => q.where('Correo', isEqualTo: userEmail),
          singleRecord: true,
        );
        if (userDocs.isNotEmpty && userDocs.first.hasUbicacionGeoPoint()) {
          final gp = userDocs.first.ubicacionGeoPoint!;
          if (mounted) {
            setState(() {
              _userLocation = gmaps.LatLng(gp.latitude, gp.longitude);
              _initialZoom = 10.0;
            });
          }
          return;
        }
      }
    } catch (_) {
      // Profile fallback failed too
    }

    // Final fallback: Buenos Aires (already set as default)
  }

  Future<void> _loadPublicaciones() async {
    try {
      final userEmail = FFAppState().correoUsuarioLogueado;
      final publicaciones = await queryPublicacionMarketRecordOnce(
        queryBuilder: (q) =>
            q.where('CorreoDuenio', isNotEqualTo: userEmail),
      );

      // Filter only those with GeoPoint
      _publicaciones = publicaciones
          .where((p) => p.hasUbicacionGeoPoint())
          .toList();

      await _buildMarkers();
    } catch (_) {
      // Handle error silently
    }

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _buildMarkers() async {
    final Set<gmaps.Marker> markers = {};

    for (final pub in _publicaciones) {
      final gp = pub.ubicacionGeoPoint!;
      final position = gmaps.LatLng(gp.latitude, gp.longitude);

      gmaps.BitmapDescriptor icon;

      // Try to create custom marker with thumbnail
      if (pub.listaURLFotos.isNotEmpty) {
        try {
          icon = await _createCustomMarker(pub.listaURLFotos.first);
        } catch (_) {
          icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
              gmaps.BitmapDescriptor.hueGreen);
        }
      } else {
        icon = gmaps.BitmapDescriptor.defaultMarkerWithHue(
            gmaps.BitmapDescriptor.hueGreen);
      }

      markers.add(
        gmaps.Marker(
          markerId: gmaps.MarkerId(pub.reference.id),
          position: position,
          icon: icon,
          onTap: () => _onMarkerTapped(pub),
        ),
      );
    }

    if (mounted) {
      setState(() => _markers = markers);
    }
  }

  Future<gmaps.BitmapDescriptor> _createCustomMarker(String imageUrl) async {
    // Download image via cache manager
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    final bytes = await file.readAsBytes();

    // Decode image
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: 120,
      targetHeight: 120,
    );
    final frame = await codec.getNextFrame();
    final image = frame.image;

    // Create circular thumbnail with border
    const double size = 130.0;
    const double imageSize = 110.0;
    const double borderWidth = 4.0;
    const double pinHeight = 20.0;
    const double totalHeight = size + pinHeight;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final center = Offset(size / 2, size / 2);
    final radius = imageSize / 2;

    // Draw white circle border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius + borderWidth, borderPaint);

    // Draw green outline
    final outlinePaint = Paint()
      ..color = const Color(0xFF243203)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(center, radius + borderWidth, outlinePaint);

    // Clip to circle and draw image
    canvas.save();
    final clipPath = Path()..addOval(Rect.fromCircle(center: center, radius: radius));
    canvas.clipPath(clipPath);

    final srcRect = Rect.fromLTWH(
      0, 0, image.width.toDouble(), image.height.toDouble());
    final dstRect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawImageRect(image, srcRect, dstRect, Paint());
    canvas.restore();

    // Draw pin triangle below circle
    final pinPath = Path()
      ..moveTo(size / 2 - 12, size / 2 + radius + borderWidth - 2)
      ..lineTo(size / 2, totalHeight)
      ..lineTo(size / 2 + 12, size / 2 + radius + borderWidth - 2)
      ..close();

    canvas.drawPath(pinPath, borderPaint);
    canvas.drawPath(
      pinPath,
      Paint()
        ..color = const Color(0xFF243203)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), totalHeight.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return gmaps.BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
  }

  void _onMarkerTapped(PublicacionMarketRecord pub) {
    setState(() {
      _model.publicacionSeleccionada = pub;
      _model.mostrarPanel = true;
    });
  }

  void _onMapTapped(gmaps.LatLng _) {
    if (_model.mostrarPanel) {
      setState(() {
        _model.mostrarPanel = false;
        _model.publicacionSeleccionada = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: const Color(0xC6243203),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () => context.safePop(),
        ),
        title: Text(
          'Publicaciones cerca',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.outfit(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
        ),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: !_locationReady
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Google Map
                gmaps.GoogleMap(
                  initialCameraPosition: gmaps.CameraPosition(
                    target: _userLocation,
                    zoom: _initialZoom,
                  ),
                  onTap: _onMapTapped,
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: false,
                ),

                // Loading overlay while publications load
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),

                // Bottom info panel when a marker is tapped
                if (_model.mostrarPanel &&
                    _model.publicacionSeleccionada != null)
                  Positioned(
                    bottom: 24.0,
                    left: 16.0,
                    right: 16.0,
                    child: _buildInfoPanel(
                        context, _model.publicacionSeleccionada!),
                  ),
              ],
            ),
    );
  }

  Widget _buildInfoPanel(
      BuildContext context, PublicacionMarketRecord pub) {
    final hasPhoto = pub.listaURLFotos.isNotEmpty;
    final location = [
      if (pub.ciudad.isNotEmpty) pub.ciudad,
      if (pub.provincia.isNotEmpty) pub.provincia,
    ].join(', ');

    return Card(
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: hasPhoto
                  ? CachedNetworkImage(
                      imageUrl: pub.listaURLFotos.first,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 80.0,
                        height: 80.0,
                        color: FlutterFlowTheme.of(context).alternate,
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 80.0,
                        height: 80.0,
                        color: FlutterFlowTheme.of(context).alternate,
                        child: const Icon(Icons.image_not_supported, size: 30),
                      ),
                    )
                  : Container(
                      width: 80.0,
                      height: 80.0,
                      color: FlutterFlowTheme.of(context).alternate,
                      child: const Icon(Icons.image, size: 30),
                    ),
            ),
            const SizedBox(width: 12.0),
            // Info
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    pub.titulo,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w600,
                          ),
                          letterSpacing: 0.0,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (location.isNotEmpty) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      location,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                            ),
                            letterSpacing: 0.0,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (pub.hasPrecio()) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      '\$${pub.precio}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    height: 36.0,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(
                          MarketPublicacionSeleccionadaWidget.routeName,
                          queryParameters: {
                            'idArticuloPublicacion': serializeParam(
                              pub.iDPublicacion,
                              ParamType.int,
                            ),
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0.0,
                      ),
                      child: Text(
                        'Ver publicación',
                        style:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
