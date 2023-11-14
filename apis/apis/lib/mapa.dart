import 'package:apis/colores.dart';
import 'package:apis/getApi.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(45.521563, -122.677433);

  //Guardar los puntos con las coordenadas (lat, lng)
  final List<LatLng> polyPoints = [];
  //Guardar las lineas sobre el mapa
  final Set<Polyline> polyLines = {};

  @override
  void initState() {
    getJsonData(); // Funcion querealiza el llamado a la api
    super.initState();
  }

  void _onMapCreated(GoogleMapController) {}

  void actualizaCoordenadas(String lat, String lng) {}

  Future<void> getJsonData() async {
    //Lamado a la clase
    NetworkHelper networkHelper = NetworkHelper(
        startLng: 22.144596,
        startLat: -101.009064,
        endLng: 22.149730,
        endLat: -100.992221);

    try {
      var data;
      data = await networkHelper.getData();
      print(data);
      print(data['features']);
      print(data['features'][0]);
      print(data['features'][0]['geometry']);
      print(data['features'][0]['geometry']['coordinates']);
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        print('${ls.lineString[i][1]}, ${ls.lineString[i][0]}');
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
    } catch (e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }

  setPolyLines() {
    setState(() {
      //p1 ----------- p2 ------------ p3
      Polyline polyline = Polyline(
          polylineId: const PolylineId('polilyne'),
          color: Colors.red,
          width: 6,
          points: polyPoints);
      polyLines.add(polyline);
    });
  }

  /*void _navigateToColores(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Colores()));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ElevatedButton(
              onPressed: () {
                //_navigateToColores(context);
              },
              child: Text('Colores')),
          GoogleMap(
            onMapCreated: _onMapCreated,
            polylines: polyLines,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
        ],
      ),
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}

//A la nueva api poner mi nombre
