import 'package:completa_app/acerca_de.dart';
import 'package:completa_app/ajustes.dart';
import 'package:completa_app/agregar_usuario.dart';
import 'package:completa_app/mapa.dart';
import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//lista vcia
  List usuarios = [];

  @override
  void initState() {
    //cada ver que inicia el widget realiza las siguientes acciones?
    usuarios.add('1#nombre1#correo1');
    usuarios.add('2#nombre2#correo2');
    usuarios.add('3#nombre3#correo3');
    usuarios.add('4#nombre4#correo4');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ESTO SE USA MUCHO (size), define el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('VISTA PRINCIPAL'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ajustes()));
                  },
                  child: const Text("Ajustes"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AcercaDe()));
                  },
                  child: const Text("Acerca de"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Mapa()));
                  },
                  child: const Text("Mapa"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AgregarUsuario()));
                  },
                  child: const Text("Agregar Usuario"),
                ),
                const Card(
                    color: Colors.yellow,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Text(
                                'Usuario',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Password',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              'Botones',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: usuarios.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = usuarios[index].split('#');

                        return Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        datos[1],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      datos[2],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.person)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: cons.azul,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(
                      size.width * 0.75,
                      45,
                    ),
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Stack ya toma todas las dimensiones de tu pantalla y se adapta a el
//La columna es infinita
