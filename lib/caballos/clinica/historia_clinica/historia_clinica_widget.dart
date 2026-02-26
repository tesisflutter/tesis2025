import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'historia_clinica_model.dart';
export 'historia_clinica_model.dart';

class HistoriaClinicaWidget extends StatefulWidget {
  const HistoriaClinicaWidget({
    super.key,
    required this.caballoSeleccionado,
    required this.historiaClinicaCaballoPARAM,
  });

  final EquinoRecord? caballoSeleccionado;
  final HistoriaClinicaRecord? historiaClinicaCaballoPARAM;

  static String routeName = 'Historia_Clinica';
  static String routePath = '/historiaClinica';

  @override
  State<HistoriaClinicaWidget> createState() => _HistoriaClinicaWidgetState();
}

class _HistoriaClinicaWidgetState extends State<HistoriaClinicaWidget> {
  late HistoriaClinicaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoriaClinicaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryVisitasCaballoSeleccionado =
          await queryVisitaVeterinariaRecordOnce(
        queryBuilder: (visitaVeterinariaRecord) => visitaVeterinariaRecord
            .where(
              'Correo_Duenio_Caballo',
              isEqualTo: FFAppState().correoUsuarioLogueado,
            )
            .where(
              'Nombre_Caballo',
              isEqualTo: widget.caballoSeleccionado?.nombre,
            ),
      );
      _model.queryVeteCabecera = await queryMedicoVeterinarioRecordOnce(
        queryBuilder: (medicoVeterinarioRecord) =>
            medicoVeterinarioRecord.where(
          'ID_Medico_Veterinario',
          isEqualTo: FFAppState().idVeterinarioCabecera,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.listaVisitasVeterinarias = _model
          .queryVisitasCaballoSeleccionado!
          .toList()
          .cast<VisitaVeterinariaRecord>();
      _model.veterinarioCabecera = _model.queryVeteCabecera;
    
      if (widget.historiaClinicaCaballoPARAM != null) {
        _model.historiaClinicaCaballoSTATE =
            widget.historiaClinicaCaballoPARAM;
        safeSetState(() {});
      } else {
        _model.queryUltimaHistClinicaCreada =
            await queryHistoriaClinicaRecordOnce(
          queryBuilder: (historiaClinicaRecord) => historiaClinicaRecord
              .orderBy('ID_Historia_Clinica', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        var historiaClinicaRecordReference =
            HistoriaClinicaRecord.collection.doc();
        await historiaClinicaRecordReference
            .set(createHistoriaClinicaRecordData(
          iDHistoriaClinica:
              _model.queryUltimaHistClinicaCreada?.reference != null
                  ? (_model.queryUltimaHistClinicaCreada!.iDHistoriaClinica + 1)
                  : 1,
          nombreCaballo: widget.caballoSeleccionado?.nombre,
          correoDuenioCaballo: FFAppState().correoUsuarioLogueado,
          iDCaballo: widget.caballoSeleccionado?.iDEquino,
          correoMedicoVeterinarioCabecera: _model.veterinarioCabecera != null
              ? _model.veterinarioCabecera?.correo
              : '',
        ));
        _model.outputNuevaHistClinica =
            HistoriaClinicaRecord.getDocumentFromData(
                createHistoriaClinicaRecordData(
                  iDHistoriaClinica:
                      _model.queryUltimaHistClinicaCreada?.reference != null
                          ? (_model.queryUltimaHistClinicaCreada!
                                  .iDHistoriaClinica +
                              1)
                          : 1,
                  nombreCaballo: widget.caballoSeleccionado?.nombre,
                  correoDuenioCaballo: FFAppState().correoUsuarioLogueado,
                  iDCaballo: widget.caballoSeleccionado?.iDEquino,
                  correoMedicoVeterinarioCabecera:
                      _model.veterinarioCabecera != null
                          ? _model.veterinarioCabecera?.correo
                          : '',
                ),
                historiaClinicaRecordReference);
        _model.historiaClinicaCaballoSTATE = _model.outputNuevaHistClinica;
        safeSetState(() {});
      }
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
              context.pushNamed(
                NuevaVisitaVeterinariaWidget.routeName,
                queryParameters: {
                  'caballoSeleccionado': serializeParam(
                    widget.caballoSeleccionado,
                    ParamType.Document,
                  ),
                  'veterinarioCabecera': serializeParam(
                    _model.veterinarioCabecera,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'caballoSeleccionado': widget.caballoSeleccionado,
                  'veterinarioCabecera': _model.veterinarioCabecera,
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                  child: Text(
                    'Registrar visita',
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
            ? AppBar(
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
                    context.safePop();
                  },
                ),
                title: Text(
                  'Historia Clínica de ${widget.caballoSeleccionado?.nombre}',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0.0,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Médico Veterinario de cabecera:',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      _model.veterinarioCabecera != null
                                          ? '${_model.veterinarioCabecera?.nombre} ${_model.veterinarioCabecera?.apellido}'
                                          : '- No tiene-',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!(_model.veterinarioCabecera != null))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          NuevoVeterinarioCabeceraWidget
                                              .routeName,
                                          queryParameters: {
                                            'caballoSeleccionado':
                                                serializeParam(
                                              widget.caballoSeleccionado,
                                              ParamType.Document,
                                            ),
                                            'historiaClinicaCaballo':
                                                serializeParam(
                                              _model
                                                  .historiaClinicaCaballoSTATE,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'caballoSeleccionado':
                                                widget.caballoSeleccionado,
                                            'historiaClinicaCaballo': _model
                                                .historiaClinicaCaballoSTATE,
                                          },
                                        );
                                      },
                                      text: 'Agregar',
                                      icon: Icon(
                                        Icons.add,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (_model.veterinarioCabecera != null)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          icon: Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path: _model
                                                  .veterinarioCabecera!.telefono
                                                  .toString(),
                                            ));
                                          },
                                        ),
                                      if (_model.veterinarioCabecera != null)
                                        FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              FichaVeterinarioWidget.routeName,
                                              queryParameters: {
                                                'docVeterinario':
                                                    serializeParam(
                                                  _model.veterinarioCabecera,
                                                  ParamType.Document,
                                                ),
                                                'caballoSeleccionado':
                                                    serializeParam(
                                                  widget.caballoSeleccionado,
                                                  ParamType.Document,
                                                ),
                                                'historiaClinicaCaballo':
                                                    serializeParam(
                                                  _model
                                                      .historiaClinicaCaballoSTATE,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'docVeterinario':
                                                    _model.veterinarioCabecera,
                                                'caballoSeleccionado':
                                                    widget.caballoSeleccionado,
                                                'historiaClinicaCaballo': _model
                                                    .historiaClinicaCaballoSTATE,
                                              },
                                            );
                                          },
                                        ),
                                    ].divide(SizedBox(width: 20.0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Divider(
                  height: 30.0,
                  thickness: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Text(
                        'Visitas veterinarias:',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('Todas'),
                              ChipData('Vacunación')
                            ],
                            onChanged: (val) async {
                              safeSetState(() => _model.choiceTipoTablaValue =
                                  val?.firstOrNull);
                              _model.opcionTablaVisitas =
                                  _model.choiceTipoTablaValue!;
                              safeSetState(() {});
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
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
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).info,
                              iconSize: 16.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 16.0,
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            chipSpacing: 8.0,
                            rowSpacing: 8.0,
                            multiselect: false,
                            initialized: _model.choiceTipoTablaValue != null,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.choiceTipoTablaValueController ??=
                                    FormFieldController<List<String>>(
                              ['Todas'],
                            ),
                            wrapped: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_model.listaVisitasVeterinarias.isNotEmpty)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: _model.listaVisitasVeterinarias.length * (MediaQuery.of(context).size.width < 400 ? 200.0 : 125.0),
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final intervencion = _model.listaVisitasVeterinarias
                            .where((e) => _model.opcionTablaVisitas == 'Todas'
                                ? true
                                : (e.motivo == 'Vacunación'))
                            .toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: intervencion.length,
                          itemBuilder: (context, intervencionIndex) {
                            final intervencionItem =
                                intervencion[intervencionIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child:
                                  StreamBuilder<List<MedicoVeterinarioRecord>>(
                                stream: queryMedicoVeterinarioRecord(
                                  queryBuilder: (medicoVeterinarioRecord) =>
                                      medicoVeterinarioRecord.where(
                                    'Correo',
                                    isEqualTo: intervencionItem
                                        .correoMedicoVeterinario,
                                  ),
                                  singleRecord: true,
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
                                  List<MedicoVeterinarioRecord>
                                      containerMedicoVeterinarioRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerMedicoVeterinarioRecord =
                                      containerMedicoVeterinarioRecordList
                                              .isNotEmpty
                                          ? containerMedicoVeterinarioRecordList
                                              .first
                                          : null;

                                  final _isCompact = MediaQuery.of(context).size.width < 400;
                                  final _dateWidget = Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                        "dd/MM/yyyy",
                                        intervencionItem.fechaVisita!,
                                        locale: FFLocalizations.of(context).languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                            ),
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                          ),
                                    ),
                                  );
                                  final _vetInfoWidget = Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      'Vet.: ${containerMedicoVeterinarioRecord?.nombre} ${containerMedicoVeterinarioRecord?.apellido}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                          ),
                                    ),
                                  );
                                  final _motivoWidget = Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      intervencionItem.motivo,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                          ),
                                    ),
                                  );
                                  final _montoWidget = Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                    child: Text(
                                      '\$${intervencionItem.monto.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                          ),
                                    ),
                                  );
                                  final _verDetalleBtn = Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          VisitaVeterinariaWidget.routeName,
                                          queryParameters: {
                                            'caballoSeleccionado': serializeParam(
                                              widget.caballoSeleccionado,
                                              ParamType.Document,
                                            ),
                                            'veterinarioDeLaVisita': serializeParam(
                                              containerMedicoVeterinarioRecord,
                                              ParamType.Document,
                                            ),
                                            'visitaVeterinariaSeleccionada': serializeParam(
                                              intervencionItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'caballoSeleccionado': widget.caballoSeleccionado,
                                            'veterinarioDeLaVisita': containerMedicoVeterinarioRecord,
                                            'visitaVeterinariaSeleccionada': intervencionItem,
                                          },
                                        );
                                      },
                                      text: 'Ver Detalle',
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context).primary,
                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                        ),
                                        elevation: 0.0,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  );

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: _isCompact
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Flexible(child: _dateWidget),
                                                    SizedBox(width: 8.0),
                                                    Flexible(child: _motivoWidget),
                                                  ],
                                                ),
                                                SizedBox(height: 4.0),
                                                _vetInfoWidget,
                                                SizedBox(height: 4.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(child: _montoWidget),
                                                    _verDetalleBtn,
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _dateWidget,
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Vet.:',
                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 3.0, 0.0, 0.0),
                                                        child: Text(
                                                          '${containerMedicoVeterinarioRecord?.nombre} ${containerMedicoVeterinarioRecord?.apellido}',
                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                            font: GoogleFonts.outfit(
                                                              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      _motivoWidget,
                                                      _montoWidget,
                                                      _verDetalleBtn,
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}