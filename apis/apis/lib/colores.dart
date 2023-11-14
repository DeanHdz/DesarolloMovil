import 'package:apis/colores.dart';
import 'package:apis/getApi.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Colores extends StatefulWidget {
  const Colores({super.key});

  @override
  State<Colores> createState() => _ColoresState();
}

class _ColoresState extends State<Colores> {
  late GoogleMapController mapController;

  late LatLng _center = const LatLng(45.521563, -122.677433);

  //Lista que guarda los valores de colores?
  List val = [];

  @override
  void initState() {
    getJsonData(); // Funcion que realiza el llamado a la api
    super.initState();
  }

  Future<void> getJsonData() async {
    //Lamado a la clase
    Colores colores = Colores(
      nombre: "Dean Joshua Hernandez",
    );

    try {
      var data;
      data = await colores.getColores();
      if (data['estatus'] == 200) {
        val = [];
        print(data); //json completo
        print(data['estatus']);
        print(data['respuesta']);
        print(data['respuesta'][1]);
        print(data['respuesta'][1]['nombreColor']);
        for (int i = 0; i < lengthList(data['respuesta']); i++) {
          print(data['respuesta'][i]);
          val.add(data['respuesta'][i]['valorHer']);
        }
        print(val);
      } else {
        print('Lista vacia');
      }
    } catch (e) {
      print('Hubo un error al extraer las coordenadas');
    }
    setState(() {});
  }

  int lengthList(var list) {
    int num = 0;
    try {
      for (var cad in list) {
        num = num + 1;
      }
    } catch (e) {
      num = 0;
    }
    return num;
  }

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
        ],
      ),
    );
  }
}
