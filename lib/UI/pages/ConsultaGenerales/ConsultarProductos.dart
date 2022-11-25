import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/ControlProducto.dart';

class ConsultarProductos extends StatefulWidget {
  ConsultarProductos({Key? key}) : super(key: key);

  @override
  State<ConsultarProductos> createState() => _ConsultarProductosState();
}

class _ConsultarProductosState extends State<ConsultarProductos> {
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
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      child: controladorProducto
                                  .getproductosGral![posicion].foto !=
                              ''
                          ? Image.network(controladorProducto
                              .getproductosGral![posicion].foto)
                          : const Icon(Icons.photo),
                    ),
                    title: Text(controladorProducto
                        .getproductosGral![posicion].nombreProducto),
                    subtitle: Text(controladorProducto
                        .getproductosGral![posicion].descripcionProducto),
                    trailing: Container(
                      width: 80,
                      height: 40,
                      color: Color(0xFF3CB3DF),
                      child: Center(
                        child: Text(
                          controladorProducto
                              .getproductosGral![posicion].precioProducto,
                        ),
                      ),
                    ),
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
