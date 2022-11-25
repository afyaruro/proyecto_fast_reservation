import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesCliente.dart';
import 'package:proyecto_fast_reservation/domain/models/cliente.dart';

class ClienteController extends GetxController {
  final Rxn<List<Cliente>> _clienteFirestore = Rxn<List<Cliente>>();
  List<Cliente>? get getclientesGral => _clienteFirestore.value;

  final Rxn<Cliente> _cliente = Rxn<Cliente>();
  Cliente? get cliente => _cliente.value;

  final Rx<dynamic> _nameUser = "".obs;
  String get nameUser => _nameUser.value;

  final Rx<dynamic> _password = "".obs;
  String get password => _password.value;

  final Rx<dynamic> _nombreApellido = "".obs;
  String get nombreApellido => _nombreApellido.value;

  final Rx<dynamic> _telefono = "".obs;
  String get telefono => _telefono.value;

  final Rx<dynamic> _tipoUser = "".obs;
  String get tipoUser => _tipoUser.value;

  Future<void> consultaClientes() async {
    _clienteFirestore.value = await PeticionesCliente.consultarGral();
  }

  Future<void> Salir(String userName) async {
    List<Cliente> lista = await PeticionesCliente.consultarGral();

    for (var cliente in lista) {
      if (cliente.userName == userName) {
        _nameUser.value = "";
        _password.value = "";
        _nombreApellido.value = "";
        _telefono.value = "";
        _tipoUser.value = "";
      }
    }
  }

  Future<void> consultaCliente(String userName) async {
    List<Cliente> lista = await PeticionesCliente.consultarGral();

    for (var cliente in lista) {
      if (cliente.userName == userName) {
        _nameUser.value = cliente.userName;
        _password.value = cliente.password;
        _nombreApellido.value = cliente.nombreApellido;
        _telefono.value = cliente.telefono;
        _tipoUser.value = cliente.tipoUser;
      }
    }
  }
}
