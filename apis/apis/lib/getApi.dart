import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(
      {required this.startLng,
      required this.startLat,
      required this.endLng,
      required this.endLat});

  final String url = 'https://api.openrouteservice.org/v2/directions/';
  final String apiKey =
      '5b3ce3597851110001cf62486ec25d20c40649d7a4117da00df6b559';
  final String journeyMode =
      'driving-car'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        '$url$journeyMode?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat'));
    print(
        "$url$journeyMode?$apiKey&start=$startLng,$startLat&end=$endLng,$endLat");

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class Colores {
  Colores({required this.nombre});

  final String url = 'http://nrweb.com.mx/api_prueba/colores.php';
  final String nombre;

  Future getColores() async {
    http.Response response = await http.get(Uri.parse('$url?nombre=$nombre'));
    print("$url?nombre=$nombre");

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

// http://nrweb.com.mx/api_prueba/examen/parcial3.php?nombre=Dean+Joshua+Hernandez&clave=314118&hora=1