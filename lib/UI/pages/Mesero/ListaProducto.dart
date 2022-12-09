import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/controlCuenta.dart';
import 'package:proyecto_fast_reservation/UI/Respuestas/RespuestCuenta.dart';

import '../../../Controller/ControlFirebaseMesas.dart';
import '../../../Controller/ControlProducto.dart';

class ListaProductos extends StatefulWidget {
  ListaProductos({Key? key}) : super(key: key);

  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  var _image;
  final RespuestaCuenta respuesta = RespuestaCuenta();
  MesaController control = Get.find();
  CuentaController controlCuenta = Get.find();

  String LLamarImagen(ProductoController control, int posicion) {
    if (control.getproductosGral![posicion].foto == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = control.getproductosGral![posicion].foto;
    }

    return _image;
  }

  @override
  Widget build(BuildContext context) {
    ProductoController controladorProducto = Get.find();
    controladorProducto.consultaProductos().then((value) => null);
    return Scaffold(
      body: Obx(
        () => controladorProducto.getproductosGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorProducto.getproductosGral?.isEmpty == true
                    ? 0
                    : controladorProducto.getproductosGral!.length,
                itemBuilder: (context, posicion) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        LLamarImagen(controladorProducto, posicion),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      controladorProducto
                          .getproductosGral![posicion].nombreProducto,
                      style: TextStyle(color: Colors.amber),
                    ),
                    subtitle: Text(controladorProducto
                        .getproductosGral![posicion].descripcionProducto),
                    trailing: Container(
                      width: 80,
                      height: 40,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          controladorProducto
                              .getproductosGral![posicion].precioProducto,
                        ),
                      ),
                    ),
                    onTap: () {
                      //controlCuenta.AddListaCuenta(control.idMesa);
                      respuesta.RespuestAdd(
                          controladorProducto
                              .getproductosGral![posicion].idProducto,
                          control.idMesa,
                          controlCuenta);
                      Get.toNamed('/cuentaMesa');
                    },
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
