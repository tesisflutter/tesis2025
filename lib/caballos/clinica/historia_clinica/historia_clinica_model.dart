import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'historia_clinica_widget.dart' show HistoriaClinicaWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HistoriaClinicaModel extends FlutterFlowModel<HistoriaClinicaWidget> {
  ///  Local state fields for this page.

  List<VisitaVeterinariaRecord> listaVisitasVeterinarias = [];
  void addToListaVisitasVeterinarias(VisitaVeterinariaRecord item) =>
      listaVisitasVeterinarias.add(item);
  void removeFromListaVisitasVeterinarias(VisitaVeterinariaRecord item) =>
      listaVisitasVeterinarias.remove(item);
  void removeAtIndexFromListaVisitasVeterinarias(int index) =>
      listaVisitasVeterinarias.removeAt(index);
  void insertAtIndexInListaVisitasVeterinarias(
          int index, VisitaVeterinariaRecord item) =>
      listaVisitasVeterinarias.insert(index, item);
  void updateListaVisitasVeterinariasAtIndex(
          int index, Function(VisitaVeterinariaRecord) updateFn) =>
      listaVisitasVeterinarias[index] =
          updateFn(listaVisitasVeterinarias[index]);

  MedicoVeterinarioRecord? veterinarioCabecera;

  /// Un filtro sencillo que determina si se muestran todas las visitas
  /// veterinarias leídas en la DB, o solamente las que representan una
  /// instancia de vacunación.
  String opcionTablaVisitas = 'Todas';

  HistoriaClinicaRecord? historiaClinicaCaballoSTATE;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Historia_Clinica widget.
  List<VisitaVeterinariaRecord>? queryVisitasCaballoSeleccionado;
  // Stores action output result for [Firestore Query - Query a collection] action in Historia_Clinica widget.
  MedicoVeterinarioRecord? queryVeteCabecera;
  // Stores action output result for [Firestore Query - Query a collection] action in Historia_Clinica widget.
  HistoriaClinicaRecord? queryUltimaHistClinicaCreada;
  // Stores action output result for [Backend Call - Create Document] action in Historia_Clinica widget.
  HistoriaClinicaRecord? outputNuevaHistClinica;
  // State field(s) for choice_TipoTabla widget.
  FormFieldController<List<String>>? choiceTipoTablaValueController;
  String? get choiceTipoTablaValue =>
      choiceTipoTablaValueController?.value?.firstOrNull;
  set choiceTipoTablaValue(String? val) =>
      choiceTipoTablaValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
