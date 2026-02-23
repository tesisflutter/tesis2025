import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DiaCalendarioStruct> obtenerListaDiasCalendarioParaMesDado(
    DateTime inputDate) {
  List<DiaCalendarioStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday before or on the first of the month
  DateTime startCalendar =
      firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after or on the last of the month (spillover into the next month)
  DateTime endCalendar =
      lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar without duplicating dates
  for (DateTime date = startCalendar;
      date.isBefore(
          endCalendar.add(Duration(days: 1))); // Iterate through each day
      date = date.add(Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    // Ensure the last day of the current month is correctly marked (not flagged as next month)
    if (date.day == lastOfMonth.day && date.month == inputDate.month) {
      isPreviousMonth = false;
      isNextMonth =
          false; // Last day of the current month should be handled correctly
    }

    DiaCalendarioStruct dayStruct = DiaCalendarioStruct(
        fechaCalendario: date,
        esMesAnterior: isPreviousMonth,
        esMesProximo: isNextMonth);

    calendar.add(dayStruct);
  }

  return calendar;
}

double calcularBalanceNeto(List<TransaccionRecord> listaTransacciones) {
  double total = 0.0;

  for (final transaccion in listaTransacciones) {
    final monto = transaccion.monto;
    if (transaccion.esGasto) {
      total -= monto.toDouble();
    } else {
      total += monto.toDouble();
    }
  }

  total = (total * 100).truncate() / 100;

  return total;
}

double calcularBalancePositivo(List<TransaccionRecord> listaTransacciones) {
  double total = 0.0;

  for (final transaccion in listaTransacciones) {
    final monto = transaccion.monto;
    if (!transaccion.esGasto) {
      total += monto.toDouble();
    }
  }

  total = (total * 100).truncate() / 100;

  return total;
}

DateTime obtenerFechaInicioAnteriorMes(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }

  return DateTime(year, month);
}

DateTime obtenerFechaInicioProxMes(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }

  return DateTime(year, month);
}

List<PublicacionMarketRecord> filterPublicacionesMarket(
  List<PublicacionMarketRecord> listaPublicacionesMarket,
  String filtroCategoria,
  int? filtroPrecioMinimo,
  int? filtroPrecioMaximo,
  String filtroProvincia,
  String? filtroCiudad,
) {
  return listaPublicacionesMarket.where((publiMarket) {
    final categoria = publiMarket.categoria as String?;
    final precio = publiMarket.precio as num?;
    final provincia = publiMarket.provincia as String?;
    final ciudad = publiMarket.ciudad as String?;

    if (filtroCategoria != 'Todas' && categoria != filtroCategoria) {
      return false;
    }

    if (precio! > filtroPrecioMaximo! || precio! < filtroPrecioMinimo!) {
      return false;
    }

    if (filtroProvincia != 'Todas las Provincias' &&
        (provincia != filtroProvincia ||
            (provincia == filtroProvincia &&
                filtroCiudad!.isNotEmpty &&
                ciudad != filtroCiudad))) {
      return false;
    }

    return true;
  }).toList();
}

/// Esta función toma una fecha en formato DateTime y una hora en formato
/// String, y devuelve una DateTime con la fecha original (día/mes/año) y la
/// hora del String (hora/minuto/segundo)
DateTime formarFechaDeFechaYHora(
  DateTime fechaHoraOriginal,
  String? horaAgregada,
) {
  String fechaHoraNuevaString;
  if (horaAgregada == null) {
    fechaHoraNuevaString =
        fechaHoraOriginal.toString().split(' ')[0] + ' ' + '00:00';
  } else {
    fechaHoraNuevaString = fechaHoraOriginal.toString().split(' ')[0] +
        ' ' +
        horaAgregada.split(' ')[1];
  }

  print("fecha formada: " + fechaHoraNuevaString);
  return DateTime.parse(fechaHoraNuevaString);
}

/// Indica si las fechas pasadas por parámetro son iguales, más allá de si las
/// horas son diferentes
bool esMismaFecha(
  DateTime fecha1,
  DateTime fecha2,
) {
  return fecha1.toString().split(' ')[0] == fecha2.toString().split(' ')[0];
}

