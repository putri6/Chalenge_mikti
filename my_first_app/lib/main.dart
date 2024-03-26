import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BackgroundColorChanger(),
    );
  }
}

class BackgroundColorChanger extends StatefulWidget {
  const BackgroundColorChanger({super.key});

  @override
  // ignore: library_private_types_in_public_api
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