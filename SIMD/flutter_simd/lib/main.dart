import 'package:flutter/material.dart';
import 'database.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Column(
        children: [
          ElevatedButton(
            child: Text('Select'),
            onPressed: () {
              _select();
            },
          ),
          ElevatedButton(
            child: Text('Insert'),
            onPressed: () {
              _insert();
            },
          ),
          ElevatedButton(
            child: Text('Update'),
            onPressed: () {
              _update();
            },
          ),
          ElevatedButton(
            child: Text('Delete'),
            onPressed: () {
              _delete();
            },
          )
        ],
      )),
    );
  }

  void _select() {}
  void _insert() async {
    //Model modelo = Model
  }
  void _update() {}
  void _delete() {}
}

//Insert select update(modify) delete