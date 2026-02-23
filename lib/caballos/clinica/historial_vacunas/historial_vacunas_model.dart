import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historial_vacunas_widget.dart' show HistorialVacunasWidget;
import 'package:flutter/material.dart';

class HistorialVacunasModel extends FlutterFlowModel<HistorialVacunasWidget> {
  ///  Local state fields for this page.

  List<VacunacionRecord> listaVacuna = [];
  void addToListaVacuna(VacunacionRecord item) => listaVacuna.add(item);
  void removeFromListaVacuna(VacunacionRecord item) => listaVacuna.remove(item);
  void removeAtIndexFromListaVacuna(int index) => listaVacuna.removeAt(index);
  void insertAtIndexInListaVacuna(int index, VacunacionRecord item) =>
      listaVacuna.insert(index, item);
  void updateListaVacunaAtIndex(
          int index, Function(VacunacionRecord) updateFn) =>
      listaVacuna[index] = updateFn(listaVacuna[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Historial_Vacunas widget.
  List<VacunacionRecord>? listVac;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<VacunacionRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
