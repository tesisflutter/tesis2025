import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/seguimiento_gastos/componente_registrar_transaccion/componente_registrar_transaccion_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagina_seguimiento_gastos_model.dart';
export 'pagina_seguimiento_gastos_model.dart';

class PaginaSeguimientoGastosWidget extends StatefulWidget {
  const PaginaSeguimientoGastosWidget({
    super.key,
    required this.listaTransaccionesMesCorrientePARAM,
    required this.balanceNetoPARAM,
  });

  final List<TransaccionRecord>? listaTransaccionesMesCorrientePARAM;
  final double? balanceNetoPARAM;

  static String routeName = 'PaginaSeguimientoGastos';
  static String routePath = '/paginaSeguimientoGastos';

  @override
  State<PaginaSeguimientoGastosWidget> createState() =>
      _PaginaSeguimientoGastosWidgetState();
}

class _PaginaSeguimientoGastosWidgetState
    extends State<PaginaSeguimientoGastosWidget> {
  late PaginaSeguimientoGastosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaginaSeguimientoGastosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryPrimeraTransaccionUsuario = await queryTransaccionRecordOnce(
        queryBuilder: (transaccionRecord) => transaccionRecord
            .where(
              'CorreoUsuario',
              isEqualTo: FFAppState().correoUsuarioLogueado,
            )
            .orderBy('FechaHoraRegistro'),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.balancePositivo = functions.calcularBalancePositivo(
          widget.listaTransaccionesMesCorrientePARAM!.toList());
      _model.balanceNegativo = functions.calcularBalanceNegativo(
          widget.listaTransaccionesMesCorrientePARAM!.toList());
      _model.balanceNetoSTATE = widget.balanceNetoPARAM!;
      _model.listaTransaccionesMesCorrienteSTATE = widget
          .listaTransaccionesMesCorrientePARAM!
          .toList()
          .cast<TransaccionRecord>();
      _model.listaMontosYCategorias = functions
          .agruparMontosPorCategorias(
              widget.listaTransaccionesMesCorrientePARAM!.toList())
          .toList()
          .cast<DuplaMontoCategoriaStruct>();
      _model.ingresosSeleccionado = true;
      _model.gastosSeleccionados = true;
      _model.fechaElegida = getCurrentTimestamp;
      _model.fechaPrimeraTransaccion =
          _model.queryPrimeraTransaccionUsuario?.fechaHoraRegistro;
      _model.listaCategoriasSeleccionadas = _model.listaMontosYCategorias
          .map((e) => e.categoria)
          .toList()
          .toList()
          .cast<String>();
      _model.listaAniosDesdeFechaPrimeraTransaccion = functions
          .obtenerListaAniosEntreFechasDadas(
              _model.fechaPrimeraTransaccion!, getCurrentTimestamp)
          .toList()
          .cast<String>();
      _model.addToListaCategoriasSeleccionadas('Todas');
      safeSetState(() {});
    });
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
        floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 100.0),
          child: FloatingActionButton.extended(
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
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ComponenteRegistrarTransaccionWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              _model.transaccionesMesOutputNuevaTransaccion =
                  await queryTransaccionRecordOnce(
                queryBuilder: (transaccionRecord) => transaccionRecord
                    .where(
                      'CorreoUsuario',
                      isEqualTo: FFAppState().correoUsuarioLogueado,
                    )
                    .where(
                      'FechaHoraRegistro',
                      isGreaterThanOrEqualTo: functions
                          .obtenerFechaInicioMesCorriente(getCurrentTimestamp),
                    )
                    .where(
                      'FechaHoraRegistro',
                      isLessThan: functions
                          .obtenerFechaInicioProxMes(getCurrentTimestamp),
                    ),
              );
              _model.listaTransaccionesMesCorrienteSTATE = _model
                  .transaccionesMesOutputNuevaTransaccion!
                  .toList()
                  .cast<TransaccionRecord>();
              _model.balancePositivo = functions.calcularBalancePositivo(
                  _model.listaTransaccionesMesCorrienteSTATE.toList());
              _model.balanceNegativo = functions.calcularBalanceNegativo(
                  _model.listaTransaccionesMesCorrienteSTATE.toList());
              _model.balanceNetoSTATE = functions.calcularBalanceNeto(
                  _model.listaTransaccionesMesCorrienteSTATE.toList());
              _model.listaMontosYCategorias = functions
                  .agruparMontosPorCategorias(
                      _model.transaccionesMesOutputNuevaTransaccion!.toList())
                  .toList()
                  .cast<DuplaMontoCategoriaStruct>();
              _model.listaCategoriasSeleccionadas = _model
                  .listaMontosYCategorias
                  .map((e) => e.categoria)
                  .toList()
                  .cast<String>();
              _model.ingresosSeleccionado = true;
              _model.gastosSeleccionados = true;
              _model.ordenLista = 'Más recientes';
              _model.fechaElegida = getCurrentTimestamp;
              safeSetState(() {});

              safeSetState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                  child: Text(
                    'Registrar transacción',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(56.0),
                child: AppBar(
                  backgroundColor: Color(0xC6243203),
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(PrincipalWidget.routeName);
                    },
                  ),
                  title: Text(
                    'Balance del mes',
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
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterFlowDropDown<String>(
                      controller: _model.dropMesValueController ??=
                          FormFieldController<String>(
                        _model.dropMesValue ??= dateTimeFormat(
                          "LLLL",
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                      ),
                      options: _model.dropAnioValue ==
                              dateTimeFormat(
                                "y",
                                _model.fechaPrimeraTransaccion,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )
                          ? functions.obtenerMesesRestantesFechaDada(
                              _model.fechaPrimeraTransaccion!)
                          : MesesAnioEnum.values.map((e) => e.name).toList(),
                      onChanged: (val) async {
                        safeSetState(() => _model.dropMesValue = val);
                        _model.fechaElegida =
                            functions.obtenerFechaDadoMesYAnio(
                                _model.dropMesValue!, _model.dropAnioValue!);
                        _model.transaccionesMesOutputCambioMes =
                            await queryTransaccionRecordOnce(
                          queryBuilder: (transaccionRecord) => transaccionRecord
                              .where(
                                'CorreoUsuario',
                                isEqualTo: FFAppState().correoUsuarioLogueado,
                              )
                              .where(
                                'FechaHoraRegistro',
                                isGreaterThanOrEqualTo:
                                    functions.obtenerFechaInicioMesCorriente(
                                        _model.fechaElegida!),
                              )
                              .where(
                                'FechaHoraRegistro',
                                isLessThan: functions.obtenerFechaInicioProxMes(
                                    _model.fechaElegida!),
                              ),
                        );
                        _model.balancePositivo =
                            functions.calcularBalancePositivo(_model
                                .transaccionesMesOutputCambioMes!
                                .toList());
                        _model.balanceNegativo =
                            functions.calcularBalanceNegativo(_model
                                .transaccionesMesOutputCambioMes!
                                .toList());
                        _model.balanceNetoSTATE = functions.calcularBalanceNeto(
                            _model.transaccionesMesOutputCambioMes!.toList());
                        _model.listaTransaccionesMesCorrienteSTATE = _model
                            .transaccionesMesOutputCambioMes!
                            .toList()
                            .cast<TransaccionRecord>();
                        _model.listaMontosYCategorias = functions
                            .agruparMontosPorCategorias(_model
                                .transaccionesMesOutputCambioMes!
                                .toList())
                            .toList()
                            .cast<DuplaMontoCategoriaStruct>();
                        _model.listaCategoriasSeleccionadas = _model
                            .listaMontosYCategorias
                            .map((e) => e.categoria)
                            .toList()
                            .cast<String>();
                        _model.ingresosSeleccionado = true;
                        _model.gastosSeleccionados = true;
                        _model.ordenLista = 'Más reciente';
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      width: 125.0,
                      height: 40.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      hintText: 'Mes...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 0.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropAnioValueController ??=
                          FormFieldController<String>(
                        _model.dropAnioValue ??= dateTimeFormat(
                          "y",
                          getCurrentTimestamp,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                      ),
                      options: _model.listaAniosDesdeFechaPrimeraTransaccion,
                      onChanged: (val) async {
                        safeSetState(() => _model.dropAnioValue = val);
                        _model.fechaElegida =
                            functions.obtenerFechaDadoMesYAnio(
                                _model.dropMesValue!, _model.dropAnioValue!);
                        _model.transaccionesMesOutpuCambioAnio =
                            await queryTransaccionRecordOnce(
                          queryBuilder: (transaccionRecord) => transaccionRecord
                              .where(
                                'CorreoUsuario',
                                isEqualTo: FFAppState().correoUsuarioLogueado,
                              )
                              .where(
                                'FechaHoraRegistro',
                                isGreaterThanOrEqualTo:
                                    functions.obtenerFechaInicioMesCorriente(
                                        _model.fechaElegida!),
                              )
                              .where(
                                'FechaHoraRegistro',
                                isLessThan: functions.obtenerFechaInicioProxMes(
                                    _model.fechaElegida!),
                              ),
                        );
                        _model.balancePositivo =
                            functions.calcularBalancePositivo(_model
                                .transaccionesMesOutpuCambioAnio!
                                .toList());
                        _model.balanceNegativo =
                            functions.calcularBalanceNegativo(_model
                                .transaccionesMesOutpuCambioAnio!
                                .toList());
                        _model.balanceNetoSTATE = functions.calcularBalanceNeto(
                            _model.transaccionesMesOutpuCambioAnio!.toList());
                        _model.listaTransaccionesMesCorrienteSTATE = _model
                            .transaccionesMesOutpuCambioAnio!
                            .toList()
                            .cast<TransaccionRecord>();
                        _model.listaMontosYCategorias = functions
                            .agruparMontosPorCategorias(_model
                                .transaccionesMesOutpuCambioAnio!
                                .toList())
                            .toList()
                            .cast<DuplaMontoCategoriaStruct>();
                        _model.listaCategoriasSeleccionadas = _model
                            .listaMontosYCategorias
                            .map((e) => e.categoria)
                            .toList()
                            .cast<String>();
                        _model.ingresosSeleccionado = true;
                        _model.gastosSeleccionados = true;
                        _model.ordenLista = 'Más reciente';
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      width: 125.0,
                      height: 40.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      hintText: 'Año...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 0.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.restart_alt,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('iconBtn_resetearFecha pressed ...');
                      },
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Text(
                        'Total: ${_model.balanceNetoSTATE < 0.0 ? '-\$' : '\$'}${(double balanceNeto) {
                          return balanceNeto.toString().replaceAll('-', '');
                        }(_model.balanceNetoSTATE)}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.ingresosSeleccionado =
                                !_model.ingresosSeleccionado;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 200.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.ingresosSeleccionado
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Text(
                                        'Ingresos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.trending_up,
                                        color: Color(0xFF07E189),
                                        size: 34.0,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    '\$${_model.balancePositivo.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 34.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.gastosSeleccionados =
                                !_model.gastosSeleccionados;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 200.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _model.gastosSeleccionados
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Text(
                                        'Gastos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.trending_down,
                                        color: Color(0xFFDB1107),
                                        size: 34.0,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 7.0)),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    '-\$${(double balanceNegativo) {
                                      return balanceNegativo
                                          .toString()
                                          .replaceAll('-', '');
                                    }(_model.balanceNegativo)}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 34.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
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
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Categorías',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height: _model.listaMontosYCategorias
                            .unique((e) => e.categoria)
                            .length *
                        50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final listaCategoriasTransacciones = _model
                            .listaMontosYCategorias
                            .map((e) => e.categoria)
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listaCategoriasTransacciones.length,
                          itemBuilder:
                              (context, listaCategoriasTransaccionesIndex) {
                            final listaCategoriasTransaccionesItem =
                                listaCategoriasTransacciones[
                                    listaCategoriasTransaccionesIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: (_model.chkCategoriaValueMap[
                                                    listaCategoriasTransaccionesItem] ==
                                                null) ||
                                            ((_model.chkCategoriaValueMap[
                                                        listaCategoriasTransaccionesItem] !=
                                                    null) &&
                                                _model.chkCategoriaValueMap[
                                                    listaCategoriasTransaccionesItem]!)
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: CircleBorder(),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        child: Checkbox(
                                          value: _model.chkCategoriaValueMap[
                                                  listaCategoriasTransaccionesItem] ??=
                                              true,
                                          onChanged: (newValue) async {
                                            safeSetState(() => _model
                                                        .chkCategoriaValueMap[
                                                    listaCategoriasTransaccionesItem] =
                                                newValue!);
                                            if (newValue!) {
                                              _model.addToListaCategoriasSeleccionadas(
                                                  listaCategoriasTransaccionesItem);
                                              safeSetState(() {});
                                            } else {
                                              _model.removeFromListaCategoriasSeleccionadas(
                                                  listaCategoriasTransaccionesItem);
                                              safeSetState(() {});
                                            }
                                          },
                                          side: (FlutterFlowTheme.of(context)
                                                      .alternate !=
                                                  null)
                                              ? BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                )
                                              : null,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      listaCategoriasTransaccionesItem,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Transacciones',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= _model.ordenLista,
                        ),
                        options: [
                          'Más reciente',
                          'Menos reciente',
                          'Menor monto',
                          'Mayor monto'
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          _model.ordenLista = _model.dropDownValue!;
                          safeSetState(() {});
                        },
                        width: 200.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
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
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height:
                        (_model.listaTransaccionesMesCorrienteSTATE.length * 90)
                            .toDouble(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final trasaccionesUsuarioMesCorriente = () {
                          if (_model.ordenLista == 'Más reciente') {
                            return _model.listaTransaccionesMesCorrienteSTATE
                                .where((e) =>
                                    (e.categoria == 'Otro...'
                                        ? _model.listaCategoriasSeleccionadas
                                            .contains('Otro...')
                                        : _model.listaCategoriasSeleccionadas
                                            .contains(e.categoria)) &&
                                    ((e.esGasto &&
                                            _model.gastosSeleccionados) ||
                                        (!e.esGasto &&
                                            _model.ingresosSeleccionado)))
                                .toList()
                                .sortedList(
                                    keyOf: (e) => e.fechaHoraRegistro!,
                                    desc: true);
                          } else if (_model.ordenLista == 'Menos reciente') {
                            return _model.listaTransaccionesMesCorrienteSTATE
                                .where((e) =>
                                    (e.categoria == 'Otro...'
                                        ? _model.listaCategoriasSeleccionadas
                                            .contains('Otro...')
                                        : _model.listaCategoriasSeleccionadas
                                            .contains(e.categoria)) &&
                                    ((e.esGasto &&
                                            _model.gastosSeleccionados) ||
                                        (!e.esGasto &&
                                            _model.ingresosSeleccionado)))
                                .toList()
                                .sortedList(
                                    keyOf: (e) => e.fechaHoraRegistro!,
                                    desc: false);
                          } else if (_model.ordenLista == 'Mayor monto') {
                            return _model.listaTransaccionesMesCorrienteSTATE
                                .where((e) =>
                                    (e.categoria == 'Otro...'
                                        ? _model.listaCategoriasSeleccionadas
                                            .contains('Otro...')
                                        : _model.listaCategoriasSeleccionadas
                                            .contains(e.categoria)) &&
                                    ((e.esGasto &&
                                            _model.gastosSeleccionados) ||
                                        (!e.esGasto &&
                                            _model.ingresosSeleccionado)))
                                .toList()
                                .sortedList(keyOf: (e) => e.monto, desc: true);
                          } else {
                            return _model.listaTransaccionesMesCorrienteSTATE
                                .where((e) =>
                                    (e.categoria == 'Otro...'
                                        ? _model.listaCategoriasSeleccionadas
                                            .contains('Otro...')
                                        : _model.listaCategoriasSeleccionadas
                                            .contains(e.categoria)) &&
                                    ((e.esGasto &&
                                            _model.gastosSeleccionados) ||
                                        (!e.esGasto &&
                                            _model.ingresosSeleccionado)))
                                .toList()
                                .sortedList(keyOf: (e) => e.monto, desc: false);
                          }
                        }()
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: trasaccionesUsuarioMesCorriente.length,
                          itemBuilder:
                              (context, trasaccionesUsuarioMesCorrienteIndex) {
                            final trasaccionesUsuarioMesCorrienteItem =
                                trasaccionesUsuarioMesCorriente[
                                    trasaccionesUsuarioMesCorrienteIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 2.0, 5.0, 2.0),
                              child: Container(
                                width: double.infinity,
                                height: 85.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 3.0, 0.0, 0.0),
                                              child: Text(
                                                trasaccionesUsuarioMesCorrienteItem
                                                    .nombre,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 3.0, 0.0, 0.0),
                                              child: Text(
                                                '${dateTimeFormat(
                                                  "HH:mm",
                                                  trasaccionesUsuarioMesCorrienteItem
                                                      .fechaHoraRegistro,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )} del ${dateTimeFormat(
                                                  "EEEE d",
                                                  trasaccionesUsuarioMesCorrienteItem
                                                      .fechaHoraRegistro,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  trasaccionesUsuarioMesCorrienteItem.esGasto
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .accent3
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: Text(
                                                  trasaccionesUsuarioMesCorrienteItem
                                                          .esGasto
                                                      ? '-\$${trasaccionesUsuarioMesCorrienteItem.monto.toString()}'
                                                      : '\$${trasaccionesUsuarioMesCorrienteItem.monto.toString()}',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
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
                                                            color: trasaccionesUsuarioMesCorrienteItem
                                                                    .esGasto
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
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
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 3.0, 3.0, 0.0),
                                              child: Text(
                                                trasaccionesUsuarioMesCorrienteItem
                                                            .categoria ==
                                                        'Otro...'
                                                    ? trasaccionesUsuarioMesCorrienteItem
                                                        .otraCategoria
                                                    : trasaccionesUsuarioMesCorrienteItem
                                                        .categoria,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
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
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Divider(
                    height: 120.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
