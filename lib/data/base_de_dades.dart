import 'package:hive/hive.dart';

class BaseDeDades {

  List tasquesLlista = [];

  //Box boxTasquesApp = sirve para acceder a la box de dades
  final Box boxTasquesApp = Hive.box("box_tasques_app");

  // Dades de ejemplo
  void crearDadesExemple() { 
    tasquesLlista= [
        {"titol": "Tasca 1", "valor": false},
        {"titol": "Tasca 2", "valor": true},
        {"titol": "Tasca 3", "valor": true},
    ];
  }
  // Carga de dades
  void CargarDades() {
    // el get sirve para coger datos 
    tasquesLlista = boxTasquesApp.get("box_tasques_app");
    
}
// Actualización de dades
void actualizarDades() {
  boxTasquesApp.put("box_tasques_app", tasquesLlista);
}
}