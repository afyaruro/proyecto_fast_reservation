import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesCuenta.dart';
import 'package:proyecto_fast_reservation/UI/pages/Mesero/Cuenta.dart';
import 'package:proyecto_fast_reservation/domain/models/cuenta.dart';

import '../Data/Service/PeticionesProducto.dart';
import '../domain/models/producto.dart';

class CuentaController extends GetxController {
  final Rxn<List<Cuenta>> _cuentasFirestore = Rxn<List<Cuenta>>();
  List<Cuenta>? get getcuentasGral => _cuentasFirestore.value;

  final Rxn<List<Cuenta>> _cuentasxMesa = Rxn<List<Cuenta>>();
  List<Cuenta>? get cuentaxMesa => _cuentasxMesa.value;

  final Rxn<List<Producto>> _pedido = Rxn<List<Producto>>();
  List<Producto>? get productosxMesa => _pedido.value;

  final Rx<dynamic> _idMesa = "".obs;
  String get idMesa => _idMesa.value;

  Future<void> consultaCuentas() async {
    _cuentasFirestore.value = await PeticionesCuenta.consultarGral();
  }

  Future<List<Cuenta>> AddListaCuenta(String idMesa) async {
    List<Cuenta> lista = await PeticionesCuenta.consultarGral();
    List<Producto> productos = await PeticionesProducto.consultarGral();
    List<Producto> pedido = [];
    List<Cuenta> cuentaMesa = [];

    for (var cuenta in lista) {
      if (idMesa == cuenta.idMesa) {
        cuentaMesa.add(cuenta);
      }
    }

    _cuentasxMesa.value = cuentaMesa;
    print("Productos de la Cuenta en la Mesa");
    return cuentaMesa;
  }
}
