import 'package:aplicacio_tasques_2425/componentes/dialog_nova_tasca.dart';
import 'package:aplicacio_tasques_2425/componentes/item_tasques.dart';
import 'package:flutter/material.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pagina1> {
  //* Listas
  List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
    {"titol": "Tasca 3", "valor": true},
  ];

  void canviaCheckbox(int posLlista) {
    //* Para actualizar la pantalla
    setState(() {
      //* ! =  es no true
      tasquesLlista[posLlista]["valor"] = !tasquesLlista[posLlista]["valor"];
    });
  }

  void accioEsborraTasca(int posLlista) {
    setState(() {
      tasquesLlista.removeAt(posLlista);
    });
  }

  void CrearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //* Scaffold
    return Scaffold(
      backgroundColor: Colors.teal[100],
      //* AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "App Tasques",
          style: TextStyle(color: Colors.orange),
        ),
      ),
      //* FloatingActionButton = BOTON ABAJO DE LA DERECHA
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: CrearNovaTasca, // Aquí solo tienes un onPressed
        child: const Icon(
          Icons.add,
          color: Colors.orange,
        ),
      ),

      //* Body
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasques(
            textTasca: tasquesLlista[index]["titol"],
            valorCheckbox: tasquesLlista[index]["valor"],
            canviaValorCheckbox: (valor) => canviaCheckbox(index),
            esborraTasca: (valor) => accioEsborraTasca(index),
          );
        },
      ),
    );
  }
}
