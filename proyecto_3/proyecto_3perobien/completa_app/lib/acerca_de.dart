import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class AcercaDe extends StatefulWidget {
  const AcercaDe({super.key});

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
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
                  'Acerca de',
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
