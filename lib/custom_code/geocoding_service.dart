import 'dart:convert';
import 'package:http/http.dart' as http;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';

class GeocodingService {
  static const String _apiKey = 'AIzaSyDNDiMaZva9sfSn0vKge13FA3mQonsjK4Y';

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
