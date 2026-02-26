import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/market/componente_bottom_filtros/componente_bottom_filtros_widget.dart';
import '/market/componente_lista_market_vacia/componente_lista_market_vacia_widget.dart';
import '/market/componente_lista_mis_publis_vacia/componente_lista_mis_publis_vacia_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'market_principal_model.dart';
export 'market_principal_model.dart';

class MarketPrincipalWidget extends StatefulWidget {
  const MarketPrincipalWidget({
    super.key,
    this.textoBusquedaExterno,
    this.filtroExterno,
  });

  final String? textoBusquedaExterno;
  final FiltroRecord? filtroExterno;

  static String routeName = 'Market_Principal';
  static String routePath = '/marketPrincipal';

  @override
  State<MarketPrincipalWidget> createState() => _MarketPrincipalWidgetState();
}

class _MarketPrincipalWidgetState extends State<MarketPrincipalWidget> {
  late MarketPrincipalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketPrincipalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaPublisDestacadasQuery =
          await queryPublicacionMarketRecordOnce(
        queryBuilder: (publicacionMarketRecord) => publicacionMarketRecord
            .where(
              'CorreoDuenio',
              isNotEqualTo: FFAppState().correoUsuarioLogueado,
            )
            .where(
              'Destacado',
              isEqualTo: true,
            ),
      );
      if (widget.filtroExterno != null) {
        _model.modoBusqueda = widget.textoBusquedaExterno != null &&
            widget.textoBusquedaExterno != '';
        _model.listaPublisDestacadas = _model.listaPublisDestacadasQuery!
            .toList()
            .cast<PublicacionMarketRecord>();
        _model.filtroCategoria = widget.filtroExterno?.tipoPublicacion;
        _model.filtroPrecioMinimo = widget.filtroExterno?.precioMinimo;
        _model.filtroPrecioMaximo = widget.filtroExterno?.precioMaximo;
        _model.filtroProvincia = widget.filtroExterno?.provincia;
        _model.filtroCiudad = widget.filtroExterno?.ciudad;
      } else {
        _model.modoBusqueda = widget.textoBusquedaExterno != null &&
            widget.textoBusquedaExterno != '';
        _model.listaPublisDestacadas = _model.listaPublisDestacadasQuery!
            .toList()
            .cast<PublicacionMarketRecord>();
      }

      _model.queryPublisMarket = await queryPublicacionMarketRecordOnce(
        queryBuilder: (publicacionMarketRecord) =>
            publicacionMarketRecord.where(
          'CorreoDuenio',
          isNotEqualTo: FFAppState().correoUsuarioLogueado,
        ),
      );
      _model.listaPublisMarket =
          _model.queryPublisMarket!.toList().cast<PublicacionMarketRecord>();
      if (_model.modoBusqueda) {
        _model.listaPublisMarketBuscadasResult = [];
        safeSetState(() {});
        for (int loop1Index = 0;
            loop1Index <
                _model.listaPublisMarket
                    .where((e) =>
                        (e.titulo.contains((widget.textoBusquedaExterno!))) ||
                        (e.descripcion
                            .contains((widget.textoBusquedaExterno!))))
                    .toList()
                    .length;
            loop1Index++) {
          final currentLoop1Item = _model.listaPublisMarket
              .where((e) =>
                  (e.titulo.contains((widget.textoBusquedaExterno!))) ||
                  (e.descripcion.contains((widget.textoBusquedaExterno!))))
              .toList()[loop1Index];
          _model.addToListaPublisMarketBuscadasResult(currentLoop1Item);
        }
      }

