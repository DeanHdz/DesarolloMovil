import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class Ajustes extends StatefulWidget {
  const Ajustes({super.key});
  final String page = 'Ajustes';

  @override
  State<Ajustes> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  @override
  Widget build(BuildContext context) {
    //ESTO SE USA MUCHO (size), define el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: cons.morado,
        appBar: AppBar(title: const Text("")),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100)),
                  ),
                  height: size.height,
                ),
              ]),
            )
          ],
        ));
  }
}
