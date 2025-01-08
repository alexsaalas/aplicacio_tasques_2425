import 'package:aplicacio_tasques_2425/pagines/pagina1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Pagina1(),
      //* Pata quitar el debug 
      debugShowCheckedModeBanner: false,
    );
  }
}