      safeSetState(() {});
    });

    _model.txtFieldBuscarTextController ??= TextEditingController(
        text: widget.textoBusquedaExterno != null &&
                widget.textoBusquedaExterno != ''
            ? widget.textoBusquedaExterno
            : '');
    _model.txtFieldBuscarFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xC6243203),
                automaticallyImplyLeading: false,
                title: Text(
                  'Market',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.outfit(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.txtFieldBuscarTextController,
                                    focusNode: _model.txtFieldBuscarFocusNode,
                                    onFieldSubmitted: (_) async {
                                      _model.listaPublisMarketBuscadasResult =
                                          [];
                                      if (_model.txtFieldBuscarTextController
                                                  .text !=
                                              '') {
                                        for (int loop1Index = 0;
                                            loop1Index <
                                                _model.listaPublisMarket
                                                    .where((e) =>
                                                        (e.titulo.contains(_model
                                                            .txtFieldBuscarTextController
                                                            .text)) ||
                                                        (e.descripcion.contains(
                                                            _model
                                                                .txtFieldBuscarTextController
                                                                .text)))
                                                    .toList()
                                                    .length;
                                            loop1Index++) {
                                          final currentLoop1Item = _model
                                              .listaPublisMarket
                                              .where((e) =>
                                                  (e.titulo.contains(_model
                                                      .txtFieldBuscarTextController
                                                      .text)) ||
                                                  (e.descripcion.contains(_model
                                                      .txtFieldBuscarTextController
                                                      .text)))
                                              .toList()[loop1Index];
                                          _model
                                              .addToListaPublisMarketBuscadasResult(
                                                  currentLoop1Item);
                                        }
                                        _model.modoBusqueda = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.modoBusqueda = false;
                                        safeSetState(() {});
                                      }
                                    },
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Buscar en Market...',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE0E3E7),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF1F4F8),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              24.0, 24.0, 20.0, 24.0),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Color(0xFF57636C),
                                        size: 16.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF14181B),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    validator: _model
                                        .txtFieldBuscarTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]'))
                                    ],
                                  ),
                                ),
                                if (_model.txtFieldBuscarTextController.text !=
                                        '')
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 15.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          safeSetState(() {
                                            _model.txtFieldBuscarTextController
                                                ?.text = '';
                                          });
                                          _model.modoBusqueda = false;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.tune,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child:
                                                  ComponenteBottomFiltrosWidget(
                                                filtroCategoria:
                                                    _model.filtroCategoria!,
                                                filtroPrecioMinimo:
                                                    _model.filtroPrecioMinimo!,
                                                filtroPrecioMaximo:
                                                    _model.filtroPrecioMaximo!,
                                                filtroProvincia:
                                                    _model.filtroProvincia!,
                                                filtroCiudad: _model
                                                                .filtroCiudad ==
                                                            null ||
                                                        _model.filtroCiudad ==
                                                            ''
                                                    ? ''
                                                    : _model.filtroCiudad!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.docFiltroBottom = value));

                                      if (_model.docFiltroBottom?.reference !=
                                          null) {
                                        _model.filtroCategoria = _model
                                                        .docFiltroBottom
                                                        ?.tipoPublicacion ==
                                                    null ||
                                                _model.docFiltroBottom
                                                        ?.tipoPublicacion ==
                                                    ''
                                            ? 'Todas'
                                            : _model.docFiltroBottom
                                                ?.tipoPublicacion;
                                        _model.filtroPrecioMinimo = (_model
                                                        .docFiltroBottom
                                                        ?.precioMinimo ==
                                                    null) ||
                                                (_model.docFiltroBottom
                                                        ?.precioMinimo ==
                                                    0)
                                            ? 0
                                            : _model
                                                .docFiltroBottom?.precioMinimo;
                                        _model.filtroPrecioMaximo = (_model
                                                        .docFiltroBottom
                                                        ?.precioMaximo ==
                                                    null) ||
                                                (_model.docFiltroBottom
                                                        ?.precioMaximo ==
                                                    10000000000) ||
                                                (_model.docFiltroBottom
                                                        ?.precioMaximo ==
                                                    0)
                                            ? 10000000000
                                            : _model
                                                .docFiltroBottom?.precioMaximo;
                                        _model.filtroProvincia =
                                            _model.filtroProvincia == null ||
                                                    _model.filtroProvincia == ''
                                                ? 'Todas las Provincias'
                                                : _model
                                                    .docFiltroBottom?.provincia;
                                        _model.filtroCiudad =
                                            _model.filtroCiudad == null ||
                                                    _model.filtroCiudad == ''
                                                ? ''
                                                : _model.filtroCiudad;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.0,
                            child: VerticalDivider(
                              width: 5.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 10.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  icon: Icon(
                                    Icons.search_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    _model.listaPublisMarketBuscadasResult = [];
                                    if (_model.txtFieldBuscarTextController
                                                .text !=
                                            '') {
                                      for (int loop1Index = 0;
                                          loop1Index <
                                              _model.listaPublisMarket
                                                  .where((e) =>
                                                      (e.titulo.contains(_model
                                                          .txtFieldBuscarTextController
                                                          .text)) ||
                                                      (e.descripcion.contains(_model
                                                          .txtFieldBuscarTextController
                                                          .text)))
                                                  .toList()
                                                  .length;
                                          loop1Index++) {
                                        final currentLoop1Item = _model
                                            .listaPublisMarket
                                            .where((e) =>
                                                (e.titulo.contains(_model
                                                    .txtFieldBuscarTextController
                                                    .text)) ||
                                                (e.descripcion.contains(_model
                                                    .txtFieldBuscarTextController
                                                    .text)))
                                            .toList()[loop1Index];
                                        _model
                                            .addToListaPublisMarketBuscadasResult(
                                                currentLoop1Item);
                                      }
                                      _model.modoBusqueda = true;
                                      safeSetState(() {});
                                    } else {
                                      _model.modoBusqueda = false;
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      if (!((_model.filtroCategoria == 'Todas') &&
                          (_model.filtroPrecioMinimo == 0) &&
                          (_model.filtroPrecioMaximo == 10000000000) &&
                          (_model.filtroProvincia == 'Todas las Provincias') &&
                          (_model.filtroCiudad == null ||
                              _model.filtroCiudad == '')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 15.0),
                          child: Container(
                            width: 430.0,
                            height: (_model.filtroCategoria != 'Todas') &&
                                    ((_model.filtroPrecioMinimo == 0) ||
                                        (_model.filtroPrecioMaximo ==
                                            10000000000)) &&
                                    (_model.filtroProvincia !=
                                        'Todas las Provincias')
                                ? 105.0
                                : 85.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((_model.filtroCategoria != null &&
                                          _model.filtroCategoria != '') &&
                                      (_model.filtroCategoria != 'Todas'))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 7.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(
                                                'Categoría: ${_model.filtroCategoria}',
                                                Icons.close)
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.chipCategoriaValue =
                                                    val?.firstOrNull);
                                            _model.filtroCategoria = 'Todas';
                                            safeSetState(() {});
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          chipSpacing: 8.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .chipCategoriaValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                  if (((_model.filtroPrecioMinimo != null) &&
                                          (_model.filtroPrecioMinimo! > 0)) ||
                                      ((_model.filtroPrecioMaximo != null) &&
                                          (_model.filtroPrecioMaximo! <
                                              10000000000) &&
                                          (_model.filtroPrecioMaximo! > 0)))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 7.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(() {
                                              if ((_model.filtroPrecioMinimo != null) &&
                                                  (_model.filtroPrecioMinimo !=
                                                      0) &&
                                                  (_model.filtroPrecioMaximo !=
                                                      null) &&
                                                  ((_model
                                                              .filtroPrecioMaximo !=
                                                          0) &&
                                                      (_model.filtroPrecioMaximo !=
                                                          10000000000))) {
                                                return 'Entre ${_model.filtroPrecioMinimo?.toString()} y ${_model.filtroPrecioMaximo?.toString()}';
                                              } else if (((_model
                                                              .filtroPrecioMaximo !=
                                                          null) &&
                                                      (_model.filtroPrecioMaximo !=
                                                          0) &&
                                                      (_model.filtroPrecioMaximo !=
                                                          10000000000)) &&
                                                  ((_model.filtroPrecioMinimo ==
                                                          null) ||
                                                      (_model.filtroPrecioMinimo ==
                                                          0))) {
                                                return 'Hasta ${_model.filtroPrecioMaximo?.toString()}';
                                              } else {
                                                return 'Desde ${_model.filtroPrecioMinimo?.toString()}';
                                              }
                                            }(), Icons.close)
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.chipPrecioValue =
                                                    val?.firstOrNull);
                                            _model.filtroPrecioMinimo = 0;
                                            _model.filtroPrecioMaximo =
                                                10000000000;
                                            safeSetState(() {});
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          chipSpacing: 8.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .chipPrecioValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                  if ((_model.filtroProvincia != null &&
                                          _model.filtroProvincia != '') &&
                                      (_model.filtroProvincia !=
                                          'Todas las Provincias'))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 7.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(
                                                _model.filtroCiudad != null &&
                                                        _model.filtroCiudad !=
                                                            ''
                                                    ? 'Ubicado en ${_model.filtroCiudad}, ${_model.filtroProvincia}'
                                                    : 'Ubicado en ${_model.filtroProvincia}',
                                                Icons.close)
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.chipUbicacionValue =
                                                    val?.firstOrNull);
                                            _model.filtroProvincia =
                                                'Todas las Provincias';
                                            _model.filtroCiudad = '';
                                            safeSetState(() {});
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 16.0,
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          chipSpacing: 8.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .chipUbicacionValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((_model.filtroCategoria != null &&
                              _model.filtroCategoria != '') ||
                          (_model.filtroPrecioMinimo != null) ||
                          (_model.filtroPrecioMaximo != null) ||
                          (_model.filtroProvincia != null &&
                              _model.filtroProvincia != '') ||
                          (_model.filtroCiudad != null &&
                              _model.filtroCiudad != ''))
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == 'Todas') &&
                              (_model.filtroPrecioMinimo == 0) &&
                              (_model.filtroPrecioMaximo == 10000000000) &&
                              (_model.filtroProvincia ==
                                  'Todas las Provincias') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')))
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                    NuevaPublicacionInicioWidget.routeName);
                              },
                              text: 'Publicar',
                              icon: Icon(
                                Icons.add_comment_rounded,
                                size: 25.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconAlignment: IconAlignment.end,
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == null ||
                                  _model.filtroCategoria == '') &&
                              (_model.filtroPrecioMinimo == null) &&
                              (_model.filtroPrecioMaximo == null) &&
                              (_model.filtroProvincia == null ||
                                  _model.filtroProvincia == '') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')))
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == 'Todas') &&
                              (_model.filtroPrecioMinimo == 0) &&
                              (_model.filtroPrecioMaximo == 10000000000) &&
                              (_model.filtroProvincia ==
                                  'Todas las Provincias') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')))
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              key: ValueKey('lbl_mispublis'),
                              'Mis Publicaciones',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == 'Todas') &&
                              (_model.filtroPrecioMinimo == 0) &&
                              (_model.filtroPrecioMaximo == 10000000000) &&
                              (_model.filtroProvincia ==
                                  'Todas las Provincias') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 15.0),
                          child: StreamBuilder<List<PublicacionMarketRecord>>(
                            stream: queryPublicacionMarketRecord(
                              queryBuilder: (publicacionMarketRecord) =>
                                  publicacionMarketRecord
                                      .where(
                                        'CorreoDuenio',
                                        isEqualTo:
                                            FFAppState().correoUsuarioLogueado,
                                      )
                                      .orderBy('Fecha_Publicacion',
                                          descending: true),
                              limit: 6,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PublicacionMarketRecord>
                                  contMisPublicacionsPublicacionMarketRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final listaMisPublicaciones =
                                        contMisPublicacionsPublicacionMarketRecordList
                                            .toList()
                                            .take(6)
                                            .toList();
                                    if (listaMisPublicaciones.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          child:
                                              ComponenteListaMisPublisVaciaWidget(),
                                        ),
                                      );
                                    }

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        16.0,
                                        0,
                                        16.0,
                                        0,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listaMisPublicaciones.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 8.0),
                                      itemBuilder: (context,
                                          listaMisPublicacionesIndex) {
                                        final listaMisPublicacionesItem =
                                            listaMisPublicaciones[
                                                listaMisPublicacionesIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                MarketPublicacionSeleccionadaWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'idArticuloPublicacion':
                                                      serializeParam(
                                                    listaMisPublicacionesItem
                                                        .iDPublicacion,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 190.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        child: Image.network(
                                                          listaMisPublicacionesItem
                                                              .listaURLFotos
                                                              .firstOrNull!,
                                                          width: double.infinity,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listaMisPublicacionesItem
                                                                .titulo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            listaMisPublicacionesItem
                                                                .precio
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == 'Todas') &&
                              (_model.filtroPrecioMinimo == 0) &&
                              (_model.filtroPrecioMaximo == 10000000000) &&
                              (_model.filtroProvincia ==
                                  'Todas las Provincias') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')) &&
                          (_model.listaPublisDestacadas.isNotEmpty))
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Destacados',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      if (!_model.modoBusqueda &&
                          ((_model.filtroCategoria == 'Todas') &&
                              (_model.filtroPrecioMinimo == 0) &&
                              (_model.filtroPrecioMaximo == 10000000000) &&
                              (_model.filtroProvincia ==
                                  'Todas las Provincias') &&
                              (_model.filtroCiudad == null ||
                                  _model.filtroCiudad == '')) &&
                          (_model.listaPublisDestacadas.isNotEmpty))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 12.0),
                          child: Container(
                            width: double.infinity,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<
                                      List<PublicacionMarketRecord>>(
                                    stream: queryPublicacionMarketRecord(
                                      queryBuilder: (publicacionMarketRecord) =>
                                          publicacionMarketRecord
                                              .where(
                                                'Destacado',
                                                isEqualTo: true,
                                              )
                                              .where(
                                                'CorreoDuenio',
                                                isNotEqualTo: FFAppState()
                                                    .correoUsuarioLogueado,
                                              ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<PublicacionMarketRecord>
                                          pageViewPublicacionMarketRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        height: 500.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 40.0),
                                              child: PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                pageViewPublicacionMarketRecordList
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    pageViewPublicacionMarketRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, pageViewIndex) {
                                                  final pageViewPublicacionMarketRecord =
                                                      pageViewPublicacionMarketRecordList[
                                                          pageViewIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        MarketPublicacionSeleccionadaWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'idArticuloPublicacion':
                                                              serializeParam(
                                                            pageViewPublicacionMarketRecord
                                                                .iDPublicacion,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 7,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    (String ciudad,
                                                                            String
                                                                                provincia) {
                                                                      return ciudad == '' &&
                                                                              provincia ==
                                                                                  ''
                                                                          ? '[Ubicacion]'
                                                                          : ciudad +
                                                                              ", " +
                                                                              provincia;
                                                                    }(
                                                                        pageViewPublicacionMarketRecord
                                                                            .ciudad,
                                                                        pageViewPublicacionMarketRecord
                                                                            .provincia),
                                                                    '[Ubicacion]',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    pageViewPublicacionMarketRecord
                                                                        .titulo,
                                                                    '[Titulo_Publicacion]',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (String
                                                                      precioPublicacion) {
                                                                    return (precioPublicacion ==
                                                                            '')
                                                                        ? '[Precio_publicacion]'
                                                                        : 'Precio: ' +
                                                                            precioPublicacion;
                                                                  }(pageViewPublicacionMarketRecord
                                                                      .precio
                                                                      .toString()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (String
                                                                      fechaPublicacion) {
                                                                    return "Publicado: " +
                                                                        fechaPublicacion;
                                                                  }(dateTimeFormat(
                                                                    "relative",
                                                                    pageViewPublicacionMarketRecord
                                                                        .fechaPublicacion!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          6.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      6.0),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              pageViewPublicacionMarketRecord
                                                                  .listaURLFotos
                                                                  .firstOrNull!,
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  pageViewPublicacionMarketRecordList
                                                                          .length -
                                                                      1))),
                                                  count:
                                                      pageViewPublicacionMarketRecordList
                                                          .length,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  effect: smooth_page_indicator
                                                      .SlideEffect(
                                                    spacing: 8.0,
                                                    radius: 8.0,
                                                    dotWidth: 8.0,
                                                    dotHeight: 8.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Publicaciones',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                _model.dropDownValue ??= 'Más reciente',
                              ),
                              options: [
                                'Más reciente',
                                'Menos reciente',
                                'Menor precio',
                                'Mayor precio'
                              ],
                              onChanged: (val) async {
                                safeSetState(() => _model.dropDownValue = val);
                                _model.ordenLista = _model.dropDownValue!;
                                safeSetState(() {});
                              },
                              width: 170.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              hintText: 'Ordenar por...',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!_model.modoBusqueda &&
                                  ((_model.filtroCategoria == 'Todas') &&
                                      (_model.filtroPrecioMinimo == 0) &&
                                      (_model.filtroPrecioMaximo ==
                                          10000000000) &&
                                      (_model.filtroProvincia ==
                                          'Todas las Provincias') &&
                                      (_model.filtroCiudad == null ||
                                          _model.filtroCiudad == '')))
                                Builder(
                                  builder: (context) {
                                    final listaPublisCompleta = () {
                                      if (_model.ordenLista == 'Más reciente') {
                                        return _model.listaPublisMarket
                                            .sortedList(
                                                keyOf: (e) => dateTimeFormat(
                                                      "relative",
                                                      e.fechaPublicacion!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                desc: true);
                                      } else if (_model.ordenLista ==
                                          'Menos reciente') {
                                        return _model.listaPublisMarket
                                            .sortedList(
                                                keyOf: (e) => dateTimeFormat(
                                                      "relative",
                                                      e.fechaPublicacion!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                desc: false);
                                      } else if (_model.ordenLista ==
                                          'Mayor precio') {
                                        return _model.listaPublisMarket
                                            .sortedList(
                                                keyOf: (e) => e.precio,
                                                desc: true);
                                      } else {
                                        return _model.listaPublisMarket
                                            .sortedList(
                                                keyOf: (e) => e.precio,
                                                desc: false);
                                      }
                                    }()
                                        .toList();
                                    if (listaPublisCompleta.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          child:
                                              ComponenteListaMarketVaciaWidget(
                                            esListaFiltrada: false,
                                          ),
                                        ),
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listaPublisCompleta.length,
                                      itemBuilder:
                                          (context, listaPublisCompletaIndex) {
                                        final listaPublisCompletaItem =
                                            listaPublisCompleta[
                                                listaPublisCompletaIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                MarketPublicacionSeleccionadaWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'idArticuloPublicacion':
                                                      serializeParam(
                                                    listaPublisCompletaItem
                                                        .iDPublicacion,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x411D2429),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  1.0,
                                                                  1.0,
                                                                  1.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        child: Image.network(
                                                          listaPublisCompletaItem
                                                              .listaURLFotos
                                                              .firstOrNull!,
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listaPublisCompletaItem
                                                                  .titulo,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  (String ciudad,
                                                                          String
                                                                              provincia) {
                                                                    return ciudad ==
                                                                                '' &&
                                                                            provincia ==
                                                                                ''
                                                                        ? '[Ubicacion]'
                                                                        : ciudad +
                                                                            ", " +
                                                                            provincia;
                                                                  }(
                                                                      listaPublisCompletaItem
                                                                          .ciudad,
                                                                      listaPublisCompletaItem
                                                                          .provincia),
                                                                  '[Ubicacion]',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  (String
                                                                      precio) {
                                                                    return "\$" +
                                                                        precio;
                                                                  }(listaPublisCompletaItem
                                                                      .precio
                                                                      .toString()),
                                                                  '[Precio]',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                (String
                                                                    fechaPublicacion) {
                                                                  return "Publicado: " +
                                                                      fechaPublicacion;
                                                                }(dateTimeFormat(
                                                                  "relative",
                                                                  listaPublisCompletaItem
                                                                      .fechaPublicacion!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )).maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              if (!(!_model.modoBusqueda &&
                                  ((_model.filtroCategoria == 'Todas') &&
                                      (_model.filtroPrecioMinimo == 0) &&
                                      (_model.filtroPrecioMaximo ==
                                          10000000000) &&
                                      (_model.filtroProvincia ==
                                          'Todas las Provincias') &&
                                      (_model.filtroCiudad == null ||
                                          _model.filtroCiudad == ''))))
                                Builder(
                                  builder: (context) {
                                    final listaPublisFiltradas = () {
                                      if (_model.ordenLista == 'Más reciente') {
                                        return functions
                                            .filterPublicacionesMarket(
                                                (_model.modoBusqueda
                                                        ? _model
                                                            .listaPublisMarketBuscadasResult
                                                        : _model
                                                            .listaPublisMarket)
                                                    .toList(),
                                                _model.filtroCategoria!,
                                                _model.filtroPrecioMinimo,
                                                _model.filtroPrecioMaximo,
                                                _model.filtroProvincia!,
                                                _model.filtroCiudad)
                                            .sortedList(
                                                keyOf: (e) => dateTimeFormat(
                                                      "relative",
                                                      e.fechaPublicacion!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                desc: true);
                                      } else if (_model.ordenLista ==
                                          'Menos reciente') {
                                        return functions
                                            .filterPublicacionesMarket(
                                                (_model.modoBusqueda
                                                        ? _model
                                                            .listaPublisMarketBuscadasResult
                                                        : _model
                                                            .listaPublisMarket)
                                                    .toList(),
                                                _model.filtroCategoria!,
                                                _model.filtroPrecioMinimo,
                                                _model.filtroPrecioMaximo,
                                                _model.filtroProvincia!,
                                                _model.filtroCiudad)
                                            .sortedList(
                                                keyOf: (e) => dateTimeFormat(
                                                      "relative",
                                                      e.fechaPublicacion!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                desc: false);
                                      } else if (_model.ordenLista ==
                                          'Mayor precio') {
                                        return functions
                                            .filterPublicacionesMarket(
                                                (_model.modoBusqueda
                                                        ? _model
                                                            .listaPublisMarketBuscadasResult
                                                        : _model
                                                            .listaPublisMarket)
                                                    .toList(),
                                                _model.filtroCategoria!,
                                                _model.filtroPrecioMinimo,
                                                _model.filtroPrecioMaximo,
                                                _model.filtroProvincia!,
                                                _model.filtroCiudad)
                                            .sortedList(
                                                keyOf: (e) => e.precio,
                                                desc: true);
                                      } else {
                                        return functions
                                            .filterPublicacionesMarket(
                                                (_model.modoBusqueda
                                                        ? _model
                                                            .listaPublisMarketBuscadasResult
                                                        : _model
                                                            .listaPublisMarket)
                                                    .toList(),
                                                _model.filtroCategoria!,
                                                _model.filtroPrecioMinimo,
                                                _model.filtroPrecioMaximo,
                                                _model.filtroProvincia!,
                                                _model.filtroCiudad)
                                            .sortedList(
                                                keyOf: (e) => e.precio,
                                                desc: false);
                                      }
                                    }()
                                        .toList();
                                    if (listaPublisFiltradas.isEmpty) {
                                      return ComponenteListaMarketVaciaWidget(
                                        esListaFiltrada: true,
                                      );
                                    }

                                    return ListView.builder(
                                      key: ValueKey('widget_lista_filtrada'),
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listaPublisFiltradas.length,
                                      itemBuilder:
                                          (context, listaPublisFiltradasIndex) {
                                        final listaPublisFiltradasItem =
                                            listaPublisFiltradas[
                                                listaPublisFiltradasIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x411D2429),
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 1.0,
                                                                1.0, 1.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      child: Image.network(
                                                        listaPublisFiltradasItem
                                                            .listaURLFotos
                                                            .firstOrNull!,
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listaPublisFiltradasItem
                                                                .titulo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                (String ciudad,
                                                                        String
                                                                            provincia) {
                                                                  return ciudad ==
                                                                              '' &&
                                                                          provincia ==
                                                                              ''
                                                                      ? '[Ubicacion]'
                                                                      : ciudad +
                                                                          ", " +
                                                                          provincia;
                                                                }(
                                                                    listaPublisFiltradasItem
                                                                        .ciudad,
                                                                    listaPublisFiltradasItem
                                                                        .provincia),
                                                                '[Ubicacion]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 70,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                (String
                                                                    precio) {
                                                                  return "\$" +
                                                                      precio;
                                                                }(listaPublisFiltradasItem
                                                                    .precio
                                                                    .toString()),
                                                                '[Precio]',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 70,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              (String
                                                                  fechaPublicacion) {
                                                                return "Publicado: " +
                                                                    fechaPublicacion;
                                                              }(dateTimeFormat(
                                                                "relative",
                                                                listaPublisFiltradasItem
                                                                    .fechaPublicacion!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )).maybeHandleOverflow(
                                                                maxChars: 70,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 50.0,
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
