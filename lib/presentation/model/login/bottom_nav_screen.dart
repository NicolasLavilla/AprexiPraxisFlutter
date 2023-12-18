import 'package:flutter/material.dart';

void main() {
  runApp(BottomNavScreen());
}

class BottomNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Mundo en Flutter'),
        ),
        body: Center(
          child: Text(
            '¡Hola Mundo!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
