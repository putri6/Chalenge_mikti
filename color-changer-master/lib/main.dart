import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackgroundColorChanger(),
    );
  }
}

class BackgroundColorChanger extends StatefulWidget {
  const BackgroundColorChanger({Key? key}) : super(key: key);

  @override
  _BackgroundColorChangerState createState() => _BackgroundColorChangerState();
}

class _BackgroundColorChangerState extends State<BackgroundColorChanger> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      // Generate a random color
      _backgroundColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Changer App'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: const Text('Change Background Color'),
          ),
        ),
      ),
    );
  }
}
