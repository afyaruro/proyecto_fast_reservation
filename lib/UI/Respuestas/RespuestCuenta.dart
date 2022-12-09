import 'package:proyecto_fast_reservation/Controller/controlCuenta.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesCuenta.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesProducto.dart';
import 'package:proyecto_fast_reservation/domain/models/cuenta.dart';
import 'package:proyecto_fast_reservation/domain/models/producto.dart';

class RespuestaCuenta {
  String mensaje = "";
  List<Cuenta> cuentasMesa = [];

  RespuestAdd(
      String idProducto, String idMesa, CuentaController control) async {
    List<Cuenta> cuentas = await PeticionesCuenta.consultarGral();

    var catalogo = <String, dynamic>{
      'idMesa': idMesa,
      'idCuenta': "${idMesa}${cuentas.length + 1}",
      'idProducto': idProducto,
    };

    PeticionesCuenta.crearCuenta(catalogo);

    control.AddListaCuenta(idMesa);
  }

  Future<List<Cuenta>> ConsultarCuenta(String idmesa) async {
    List<Cuenta> cuentas = await PeticionesCuenta.consultarGral();

    for (var cuenta in cuentas) {
      if (idmesa == cuenta.idMesa) {
        cuentasMesa.add(cuenta);
        print(cuenta.idMesa);
      }
    }

    return cuentasMesa;
  }

  /* Future<List<Producto>> ConsultarPedido(
      String idMesa, CuentaController cuentaController) async {
    List<Cuenta> cuentas = await cuentaController.AddListaCuenta(idMesa);
    List<Producto> productos = await PeticionesProducto.consultarGral();
    List<Producto> pedido = [];

    for (var cuenta in cuentas) {
      for (var producto in productos) {
        if (cuenta.idProducto == producto.idProducto) {
          pedido.add(producto);
        }
      }
    }

    return pedido;
  } */
}
