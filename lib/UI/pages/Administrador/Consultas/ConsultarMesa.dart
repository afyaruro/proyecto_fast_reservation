import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/ControlFirebaseMesas.dart';

class ConsultaMesa extends StatefulWidget {
  ConsultaMesa({Key? key}) : super(key: key);

  @override
  State<ConsultaMesa> createState() => _ConsultaMesaState();
}

class _ConsultaMesaState extends State<ConsultaMesa> {
  var _image;
  TextEditingController controlIdMesa = TextEditingController();
  MesaController controlMesa = Get.find();
  TextEditingController tex = TextEditingController();
  String mensaje = "";

  String LLamarImagen() {
    if (controlMesa.imagenMesa == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = controlMesa.imagenMesa;
    }

    tex.text = controlMesa.descripcionMesa;
    return _image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Consultar Mesa"),
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
                    labelText: controlMesa.idMesa,
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
                    labelText: controlMesa.nombreMesa,
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
