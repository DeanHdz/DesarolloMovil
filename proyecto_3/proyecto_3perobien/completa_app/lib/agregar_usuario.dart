import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class AgregarUsuario extends StatefulWidget {
  const AgregarUsuario({super.key});

  @override
  State<AgregarUsuario> createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
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
                  'Agregar Usuario',
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
