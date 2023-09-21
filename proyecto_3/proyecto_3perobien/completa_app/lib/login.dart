import 'package:flutter/material.dart';
import 'utils/constantes.dart' as cons;
import 'home.dart';

//stf

class Login extends StatefulWidget {
  const Login({super.key});
  final String page = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool _validateUser = false;

  @override
  Widget build(BuildContext context) {
    //ESTO SE USA MUCHO (size), define el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: cons.amarillo,
        body: Stack(
          children: [
            SingleChildScrollView(
                //padding: const EdgeInsets(
                //    left: 0, top: 20, right: 0, bottom: 20),
                child: Column(
              children: [
                /*
                Container(
                    height: size.height * 0.3,
                    width: size.width * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/userImage.png'),
                            fit: BoxFit.cover))),*/
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                /*const label(
                    texto: 'Ingresa su usuario:',
                    ),*/
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(100))),
                  height: size.height,
                  child: Column(children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    TextFormField(
                        controller: user,
                        obscureText: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: cons.amarillo,
                                width: 1,
                                style: BorderStyle.none),
                          ),
                          filled: true,
                          fillColor: cons.amarillo,
                          hintText: 'Usuario',
                          hintStyle: const TextStyle(color: Colors.white),
                          //prefixIcon: const Icon(Icons.verified_user),
                          errorText: _validateUser
                              ? 'Debe de escribir su usuario'
                              : null,
                        ),
                        onChanged: (texto) {
                          setState(() {
                            if (texto.trim().isNotEmpty) {
                              _validateUser = false;
                            }
                          });
                        }), //SizedBox es un espacio vacio para separar los inputs
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    /*const label(
                        texto: 'Ingresa su correo:',
                        ),*/
                    TextFormField(
                      controller: email,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: cons.amarillo,
                              width: 1,
                              style: BorderStyle.none),
                        ),
                        filled: true,
                        fillColor: cons.amarillo,
                        hintText: 'Correo',
                        hintStyle: const TextStyle(color: Colors.white),
                        errorText:
                            _validateUser ? 'Debe de escribir su correo' : null,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    /*const label(
                          texto: 'Ingresa su constraseña:',
                        ),*/
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: cons.amarillo,
                              width: 1,
                              style: BorderStyle.none),
                        ),
                        filled: true,
                        fillColor: cons.amarillo,
                        hintText: 'Contraseña',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        errorText: _validateUser
                            ? 'Debe de escribir su contraseña'
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.20,
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
                        setState(() {
                          user.text.isNotEmpty
                              ? _validateUser = false
                              : _validateUser = true;
                          if (user.text.isNotEmpty &&
                              email.text.isNotEmpty &&
                              pass.text.isNotEmpty &&
                              user.text == cons.usuario &&
                              email.text == cons.email &&
                              pass.text == cons.pass &&
                              validaCorreo(email.text) == "1") {
                            //siguiente vista
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            _validateUser = true;
                          }
                        });
                      },
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ],
            ))
          ],
        ));
  }

  String validaCorreo(String email) {
    String pattern =
        r'^ ((<> () [].,;:s@"]+ (. [^<> () [].,;:s@"]+)*)| (".+"))@ (([ [0-9] {1,3}. [0-9] {1,3}. [0-9] {1,3}. [0-9] {1,3}])| (([a-zA-Z-0-9]+.)+ [a-zA-Z] {2,}))$';

    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(email)) {
      return '1';
    } else {
      return '0';
    }
  }
}

class label extends StatelessWidget {
  final String texto;
  const label({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
      )
    ]);
  }
}
