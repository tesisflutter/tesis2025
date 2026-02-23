import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'pagina_evento_calendario_widget.dart' show PaginaEventoCalendarioWidget;
import 'package:flutter/material.dart';

class PaginaEventoCalendarioModel
    extends FlutterFlowModel<PaginaEventoCalendarioWidget> {
  ///  Local state fields for this page.

  DateTime? horarioElegido;

  String otroTipoText = ' ';

  List<EventoCalendarioRecord> listaEventosFechaSeleccionadaSTATE = [];
  void addToListaEventosFechaSeleccionadaSTATE(EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionadaSTATE.add(item);
  void removeFromListaEventosFechaSeleccionadaSTATE(
          EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionadaSTATE.remove(item);
  void removeAtIndexFromListaEventosFechaSeleccionadaSTATE(int index) =>
      listaEventosFechaSeleccionadaSTATE.removeAt(index);
  void insertAtIndexInListaEventosFechaSeleccionadaSTATE(
          int index, EventoCalendarioRecord item) =>
      listaEventosFechaSeleccionadaSTATE.insert(index, item);
  void updateListaEventosFechaSeleccionadaSTATEAtIndex(
          int index, Function(EventoCalendarioRecord) updateFn) =>
      listaEventosFechaSeleccionadaSTATE[index] =
          updateFn(listaEventosFechaSeleccionadaSTATE[index]);

  /// Lista de booleanos que determina si hay notificaciones, y cuándo.
  ///
  /// 3 items:
  /// 0: 1 semana antes
  /// 1: 1 día antes
  /// 2: 1 hora antes
  List<bool> listaNotifs = [false, false, false];
  void addToListaNotifs(bool item) => listaNotifs.add(item);
  void removeFromListaNotifs(bool item) => listaNotifs.remove(item);
  void removeAtIndexFromListaNotifs(int index) => listaNotifs.removeAt(index);
  void insertAtIndexInListaNotifs(int index, bool item) =>
      listaNotifs.insert(index, item);
  void updateListaNotifsAtIndex(int index, Function(bool) updateFn) =>
      listaNotifs[index] = updateFn(listaNotifs[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtField_nombre widget.
  FocusNode? txtFieldNombreFocusNode;
  TextEditingController? txtFieldNombreTextController;
  String? Function(BuildContext, String?)?
      txtFieldNombreTextControllerValidator;
  String? _txtFieldNombreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor ingresar nombre del evento';
    }

    return null;
  }

  // State field(s) for drop_tipo widget.
  String? dropTipoValue;
  FormFieldController<String>? dropTipoValueController;
  // State field(s) for txtField_otroTipo widget.
  FocusNode? txtFieldOtroTipoFocusNode;
  TextEditingController? txtFieldOtroTipoTextController;
  String? Function(BuildContext, String?)?
      txtFieldOtroTipoTextControllerValidator;
  String? _txtFieldOtroTipoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor especificar el tipo';
    }

    return null;
  }

  // State field(s) for txtField_Horario widget.
  FocusNode? txtFieldHorarioFocusNode;
  TextEditingController? txtFieldHorarioTextController;
  String? Function(BuildContext, String?)?
      txtFieldHorarioTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for txtField_descripcion widget.
  FocusNode? txtFieldDescripcionFocusNode;
  TextEditingController? txtFieldDescripcionTextController;
  String? Function(BuildContext, String?)?
      txtFieldDescripcionTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_GuardarCambios widget.
  EventoCalendarioRecord? eventoModificado;

  @override
  void initState(BuildContext context) {
    txtFieldNombreTextControllerValidator =
        _txtFieldNombreTextControllerValidator;
    txtFieldOtroTipoTextControllerValidator =
        _txtFieldOtroTipoTextControllerValidator;
  }

  @override
  void dispose() {
    txtFieldNombreFocusNode?.dispose();
    txtFieldNombreTextController?.dispose();

    txtFieldOtroTipoFocusNode?.dispose();
    txtFieldOtroTipoTextController?.dispose();

    txtFieldHorarioFocusNode?.dispose();
    txtFieldHorarioTextController?.dispose();

    txtFieldDescripcionFocusNode?.dispose();
    txtFieldDescripcionTextController?.dispose();
  }
}
