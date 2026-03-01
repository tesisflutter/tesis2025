import 'dart:convert';
import 'package:http/http.dart' as http;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';

class GeocodingService {
  static const String _apiKey = 'AIzaSyDNDiMaZva9sfSn0vKge13FA3mQonsjK4Y';

  /// Mapeo de nombres de provincias devueltos por la API de Google
  /// a los valores usados en el dropdown de la app.
  static const Map<String, String> _provinciaMapping = {
    'Provincia de Buenos Aires': 'Buenos Aires',
    'Buenos Aires': 'Buenos Aires',
    'Ciudad Autónoma de Buenos Aires': 'Cdad. Autónoma de Buenos Aires',
    'Catamarca': 'Catamarca',
    'Provincia de Catamarca': 'Catamarca',
    'Chaco': 'Chaco',
    'Provincia del Chaco': 'Chaco',
    'Chubut': 'Chubut',
    'Provincia del Chubut': 'Chubut',
    'Córdoba': 'Córdoba',
    'Provincia de Córdoba': 'Córdoba',
    'Corrientes': 'Corrientes',
    'Provincia de Corrientes': 'Corrientes',
    'Entre Ríos': 'Entre Ríos',
    'Provincia de Entre Ríos': 'Entre Ríos',
    'Formosa': 'Formosa',
    'Provincia de Formosa': 'Formosa',
    'Jujuy': 'Jujuy',
    'Provincia de Jujuy': 'Jujuy',
    'La Pampa': 'La Pampa',
    'Provincia de La Pampa': 'La Pampa',
    'La Rioja': 'La Rioja',
    'Provincia de La Rioja': 'La Rioja',
    'Mendoza': 'Mendoza',
    'Provincia de Mendoza': 'Mendoza',
    'Misiones': 'Misiones',
    'Provincia de Misiones': 'Misiones',
    'Neuquén': 'Neuquén',
    'Provincia del Neuquén': 'Neuquén',
    'Río Negro': 'Río Negro',
    'Provincia de Río Negro': 'Río Negro',
    'Salta': 'Salta',
    'Provincia de Salta': 'Salta',
    'San Juan': 'San Juan',
    'Provincia de San Juan': 'San Juan',
    'San Luis': 'San Luis',
    'Provincia de San Luis': 'San Luis',
    'Santa Cruz': 'Santa Cruz',
    'Provincia de Santa Cruz': 'Santa Cruz',
    'Santa Fe': 'Santa Fe',
    'Provincia de Santa Fe': 'Santa Fe',
    'Santiago del Estero': 'Santiago del Estero',
    'Provincia de Santiago del Estero': 'Santiago del Estero',
    'Tierra del Fuego': 'Tierra del Fuego',
    'Provincia de Tierra del Fuego, Antártida e Islas del Atlántico Sur': 'Tierra del Fuego',
    'Tucumán': 'Tucumán',
    'Provincia de Tucumán': 'Tucumán',
  };

  /// Normaliza el nombre de provincia devuelto por Google al valor del dropdown.
  static String? normalizarProvincia(String provinciaGoogle) {
    return _provinciaMapping[provinciaGoogle];
  }

  /// Geocodificacion inversa: convierte coordenadas en una direccion.
  static Future<FFPlace> reverseGeocode(LatLng location) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json'
      '?latlng=${location.latitude},${location.longitude}'
      '&language=es'
      '&key=$_apiKey',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final result = data['results'][0];
          final components = result['address_components'] as List;

          String city = '';
          String state = '';
          String country = '';

          for (final component in components) {
            final types = (component['types'] as List).cast<String>();
            if (types.contains('locality')) {
              city = component['long_name'];
            } else if (types.contains('administrative_area_level_1')) {
              state = component['long_name'];
            } else if (types.contains('country')) {
              country = component['long_name'];
            }
          }

          return FFPlace(
            latLng: location,
            name: result['formatted_address'] ?? '',
            address: result['formatted_address'] ?? '',
            city: city,
            state: state,
            country: country,
          );
        }
      }
    } catch (_) {
      // Si falla la geocodificacion, retorna datos parciales
    }

    return FFPlace(
      latLng: location,
      name: 'Ubicación seleccionada',
      address: '',
      city: '',
      state: '',
      country: '',
    );
  }
}
