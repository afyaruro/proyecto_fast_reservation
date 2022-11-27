import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/ControlProducto.dart';

class ConsultarProductos extends StatefulWidget {
  ConsultarProductos({Key? key}) : super(key: key);

  @override
  State<ConsultarProductos> createState() => _ConsultarProductosState();
}

class _ConsultarProductosState extends State<ConsultarProductos> {
  var _image;

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
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
