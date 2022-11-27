import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/controlMesero.dart';
import '../../../../Controller/ControlProducto.dart';

class ConsultaMesero extends StatefulWidget {
  ConsultaMesero({Key? key}) : super(key: key);

  @override
  State<ConsultaMesero> createState() => _ConsultaMeseroState();
}

class _ConsultaMeseroState extends State<ConsultaMesero> {
  var _image;
  MeseroController controlMesero = Get.find();
  String mensaje = "";

  String LLamarImagen() {
    if (controlMesero.imagenMesero == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = controlMesero.imagenMesero;
    }

    return _image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Consultar Mesero"),
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
                "nombre de usuario:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlMesero.nameUser,
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
                "Contraseña:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlMesero.password,
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
                "Nombres y Apellidos:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlMesero.nombreApellido,
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
                "Telefono:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlMesero.telefono,
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
                "Salario:",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: controlMesero.salario,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
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
