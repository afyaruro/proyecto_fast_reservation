import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesMeseros.dart';

import '../domain/models/mesero.dart';

class MeseroController extends GetxController {
  final Rxn<List<Mesero>> _meserosFirestore = Rxn<List<Mesero>>();
  List<Mesero>? get getmeserosGral => _meserosFirestore.value;

  final Rxn<Mesero> _mesero = Rxn<Mesero>();
  Mesero? get mesero => _mesero.value;

  final Rx<dynamic> _imagenMesero = "".obs;
  String get imagenMesero => _imagenMesero.value;

  final Rx<dynamic> _nameUser = "".obs;
  String get nameUser => _nameUser.value;

  final Rx<dynamic> _password = "".obs;
  String get password => _password.value;

  final Rx<dynamic> _nombreApellido = "".obs;
  String get nombreApellido => _nombreApellido.value;

  final Rx<dynamic> _telefono = "".obs;
  String get telefono => _telefono.value;

  final Rx<dynamic> _salario = "".obs;
  String get salario => _salario.value;

  final Rx<dynamic> _tipoUser = "".obs;
  String get tipoUser => _tipoUser.value;

  Future<void> consultaMeseros() async {
    _meserosFirestore.value = await PeticionesMesero.consultarGral();
  }

  Future<void> consultaMesero(String id) async {
    List<Mesero> lista = await PeticionesMesero.consultarGral();

    for (var mesero in lista) {
      if (mesero.userName == id) {
        _imagenMesero.value = mesero.foto;
        _mesero.value = mesero;
        _nameUser.value = mesero.userName;
        _password.value = mesero.password;
        _salario.value = mesero.salario;
        _nombreApellido.value = mesero.nombreApellido;
        _telefono.value = mesero.telefono;
        _tipoUser.value = mesero.tipoUser;
      }
    }
  }
}
