import 'package:aplicacio_tasques_2425/componentes/dialog_nova_tasca.dart';
import 'package:aplicacio_tasques_2425/componentes/item_tasques.dart';
import 'package:aplicacio_tasques_2425/data/base_de_dades.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Pagina1> {
  //* Listas
  /* List tasquesLlista = [
   
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": true},
    {"titol": "Tasca 3", "valor": true},
  ];*/

  final Box _boxHive = Hive.box("box_tasques_app");
  BaseDeDades db = BaseDeDades();

  @override
  void initState() {
    // mirar si existen datos y si no existen añadirlos
    if (_boxHive.get("box_tasques_app") == null) {
      db.crearDadesExemple();
    } else {
      db.CargarDades();
    }
    super.initState();
  }

  TextEditingController tecTextTasca = TextEditingController();

  void accioGuardar() {
    setState(() {
      db.tasquesLlista.add({
        "titol": tecTextTasca.text, // Añadimos el texto de la tarea
        "valor": false, // Inicializamos con valor false
      });
    });
    accioCancelar();
  }

  void accioCancelar() {
    Navigator.of(context).pop();
    tecTextTasca.clear();
  }

  void canviaCheckbox(int posLlista) {
    //* Para actualizar la pantalla
    setState(() {
      //* ! =  es no true
      db.tasquesLlista[posLlista]["valor"] =
          !db.tasquesLlista[posLlista]["valor"];
      db.actualizarDades();
    });
  }

  void accioEsborraTasca(int posLlista) {
    setState(() {
      db.tasquesLlista.removeAt(posLlista);
    });
    db.actualizarDades();
  }

  void CrearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogNovaTasca(
          tecTextTasca: tecTextTasca,
          accioGuardar: accioGuardar,
          accioCancelar: accioCancelar,
        );
      },
    );
  }

  // Metodo definido de la clase PaginaPrincipal
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
        itemCount: db.tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasques(
            textTasca: db.tasquesLlista[index]["titol"],
            valorCheckbox: db.tasquesLlista[index]["valor"],
            canviaValorCheckbox: (valor) => canviaCheckbox(index),
            esborraTasca: (valor) => accioEsborraTasca(index),
          );
        },
      ),
    );
  }
}
