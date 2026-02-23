import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mis_caballos_widget.dart' show MisCaballosWidget;
import 'package:flutter/material.dart';

class MisCaballosModel extends FlutterFlowModel<MisCaballosWidget> {
  ///  Local state fields for this page.

  List<EquinoRecord> listaCaballos = [];
  void addToListaCaballos(EquinoRecord item) => listaCaballos.add(item);
  void removeFromListaCaballos(EquinoRecord item) => listaCaballos.remove(item);
  void removeAtIndexFromListaCaballos(int index) =>
      listaCaballos.removeAt(index);
  void insertAtIndexInListaCaballos(int index, EquinoRecord item) =>
      listaCaballos.insert(index, item);
  void updateListaCaballosAtIndex(int index, Function(EquinoRecord) updateFn) =>
      listaCaballos[index] = updateFn(listaCaballos[index]);

  List<EquinoRecord> listaCaballosBuscadosResult = [];
  void addToListaCaballosBuscadosResult(EquinoRecord item) =>
      listaCaballosBuscadosResult.add(item);
  void removeFromListaCaballosBuscadosResult(EquinoRecord item) =>
      listaCaballosBuscadosResult.remove(item);
  void removeAtIndexFromListaCaballosBuscadosResult(int index) =>
      listaCaballosBuscadosResult.removeAt(index);
  void insertAtIndexInListaCaballosBuscadosResult(
          int index, EquinoRecord item) =>
      listaCaballosBuscadosResult.insert(index, item);
  void updateListaCaballosBuscadosResultAtIndex(
          int index, Function(EquinoRecord) updateFn) =>
      listaCaballosBuscadosResult[index] =
          updateFn(listaCaballosBuscadosResult[index]);

  bool modoBusqueda = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Mis_Caballos widget.
  List<EquinoRecord>? queryListaCaballosUsuarioLogueado;
  // State field(s) for txtField_buscar widget.
  final txtFieldBuscarKey = GlobalKey();
  FocusNode? txtFieldBuscarFocusNode;
  TextEditingController? txtFieldBuscarTextController;
  String? txtFieldBuscarSelectedOption;
  String? Function(BuildContext, String?)?
      txtFieldBuscarTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in VerHistoriaClinica widget.
  HistoriaClinicaRecord? queryHistoriaClinicaCaballo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldBuscarFocusNode?.dispose();
  }
}
