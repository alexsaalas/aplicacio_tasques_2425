import 'package:aplicacio_tasques_2425/componentes/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancelar;

  const DialogNovaTasca(
      {super.key,
      required this.tecTextTasca,
      required this.accioGuardar,
      required this.accioCancelar});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: tecTextTasca, // Usamos el controlador proporcionado
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escriu la tasca...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Alineamos los botones
              children: [
                BotoDialog(
                  TextBoton: "Guardar",
                  accioBoto:
                      accioGuardar, // Ejecutamos la función cuando se presiona el botón
                ),
                BotoDialog(
                  TextBoton: "Cancelar",
                  accioBoto:
                      accioCancelar, // Ejecutamos la función cuando se presiona el botón
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
