import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _correoUsuarioLogueado =
          prefs.getString('ff_correoUsuarioLogueado') ?? _correoUsuarioLogueado;
    });
    _safeInit(() {
      _nombreUsuarioLogueado =
          prefs.getString('ff_nombreUsuarioLogueado') ?? _nombreUsuarioLogueado;
    });
    _safeInit(() {
      _apellidoUsuarioLogueado =
          prefs.getString('ff_apellidoUsuarioLogueado') ??
              _apellidoUsuarioLogueado;
    });
    _safeInit(() {
      _fechaNacimientoUsuarioLogueado =
          prefs.getString('ff_fechaNacimientoUsuarioLogueado') ??
              _fechaNacimientoUsuarioLogueado;
    });
    _safeInit(() {
      _provinciaUsuarioLogueado =
          prefs.getString('ff_provinciaUsuarioLogueado') ??
              _provinciaUsuarioLogueado;
    });
    _safeInit(() {
      _ciudadUsuarioLogueado =
          prefs.getString('ff_ciudadUsuarioLogueado') ?? _ciudadUsuarioLogueado;
    });
    _safeInit(() {
      _telefonoUsuarioLogueado = prefs.getInt('ff_telefonoUsuarioLogueado') ??
          _telefonoUsuarioLogueado;
    });
    _safeInit(() {
      _urlFotoPerfilUsuarioLogueado =
          prefs.getString('ff_urlFotoPerfilUsuarioLogueado') ??
              _urlFotoPerfilUsuarioLogueado;
    });
    _safeInit(() {
      _docRefUsuarioLogueado =
          prefs.getString('ff_docRefUsuarioLogueado')?.ref ??
              _docRefUsuarioLogueado;
    });
    _safeInit(() {
      _idVeterinarioCabecera =
          prefs.getInt('ff_idVeterinarioCabecera') ?? _idVeterinarioCabecera;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _correoUsuarioLogueado = '';
  String get correoUsuarioLogueado => _correoUsuarioLogueado;
  set correoUsuarioLogueado(String value) {
    _correoUsuarioLogueado = value;
    prefs.setString('ff_correoUsuarioLogueado', value);
  }

  String _nombreUsuarioLogueado = '';
  String get nombreUsuarioLogueado => _nombreUsuarioLogueado;
  set nombreUsuarioLogueado(String value) {
    _nombreUsuarioLogueado = value;
    prefs.setString('ff_nombreUsuarioLogueado', value);
  }

  String _apellidoUsuarioLogueado = '';
  String get apellidoUsuarioLogueado => _apellidoUsuarioLogueado;
  set apellidoUsuarioLogueado(String value) {
    _apellidoUsuarioLogueado = value;
    prefs.setString('ff_apellidoUsuarioLogueado', value);
  }

  String _fechaNacimientoUsuarioLogueado = '';
  String get fechaNacimientoUsuarioLogueado => _fechaNacimientoUsuarioLogueado;
  set fechaNacimientoUsuarioLogueado(String value) {
    _fechaNacimientoUsuarioLogueado = value;
    prefs.setString('ff_fechaNacimientoUsuarioLogueado', value);
  }

  String _provinciaUsuarioLogueado = '';
  String get provinciaUsuarioLogueado => _provinciaUsuarioLogueado;
  set provinciaUsuarioLogueado(String value) {
    _provinciaUsuarioLogueado = value;
    prefs.setString('ff_provinciaUsuarioLogueado', value);
  }

  String _ciudadUsuarioLogueado = '';
  String get ciudadUsuarioLogueado => _ciudadUsuarioLogueado;
  set ciudadUsuarioLogueado(String value) {
    _ciudadUsuarioLogueado = value;
    prefs.setString('ff_ciudadUsuarioLogueado', value);
  }

  int _telefonoUsuarioLogueado = 0;
  int get telefonoUsuarioLogueado => _telefonoUsuarioLogueado;
  set telefonoUsuarioLogueado(int value) {
    _telefonoUsuarioLogueado = value;
    prefs.setInt('ff_telefonoUsuarioLogueado', value);
  }

  String _urlFotoPerfilUsuarioLogueado = '';
  String get urlFotoPerfilUsuarioLogueado => _urlFotoPerfilUsuarioLogueado;
  set urlFotoPerfilUsuarioLogueado(String value) {
    _urlFotoPerfilUsuarioLogueado = value;
    prefs.setString('ff_urlFotoPerfilUsuarioLogueado', value);
  }

  DocumentReference? _docRefUsuarioLogueado;
  DocumentReference? get docRefUsuarioLogueado => _docRefUsuarioLogueado;
  set docRefUsuarioLogueado(DocumentReference? value) {
    _docRefUsuarioLogueado = value;
    value != null
        ? prefs.setString('ff_docRefUsuarioLogueado', value.path)
        : prefs.remove('ff_docRefUsuarioLogueado');
  }

  String _contraseniaUsuarioLogueado = '';
  String get contraseniaUsuarioLogueado => _contraseniaUsuarioLogueado;
  set contraseniaUsuarioLogueado(String value) {
    _contraseniaUsuarioLogueado = value;
  }

  int _idVeterinarioCabecera = 0;
  int get idVeterinarioCabecera => _idVeterinarioCabecera;
  set idVeterinarioCabecera(int value) {
    _idVeterinarioCabecera = value;
    prefs.setInt('ff_idVeterinarioCabecera', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
