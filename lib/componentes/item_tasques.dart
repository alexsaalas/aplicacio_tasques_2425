import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasques extends StatelessWidget {
  final String textTasca;
  final bool valorCheckbox;
  final Function(bool?)? canviaValorCheckbox;
  final Function(BuildContext)? esborraTasca;
  const ItemTasques(
      {super.key,
      required this.textTasca,
      required this.valorCheckbox,
      required this.esborraTasca,
      required this.canviaValorCheckbox});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //* Slidable = se puede arrastrar
      child: Slidable(
        endActionPane: ActionPane(
          //* Tipo de movimiento
          motion: const StretchMotion(),

          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: esborraTasca,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                // Checkbox
                Checkbox(
                  activeColor: Colors.teal[200],
                  checkColor: Colors.orange[200],
                  side: BorderSide(color: Colors.orange[200]!, width: 2),
                  value: true,
                  onChanged: canviaValorCheckbox,
                ),

                // Text
                Text(
                  textTasca,
                  style: TextStyle(
                    color: Colors.orange[200],
                    decoration: valorCheckbox
                        //* Si es true se pone la linea
                        ? TextDecoration.lineThrough
                        //* y si no no pongas nada
                        : TextDecoration.none,
                    decorationColor: Colors.orange[200],
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
