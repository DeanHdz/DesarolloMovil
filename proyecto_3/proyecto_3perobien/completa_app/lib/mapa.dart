import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: cons.morado,
        appBar: AppBar(title: const Text("")),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                const Text(
                  'Mapa',
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
