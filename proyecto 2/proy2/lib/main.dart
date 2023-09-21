import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const Home());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Elguidjet(),
    );
  }
}

class Elguidjet extends StatefulWidget {
  const Elguidjet({super.key});

  @override
  State<Elguidjet> createState() => _ElguidjetState();
}

class _ElguidjetState extends State<Elguidjet> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: <Widget>[
            ElevatedButton(
              child: const Text('NuevaVista'),
              onPressed: () {
                _CambiarVista();
              },
            ),
            TextFormField(
              controller: user,
              decoration: InputDecoration(
                hintText: 'Ingresa usuario',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un texto';
                }
                return null;
              },
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Ingresa contraseña',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un texto';
                }
                return null;
              },
            ),
            error ? Text("Usuario o contraseña incorrecto") : Container(),
            FloatingActionButton.large(
                child: const Text(
                  "Siguiente vista",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    print(user.text);
                    print(password.text);

                    if (user.text == "uaslp" && password.text == "1234") {
                      error = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    } else {
                      error = true;
                    }
                  });
                }),
          ])
        ],
      ),
    );
  }

  _CambiarVista() {
    setState(() {
      Column(
        children: [
          ElevatedButton(
            child: Text('Boton1'),
            onPressed: () {
              print('Hello');
            },
          ),
          ElevatedButton(
            child: Text('Boton2'),
            onPressed: () {
              print('Hello');
            },
          ),
          ElevatedButton(
            child: Text('Boton3'),
            onPressed: () {
              print('Hello');
            },
          ),
          ElevatedButton(
            child: Text('Boton4'),
            onPressed: () {
              print('Hello');
            },
          ),
          ElevatedButton(
            child: Text('Boton5'),
            onPressed: () {
              print('Hello');
            },
          ),
        ],
      );
    });
  }
}
