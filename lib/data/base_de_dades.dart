import 'package:hive/hive.dart';

class BaseDeDades {

  List tasquesLlista = [];

  final Box boxTasquesApp = Hive.box("box_tasques_app");

  void crearDadesExemple() { 
    tasquesLlista= [
        {"titol": "Tasca 1", "valor": false},
        {"titol": "Tasca 2", "valor": true},
        {"titol": "Tasca 3", "valor": true},
    ];
  }

  void CargarDades() {
    tasquesLlista = boxTasquesApp.get("box_tasques_app");
    
}
void actualizarDades() {
  boxTasquesApp.put("box_tasques_app", tasquesLlista);
}
}