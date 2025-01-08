import 'package:aplicacio_tasques_2425/componentes/item_tasques.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pagina1> {

  List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      //* AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "App Tasques",
          style: TextStyle(color: Colors.orange), // Cambié esto aquí
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.orange, // Cambié el color aquí también
        ),
      ),

      //* Body,
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index) {

          return   ItemTasques(
            textTasca: tasquesLlista[index]["titol"],
            valorCheckbox: tasquesLlista[index]["valor"],
            
            
          );

        }
      ),
    );
  }
}