DateTime obtenerFechaConHoraCero(DateTime fechaDada) {
  String fechaArregladaString = fechaDada.toString().split(' ')[0] +
      ' 00:00:00.000'; // fecha2.toString().split(' ')[0];
  DateTime fechaArreglada = DateTime.parse(fechaArregladaString);

  return fechaArreglada;
}

int? obtenerIndiceDeItemEventoEnLista(
  EventoCalendarioRecord item,
  List<EventoCalendarioRecord> lista,
) {
  return lista.indexOf(item);
}

DateTime obtenerFechaInicioMesCorriente(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  return DateTime(year, month);
}

double calcularBalanceNegativo(List<TransaccionRecord> listaTransacciones) {
  double total = 0.0;

  for (final transaccion in listaTransacciones) {
    final monto = transaccion.monto;
    if (transaccion.esGasto) {
      total -= monto.toDouble();
    }
  }

  total = (total * 100).truncate() / 100;

  return total;
}

List<DuplaMontoCategoriaStruct> agruparMontosPorCategorias(
    List<TransaccionRecord> listaTransacciones) {
  List<DuplaMontoCategoriaStruct> listaDuplas = [];
  List<String> listaCategorias = [];

  for (final transaccion in listaTransacciones) {
    final montoTransaccion = transaccion.monto;
    final categoriaTransaccion = transaccion.categoria;

    if (!listaCategorias.contains(categoriaTransaccion)) {
      listaCategorias.add(categoriaTransaccion);

      DuplaMontoCategoriaStruct dupla = DuplaMontoCategoriaStruct(
          categoria: categoriaTransaccion, montoTotal: montoTransaccion);
      listaDuplas.add(dupla);
    } else {
      final montoAnterior = listaDuplas
          .firstWhere(
            (item) => item.categoria == categoriaTransaccion,
          )
          .montoTotal;

      DuplaMontoCategoriaStruct dupla = DuplaMontoCategoriaStruct(
          categoria: categoriaTransaccion,
          montoTotal: montoAnterior + montoTransaccion);

      listaDuplas.removeWhere((item) => item.categoria == categoriaTransaccion);
      listaDuplas.add(dupla);
    }
  }

  return listaDuplas;
}

List<String> obtenerListaAniosEntreFechasDadas(
  DateTime fechaDadaAnterior,
  DateTime fechaDadaPosterior,
) {
  List<String> listaAnios = [];

  for (int i = fechaDadaPosterior.year; i >= fechaDadaAnterior.year; i--) {
    listaAnios.add(i.toString());
  }
  return listaAnios;
}

/// Devuelve una lista con todos los meses del año (en String) empezando no
/// necesariamente por enero, sino por el de la fecha dada.
///
/// Esto se usa en el listado de meses del balance mensual.
List<String> obtenerMesesRestantesFechaDada(DateTime fechaDada) {
  DateTime fechaActual = DateTime.now();
  List<String> mesesRestantes = [];

  if (fechaActual.month < fechaDada.month) {
    mesesRestantes.add(DateFormat('MMMM', 'es')
        .format(DateTime(fechaActual.month, fechaActual.month))
        .toLowerCase());
  } else {
    for (int i = fechaDada.month; i <= fechaActual.month; i++) {
      mesesRestantes
          .add(DateFormat('MMMM', 'es').format(DateTime(i, i)).toLowerCase());
    }
  }
  return mesesRestantes;
}

DateTime obtenerFechaDadoMesYAnio(
  String mes,
  String anio,
) {
  //await initializeDateFormatting('es', null);

  final fechaMes = DateFormat('MMMM', 'es').parseLoose(mes);

  return DateTime(int.parse(anio), fechaMes.month, 1);
}

bool hayMasDeUnaSemanaDeDiferencia(
  DateTime fechaAntes,
  DateTime fechaDespues,
) {
  final difference = fechaDespues.difference(fechaAntes);
  return (difference.inSeconds > 604800);
}

