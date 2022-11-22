import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/domain/models/mesa.dart';
import '../Data/Service/PeticionesMesas.dart';

class MesaController extends GetxController {
  //Consultar Lista de Mesas
  final Rxn<List<Mesa>> _mesasFirestore = Rxn<List<Mesa>>();
  List<Mesa>? get getmesasGral => _mesasFirestore.value;
  //Consultar Mesa por id

  final Rx<dynamic> _imagenMesa = "".obs;
  String get imagenMesa => _imagenMesa.value;

  Future<void> consultaMesas() async {
    _mesasFirestore.value = await PeticionesMesa.consultarGral();
  }

  Future<void> consultaMesa(String id) async {
    List<Mesa> lista = await PeticionesMesa.consultarGral();

    for (var mesa in lista) {
      if (mesa.idMesa == id) {
        _imagenMesa.value = mesa.foto;
      }
    }
  }
}
