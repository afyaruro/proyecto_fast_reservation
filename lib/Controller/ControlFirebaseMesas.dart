import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/domain/models/mesa.dart';
import '../Data/Service/PeticionesMesas.dart';

class MesaController extends GetxController {
  //Consultar Lista de Mesas
  final Rxn<List<Mesa>> _mesasFirestore = Rxn<List<Mesa>>();
  List<Mesa>? get getmesasGral => _mesasFirestore.value;

  final Rxn<Mesa> _mesa = Rxn<Mesa>();
  Mesa? get mesa => _mesa.value;

  final Rx<dynamic> _imagenMesa = "".obs;
  String get imagenMesa => _imagenMesa.value;

  final Rx<dynamic> _idMesa = "".obs;
  String get idMesa => _idMesa.value;

  final Rx<dynamic> _nombreMesa = "".obs;
  String get nombreMesa => _nombreMesa.value;

  final Rx<dynamic> _descripcionMesa = "".obs;
  String get descripcionMesa => _descripcionMesa.value;

  Future<void> consultaMesas() async {
    _mesasFirestore.value = await PeticionesMesa.consultarGral();
  }

  Future<void> consultaMesa(String id) async {
    List<Mesa> lista = await PeticionesMesa.consultarGral();

    for (var mesa in lista) {
      if (mesa.idMesa == id) {
        _imagenMesa.value = mesa.foto;
        _idMesa.value = mesa.idMesa;
        _nombreMesa.value = mesa.nombreMesa;
        _descripcionMesa.value = mesa.descripcionMesa;
        _mesa.value = mesa;
      }
    }
  }
}
