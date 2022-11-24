import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/ControlProducto.dart';

class ConsultaProducto extends StatefulWidget {
  ConsultaProducto({Key? key}) : super(key: key);

  @override
  State<ConsultaProducto> createState() => _ConsultaProductoState();
}

class _ConsultaProductoState extends State<ConsultaProducto> {
  var _image;
  ProductoController controlProducto = Get.find();
  TextEditingController tex = TextEditingController();
  String mensaje = "";

  String LLamarImagen() {
    if (controlProducto.imagenProducto == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = controlProducto.imagenProducto;
    }

    tex.text = controlProducto.descripcionProducto;

    return _image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Consultar Producto"),
        backgroundColor: const Color(0xFF005E80),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                height: 150,
                margin: const EdgeInsets.only(
                    top: 100, left: 100, right: 100, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Obx(() => Image.network(
                      LLamarImagen(),
                      fit: BoxFit.cover,
                    ))),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Id Mesa:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlProducto.idProducto,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Nombre Mesa:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlProducto.nombreProducto,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Precio Producto:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlProducto.precioProducto,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Descrición Mesa:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                style: TextStyle(color: Colors.grey),
                controller: tex,
                minLines: 6,
                enabled: false,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
