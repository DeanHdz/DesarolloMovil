//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Navegacion de pagina",
    home: Primerapagina(),
  ));
}

class Primerapagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 1")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Segundapagina()));
        },
        child: const Text("Ir a segunda vista"),
      )),
    );
  }
}

class Segundapagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Page 2")),
        body: Center(
            child: Column(children: [
          //PRIMER WIDGET tipo ELEVATED BUTTON
          ElevatedButton(
            onPressed: () {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) => Segundapagina()));*/
            },
            child: const Text("Widget tipo Elevated Button"),
          ),
          //SEGUNDO WIDGET tipo ICON
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          //TERCER WIDGET tipo Floating Action Button
          FloatingActionButton(onPressed: () {}),
          //CUARTO WIDGET tipo IconButton
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: 'Increase volume by 10',
            onPressed: () {},
          ),
          //Quinto WIDGET tipo flutter logo
          FlutterLogo()
        ])));
  }
}