bool hayMasDeUnDiaDeDiferencia(
  DateTime fechaAntes,
  DateTime fechaDespues,
) {
  final difference = fechaDespues.difference(fechaAntes);
  return (difference.inSeconds > 86400);
}

bool hayMasDeUnaHoraDeDiferencia(
  DateTime fechaAntes,
  DateTime fechaDespues,
) {
  final difference = fechaDespues.difference(fechaAntes);
  return (difference.inSeconds > 3600);
}

int obtenerDiferenciaEnAnios(
  DateTime fechaAntes,
  DateTime fechaDespues,
) {
  Duration diferencia = fechaDespues.difference(fechaAntes);
  return (diferencia.inDays / 365.25).toInt();
}

DateTime formarFechaDeString(String stringFecha) {
  return DateTime.parse(stringFecha);
}

List<String> obtenerListaDatosVeterinarios(
    List<MedicoVeterinarioRecord> listaDocsVeterinarios) {
  List<String> listaNombresCompletos = [];
  for (int i = 0; i < listaDocsVeterinarios.length; i++) {
    String nombreVete = listaDocsVeterinarios[i].nombre;
    String apellidoVete = listaDocsVeterinarios[i].apellido;
    // Agregamos la matrícula solo si ésta fue registrada (no es null)
    String matricula = listaDocsVeterinarios[i].numeroMatricula.toString();

    if (matricula != Null)
      listaNombresCompletos.add(
          nombreVete + ' ' + apellidoVete + ' (Matrícula: ' + matricula + ')');
    else
      listaNombresCompletos.add(nombreVete + ' ' + apellidoVete);
  }
  return listaNombresCompletos;
}

int? obtenerIDVeterinario(
  String nombreCompleto,
  List<MedicoVeterinarioRecord> listaDocsVeterinarios,
) {
  if (nombreCompleto.contains('Matrícula')) {
    String matricula = nombreCompleto.split(' (Matricula: ')[1].split(')')[0];

    for (int i = 0; i < listaDocsVeterinarios.length; i++) {
      if (listaDocsVeterinarios[i].numeroMatricula == matricula)
        return listaDocsVeterinarios[i].iDMedicoVeterinario;
    }
  }

  for (int i = 0; i < listaDocsVeterinarios.length; i++) {
    String nombreApellidoDoc = listaDocsVeterinarios[i].nombre +
        ' ' +
        listaDocsVeterinarios[i].apellido;

    if (nombreApellidoDoc == nombreCompleto)
      return listaDocsVeterinarios[i].iDMedicoVeterinario;
  }

  return null;
}

bool hayDatosCambiadosUsuario(
  String provinciaDoc,
  String provinciaWidget,
  String ciudadDoc,
  String ciudadWidget,
  int telefonoDoc,
  int telefonoWidget,
  String fotoPerfilDoc,
  String fotoPerfilWidget,
) {
  return (provinciaDoc != provinciaWidget ||
      ciudadDoc != ciudadWidget ||
      telefonoDoc != telefonoWidget ||
      fotoPerfilDoc != fotoPerfilWidget);
}

bool hayDatosCambiadosVeterinario(
  String provinciaDoc,
  String provinciaWidget,
  String ciudadDoc,
  String ciudadWidget,
  int telefonoDoc,
  int telefonoWidget,
  String fotoPerfilDoc,
  String fotoPerfilWidget,
  String nombreDoc,
  String nombreWidget,
  String apellidoDoc,
  String apellidoWidget,
  String correoDoc,
  String correoWidget,
  int matriculaDoc,
  int matriculaWidget,
) {
  return (provinciaDoc != provinciaWidget ||
      ciudadDoc != ciudadWidget ||
      telefonoDoc != telefonoWidget ||
      fotoPerfilDoc != fotoPerfilWidget ||
      nombreDoc != nombreWidget ||
      apellidoDoc != apellidoWidget ||
      correoDoc != correoWidget ||
      matriculaDoc != matriculaWidget);
}
