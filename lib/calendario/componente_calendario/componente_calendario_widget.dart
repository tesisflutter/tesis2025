import '/backend/backend.dart';
import '/calendario/componente_lbl_dia/componente_lbl_dia_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_calendario_model.dart';
export 'componente_calendario_model.dart';

class ComponenteCalendarioWidget extends StatefulWidget {
  const ComponenteCalendarioWidget({
    super.key,
    this.accionSeleccionFecha,
    this.fechaActual,
  });

  /// Acción disparada al seleccionar otra fecha (updatea la var.
  ///
  /// echaSeleccionada de la página que contiene a este componente)
  final Future Function(DateTime fechaSeleccionada)? accionSeleccionFecha;

  final DateTime? fechaActual;

  @override
  State<ComponenteCalendarioWidget> createState() =>
      _ComponenteCalendarioWidgetState();
}

class _ComponenteCalendarioWidgetState
    extends State<ComponenteCalendarioWidget> {
  late ComponenteCalendarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteCalendarioModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Esto es una duplicación del query que hacemos en la PaginaCalendario, pero es necesaria porque al ser este un componente embebido en la misma, se cargan a la vez. No podemos hacer la query en esa página y DESPUÉS pasarla acá secuencialmente.
      _model.queryEventosUsuarioLogueadoOutput =
          await queryEventoCalendarioRecordOnce(
        queryBuilder: (eventoCalendarioRecord) => eventoCalendarioRecord
            .where(
              'CorreoUsuario',
              isEqualTo: FFAppState().correoUsuarioLogueado,
            )
            .orderBy('FechaHora'),
      );
      for (int loop1Index = 0;
          loop1Index < _model.queryEventosUsuarioLogueadoOutput!.length;
          loop1Index++) {
        final currentLoop1Item =
            _model.queryEventosUsuarioLogueadoOutput![loop1Index];
        // Con la lista de los eventos del usuario logueado, las hacemos tener hora cero y las agregamos a la variable de estado correspondiente, así pueden verse en el iconito del calendario (todos los días mostrados en el calendario tienen hora cero)
        _model.addToListaFechasEventosHoraCero(
            functions.obtenerFechaConHoraCero(currentLoop1Item.fechaHora!));
      }
      _model.fechaDeMesSeleccionado = widget.fechaActual;
      _model.listaEventosFechaSeleccionada = [];
      _model.fechaSeleccionada = widget.fechaActual;
      _model.listaEventosUsuarioLogueado = _model
          .queryEventosUsuarioLogueadoOutput!
          .toList()
          .cast<EventoCalendarioRecord>();
      safeSetState(() {});

      _model.updatePage(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 466.0,
      height: 485.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "MMMM",
                                          _model.fechaDeMesSeleccionado,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          "y",
                                          _model.fechaDeMesSeleccionado,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Transform.rotate(
                                      angle: 180.0 * (math.pi / 180),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 26.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          _model.fechaDeMesSeleccionado = functions
                                              .obtenerFechaInicioAnteriorMes(
                                                  _model
                                                      .fechaDeMesSeleccionado!);
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 26.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        _model.fechaDeMesSeleccionado =
                                            functions.obtenerFechaInicioProxMes(
                                                _model.fechaDeMesSeleccionado!);
                                        safeSetState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]
                              .divide(SizedBox(width: 6.0))
                              .around(SizedBox(width: 6.0)),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 0.0,
                        buttonSize: 34.0,
                        icon: Icon(
                          Icons.restart_alt_sharp,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.fechaDeMesSeleccionado = getCurrentTimestamp;
                          _model.fechaSeleccionada = getCurrentTimestamp;
                          safeSetState(() {});
                          await widget.accionSeleccionFecha?.call(
                            widget.fechaActual!,
                          );
                        },
                      ),
                    ]
                        .addToStart(SizedBox(width: 24.0))
                        .addToEnd(SizedBox(width: 24.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: ' Lun',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: 'Mar',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: 'Mie',
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.componenteLblDiaModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: ComponenteLblDiaWidget(
                          day: 'Jue',
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: 'Vie',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: 'Sab',
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: wrapWithModel(
                          model: _model.componenteLblDiaModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: ComponenteLblDiaWidget(
                            day: 'Dom',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 360.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final calendarioVar = functions
                            .obtenerListaDiasCalendarioParaMesDado(
                                _model.fechaDeMesSeleccionado!)
                            .toList();

                        return GridView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            5.0,
                            0,
                            0,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 18.0,
                            mainAxisSpacing: 12.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: calendarioVar.length,
                          itemBuilder: (context, calendarioVarIndex) {
                            final calendarioVarItem =
                                calendarioVar[calendarioVarIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.fechaSeleccionada =
                                    calendarioVarItem.fechaCalendario;
                                safeSetState(() {});
                                await widget.accionSeleccionFecha?.call(
                                  _model.fechaSeleccionada!,
                                );
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: dateTimeFormat(
                                            "d/M/y",
                                            calendarioVarItem.fechaCalendario,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) ==
                                          dateTimeFormat(
                                            "d/M/y",
                                            _model.fechaSeleccionada,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: dateTimeFormat(
                                              "d/M/y",
                                              calendarioVarItem.fechaCalendario,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) ==
                                            dateTimeFormat(
                                              "d/M/y",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0x00000000),
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Text(
                                        dateTimeFormat(
                                          "d",
                                          dateTimeFromSecondsSinceEpoch(
                                              valueOrDefault<int>(
                                            calendarioVarItem.fechaCalendario
                                                ?.secondsSinceEpoch,
                                            0,
                                          )),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  calendarioVarItem
                                                              .esMesAnterior ||
                                                          calendarioVarItem
                                                              .esMesProximo
                                                      ? (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarioVarItem
                                                                    .fechaCalendario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .fechaSeleccionada,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText)
                                                      : (dateTimeFormat(
                                                                "d/M/y",
                                                                calendarioVarItem
                                                                    .fechaCalendario,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                _model
                                                                    .fechaSeleccionada,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      if (_model.listaFechasEventosHoraCero
                                          .contains(calendarioVarItem
                                              .fechaCalendario))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.85, -1.0),
                                          child: Icon(
                                            Icons.bookmark_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 12.0,
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
              ].addToStart(SizedBox(height: 16.0)),
            ),
          ),
          if (_model.listaFechasEventosHoraCero.contains(
              functions.obtenerFechaConHoraCero(_model.fechaSeleccionada!)))
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.listaEventosFechaSeleccionada = [];
                    for (int loop1Index = 0;
                        loop1Index <
                            _model.listaEventosUsuarioLogueado
                                .where((e) => functions.esMismaFecha(
                                    functions
                                        .obtenerFechaConHoraCero(e.fechaHora!),
                                    _model.fechaSeleccionada!))
                                .toList()
                                .length;
                        loop1Index++) {
                      final currentLoop1Item = _model
                          .listaEventosUsuarioLogueado
                          .where((e) => functions.esMismaFecha(
                              functions.obtenerFechaConHoraCero(e.fechaHora!),
                              _model.fechaSeleccionada!))
                          .toList()[loop1Index];
                      _model
                          .addToListaEventosFechaSeleccionada(currentLoop1Item);
                    }

                    context.pushNamed(
                      PaginaEventosDeUnDiaWidget.routeName,
                      queryParameters: {
                        'fechaSeleccionada': serializeParam(
                          _model.fechaSeleccionada,
                          ParamType.DateTime,
                        ),
                        'listaEventosPARAM': serializeParam(
                          _model.listaEventosFechaSeleccionada,
                          ParamType.Document,
                          isList: true,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'listaEventosPARAM':
                            _model.listaEventosFechaSeleccionada,
                      },
                    );
                  },
                  text: 'Ver Eventos',
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 30.0,
                  ),
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconAlignment: IconAlignment.end,
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
