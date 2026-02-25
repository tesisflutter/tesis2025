import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'pagina_seguimiento_gastos_widget.dart'
    show PaginaSeguimientoGastosWidget;
import 'package:flutter/material.dart';

class PaginaSeguimientoGastosModel
    extends FlutterFlowModel<PaginaSeguimientoGastosWidget> {
  ///  Local state fields for this page.

  double balancePositivo = 0.0;

  double balanceNegativo = 0.0;

  double balanceNetoSTATE = 0.0;

  List<TransaccionRecord> listaTransaccionesMesCorrienteSTATE = [];
  void addToListaTransaccionesMesCorrienteSTATE(TransaccionRecord item) =>
      listaTransaccionesMesCorrienteSTATE.add(item);
  void removeFromListaTransaccionesMesCorrienteSTATE(TransaccionRecord item) =>
      listaTransaccionesMesCorrienteSTATE.remove(item);
  void removeAtIndexFromListaTransaccionesMesCorrienteSTATE(int index) =>
      listaTransaccionesMesCorrienteSTATE.removeAt(index);
  void insertAtIndexInListaTransaccionesMesCorrienteSTATE(
          int index, TransaccionRecord item) =>
      listaTransaccionesMesCorrienteSTATE.insert(index, item);
  void updateListaTransaccionesMesCorrienteSTATEAtIndex(
          int index, Function(TransaccionRecord) updateFn) =>
      listaTransaccionesMesCorrienteSTATE[index] =
          updateFn(listaTransaccionesMesCorrienteSTATE[index]);

  List<DuplaMontoCategoriaStruct> listaMontosYCategorias = [];
  void addToListaMontosYCategorias(DuplaMontoCategoriaStruct item) =>
      listaMontosYCategorias.add(item);
  void removeFromListaMontosYCategorias(DuplaMontoCategoriaStruct item) =>
      listaMontosYCategorias.remove(item);
  void removeAtIndexFromListaMontosYCategorias(int index) =>
      listaMontosYCategorias.removeAt(index);
  void insertAtIndexInListaMontosYCategorias(
          int index, DuplaMontoCategoriaStruct item) =>
      listaMontosYCategorias.insert(index, item);
  void updateListaMontosYCategoriasAtIndex(
          int index, Function(DuplaMontoCategoriaStruct) updateFn) =>
      listaMontosYCategorias[index] = updateFn(listaMontosYCategorias[index]);

  /// Las categorías elegidas, para filtrar transacciones
  List<String> listaCategoriasSeleccionadas = [];
  void addToListaCategoriasSeleccionadas(String item) =>
      listaCategoriasSeleccionadas.add(item);
  void removeFromListaCategoriasSeleccionadas(String item) =>
      listaCategoriasSeleccionadas.remove(item);
  void removeAtIndexFromListaCategoriasSeleccionadas(int index) =>
      listaCategoriasSeleccionadas.removeAt(index);
  void insertAtIndexInListaCategoriasSeleccionadas(int index, String item) =>
      listaCategoriasSeleccionadas.insert(index, item);
  void updateListaCategoriasSeleccionadasAtIndex(
          int index, Function(String) updateFn) =>
      listaCategoriasSeleccionadas[index] =
          updateFn(listaCategoriasSeleccionadas[index]);

  /// Determina si mostrar o no las transacciones que sean ingresos
  bool ingresosSeleccionado = true;

  /// Determina si mostrar o no las transacciones que sean gastos
  bool gastosSeleccionados = true;

  /// Clave por la cual ordenar la lista de transacciones
  ///
  /// - Más reciente (por defecto)
  /// - Menos reciente
  /// - Mayor monto
  /// - Menor monto
  String ordenLista = 'Más reciente';

  /// Indica si la búsqueda con el botón Play no arrojó resultados
  bool sinResultadosParaMesAnio = false;

  /// Mes y año buscados (se fijan al presionar Play, no al cambiar dropdowns)
  String? mesBuscado;
  String? anioBuscado;

  /// Fecha elegida para ver gastos, de ésta solo sacamos el mes y el año
  DateTime? fechaElegida;

  /// Fecha de la primera transacción anotada por el usuario actual, para
  /// empezar el listado de meses y años
  DateTime? fechaPrimeraTransaccion;

  List<String> listaAniosDesdeFechaPrimeraTransaccion = [];
  void addToListaAniosDesdeFechaPrimeraTransaccion(String item) =>
      listaAniosDesdeFechaPrimeraTransaccion.add(item);
  void removeFromListaAniosDesdeFechaPrimeraTransaccion(String item) =>
      listaAniosDesdeFechaPrimeraTransaccion.remove(item);
  void removeAtIndexFromListaAniosDesdeFechaPrimeraTransaccion(int index) =>
      listaAniosDesdeFechaPrimeraTransaccion.removeAt(index);
  void insertAtIndexInListaAniosDesdeFechaPrimeraTransaccion(
          int index, String item) =>
      listaAniosDesdeFechaPrimeraTransaccion.insert(index, item);
  void updateListaAniosDesdeFechaPrimeraTransaccionAtIndex(
          int index, Function(String) updateFn) =>
      listaAniosDesdeFechaPrimeraTransaccion[index] =
          updateFn(listaAniosDesdeFechaPrimeraTransaccion[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PaginaSeguimientoGastos widget.
  TransaccionRecord? queryPrimeraTransaccionUsuario;
  // State field(s) for drop_mes widget.
  String? dropMesValue;
  FormFieldController<String>? dropMesValueController;
  // State field(s) for drop_anio widget.
  String? dropAnioValue;
  FormFieldController<String>? dropAnioValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Play button.
  List<TransaccionRecord>? transaccionesMesOutputPlayButton;
  // State field(s) for chk_categoria widget.
  Map<String, bool> chkCategoriaValueMap = {};
  List<String> get chkCategoriaCheckedItems => chkCategoriaValueMap.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  List<TransaccionRecord>? transaccionesMesOutputNuevaTransaccion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
