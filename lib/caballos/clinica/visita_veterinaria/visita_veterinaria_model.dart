import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'visita_veterinaria_widget.dart' show VisitaVeterinariaWidget;
import 'package:flutter/material.dart';

class VisitaVeterinariaModel extends FlutterFlowModel<VisitaVeterinariaWidget> {
  ///  Local state fields for this page.

  List<MedicoVeterinarioRecord> listaVeterinariosUsuario = [];
  void addToListaVeterinariosUsuario(MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.add(item);
  void removeFromListaVeterinariosUsuario(MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.remove(item);
  void removeAtIndexFromListaVeterinariosUsuario(int index) =>
      listaVeterinariosUsuario.removeAt(index);
  void insertAtIndexInListaVeterinariosUsuario(
          int index, MedicoVeterinarioRecord item) =>
      listaVeterinariosUsuario.insert(index, item);
  void updateListaVeterinariosUsuarioAtIndex(
          int index, Function(MedicoVeterinarioRecord) updateFn) =>
      listaVeterinariosUsuario[index] =
          updateFn(listaVeterinariosUsuario[index]);

  int? idVeterinarioSeleccionado;

  /// La lista de nombre y apellido a rellenar en el dropdown
  List<String> listaNombresVeterinarios = [];
  void addToListaNombresVeterinarios(String item) =>
      listaNombresVeterinarios.add(item);
  void removeFromListaNombresVeterinarios(String item) =>
      listaNombresVeterinarios.remove(item);
  void removeAtIndexFromListaNombresVeterinarios(int index) =>
      listaNombresVeterinarios.removeAt(index);
  void insertAtIndexInListaNombresVeterinarios(int index, String item) =>
      listaNombresVeterinarios.insert(index, item);
  void updateListaNombresVeterinariosAtIndex(
          int index, Function(String) updateFn) =>
      listaNombresVeterinarios[index] =
          updateFn(listaNombresVeterinarios[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Visita_Veterinaria widget.
  List<MedicoVeterinarioRecord>? queryVeterinariosDeUsuario;
  // State field(s) for txtField_nombreVete widget.
  FocusNode? txtFieldNombreVeteFocusNode;
  TextEditingController? txtFieldNombreVeteTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreVeteTextControllerValidator;
  // State field(s) for txtField_veteContacto widget.
  FocusNode? txtFieldVeteContactoFocusNode;
  TextEditingController? txtFieldVeteContactoTextController;
  String? Function(BuildContext, String?)?
      txtFieldVeteContactoTextControllerValidator;
  // State field(s) for txtField_veteCorreo widget.
  FocusNode? txtFieldVeteCorreoFocusNode;
  TextEditingController? txtFieldVeteCorreoTextController;
  String? Function(BuildContext, String?)?
      txtFieldVeteCorreoTextControllerValidator;
  // State field(s) for txtField_motivoVisita widget.
  FocusNode? txtFieldMotivoVisitaFocusNode;
  TextEditingController? txtFieldMotivoVisitaTextController;
  String? Function(BuildContext, String?)?
      txtFieldMotivoVisitaTextControllerValidator;
  // State field(s) for txtField_nombreVacuna widget.
  FocusNode? txtFieldNombreVacunaFocusNode;
  TextEditingController? txtFieldNombreVacunaTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreVacunaTextControllerValidator;
  // State field(s) for txtField_NroLoteVacuna widget.
  FocusNode? txtFieldNroLoteVacunaFocusNode;
  TextEditingController? txtFieldNroLoteVacunaTextController;
  String? Function(BuildContext, String?)?
      txtFieldNroLoteVacunaTextControllerValidator;
  // State field(s) for txtField_Enfermedades widget.
  FocusNode? txtFieldEnfermedadesFocusNode;
  TextEditingController? txtFieldEnfermedadesTextController;
  String? Function(BuildContext, String?)?
      txtFieldEnfermedadesTextControllerValidator;
  // State field(s) for txtField_Dosis widget.
  FocusNode? txtFieldDosisFocusNode;
  TextEditingController? txtFieldDosisTextController;
  String? Function(BuildContext, String?)? txtFieldDosisTextControllerValidator;
  // State field(s) for txtField_Dias widget.
  FocusNode? txtFieldDiasFocusNode;
  TextEditingController? txtFieldDiasTextController;
  String? Function(BuildContext, String?)? txtFieldDiasTextControllerValidator;
  // State field(s) for txtField_Provincia widget.
  FocusNode? txtFieldProvinciaFocusNode;
  TextEditingController? txtFieldProvinciaTextController;
  String? Function(BuildContext, String?)?
      txtFieldProvinciaTextControllerValidator;
  // State field(s) for txtField_Ciudad widget.
  FocusNode? txtFieldCiudadFocusNode;
  TextEditingController? txtFieldCiudadTextController;
  String? Function(BuildContext, String?)?
      txtFieldCiudadTextControllerValidator;
  // State field(s) for txtField_Monto widget.
  FocusNode? txtFieldMontoFocusNode;
  TextEditingController? txtFieldMontoTextController;
  String? Function(BuildContext, String?)? txtFieldMontoTextControllerValidator;
  // State field(s) for txtField_Observaciones widget.
  FocusNode? txtFieldObservacionesFocusNode;
  TextEditingController? txtFieldObservacionesTextController;
  String? Function(BuildContext, String?)?
      txtFieldObservacionesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFieldNombreVeteFocusNode?.dispose();
    txtFieldNombreVeteTextController?.dispose();

    txtFieldVeteContactoFocusNode?.dispose();
    txtFieldVeteContactoTextController?.dispose();

    txtFieldVeteCorreoFocusNode?.dispose();
    txtFieldVeteCorreoTextController?.dispose();

    txtFieldMotivoVisitaFocusNode?.dispose();
    txtFieldMotivoVisitaTextController?.dispose();

    txtFieldNombreVacunaFocusNode?.dispose();
    txtFieldNombreVacunaTextController?.dispose();

    txtFieldNroLoteVacunaFocusNode?.dispose();
    txtFieldNroLoteVacunaTextController?.dispose();

    txtFieldEnfermedadesFocusNode?.dispose();
    txtFieldEnfermedadesTextController?.dispose();

    txtFieldDosisFocusNode?.dispose();
    txtFieldDosisTextController?.dispose();

    txtFieldDiasFocusNode?.dispose();
    txtFieldDiasTextController?.dispose();

    txtFieldProvinciaFocusNode?.dispose();
    txtFieldProvinciaTextController?.dispose();

    txtFieldCiudadFocusNode?.dispose();
    txtFieldCiudadTextController?.dispose();

    txtFieldMontoFocusNode?.dispose();
    txtFieldMontoTextController?.dispose();

    txtFieldObservacionesFocusNode?.dispose();
    txtFieldObservacionesTextController?.dispose();
  }
}
