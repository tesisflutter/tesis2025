import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/custom_code/geocoding_service.dart';
import 'selector_mapa_model.dart';
export 'selector_mapa_model.dart';

class SelectorMapaWidget extends StatefulWidget {
  const SelectorMapaWidget({super.key, this.ubicacionInicial});

  static String routeName = 'Selector_Mapa';
  static String routePath = '/selectorMapa';

  final LatLng? ubicacionInicial;

  @override
  State<SelectorMapaWidget> createState() => _SelectorMapaWidgetState();
}

class _SelectorMapaWidgetState extends State<SelectorMapaWidget> {
  gmaps.GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  FFPlace? _selectedPlace;
  bool _isGeocoding = false;
  Set<gmaps.Marker> _markers = {};

  // Centro por defecto: Buenos Aires, Argentina
  static const _defaultCenter = gmaps.LatLng(-34.6037, -58.3816);

  gmaps.LatLng get _initialTarget {
    if (widget.ubicacionInicial != null) {
      return gmaps.LatLng(
        widget.ubicacionInicial!.latitude,
        widget.ubicacionInicial!.longitude,
      );
    }
    return _defaultCenter;
  }

  double get _initialZoom =>
      widget.ubicacionInicial != null ? 12.0 : 5.0;

  @override
  void initState() {
    super.initState();
    // Si hay ubicacion inicial, colocar marker
    if (widget.ubicacionInicial != null) {
      _selectedLocation = widget.ubicacionInicial;
      _markers = {
        gmaps.Marker(
          markerId: const gmaps.MarkerId('selected'),
          position: _initialTarget,
        ),
      };
      // Geocodificar la ubicacion inicial para mostrar la direccion
      _geocodeInitialLocation();
    }
  }

  Future<void> _geocodeInitialLocation() async {
    if (widget.ubicacionInicial == null) return;
    setState(() => _isGeocoding = true);
    final place = await GeocodingService.reverseGeocode(widget.ubicacionInicial!);
    if (mounted) {
      setState(() {
        _selectedPlace = place;
        _isGeocoding = false;
      });
    }
  }

  void _onMapTapped(gmaps.LatLng position) async {
    final ffLatLng = LatLng(position.latitude, position.longitude);
    setState(() {
      _selectedLocation = ffLatLng;
      _isGeocoding = true;
      _markers = {
        gmaps.Marker(
          markerId: const gmaps.MarkerId('selected'),
          position: position,
        ),
      };
    });

    final place = await GeocodingService.reverseGeocode(ffLatLng);
    if (mounted) {
      setState(() {
        _selectedPlace = place;
        _isGeocoding = false;
      });
    }
  }

  void _onConfirm() {
    Navigator.pop(context, _selectedPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Seleccionar ubicación',
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
      body: Stack(
        children: [
          gmaps.GoogleMap(
            initialCameraPosition: gmaps.CameraPosition(
              target: _initialTarget,
              zoom: _initialZoom,
            ),
            onMapCreated: (controller) => _mapController = controller,
            onTap: _onMapTapped,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
          ),
          // Instruccion superior
          if (_selectedLocation == null)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Toque en el mapa para seleccionar la ubicación del caballo',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                        ),
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          // Card inferior con direccion y boton confirmar
          if (_selectedLocation != null)
            Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: Card(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_isGeocoding)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        )
                      else ...[
                        if (_selectedPlace?.city.isNotEmpty == true ||
                            _selectedPlace?.state.isNotEmpty == true)
                          Text(
                            [
                              if (_selectedPlace!.city.isNotEmpty)
                                _selectedPlace!.city,
                              if (_selectedPlace!.state.isNotEmpty)
                                _selectedPlace!.state,
                            ].join(', '),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        if (_selectedPlace?.address.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              _selectedPlace!.address,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        if (_selectedPlace?.address.isEmpty != false &&
                            _selectedPlace?.city.isEmpty != false)
                          Text(
                            'Ubicación seleccionada',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                      const SizedBox(height: 12.0),
                      SizedBox(
                        width: double.infinity,
                        height: 44.0,
                        child: ElevatedButton(
                          onPressed: _isGeocoding ? null : _onConfirm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0.0,
                          ),
                          child: Text(
                            'Confirmar ubicación',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
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
              ),
            ),
        ],
      ),
    );
  }
}
