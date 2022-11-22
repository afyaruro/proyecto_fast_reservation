import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ControlFirebaseMesas.dart';

class ConsultaMesa extends StatefulWidget {
  ConsultaMesa({Key? key}) : super(key: key);

  @override
  State<ConsultaMesa> createState() => _ConsultaMesaState();
}

class _ConsultaMesaState extends State<ConsultaMesa> {
  var _image;
  TextEditingController controlIdMesa = TextEditingController();
  TextEditingController controlNombreMesa = TextEditingController();
  TextEditingController controlDescripcion = TextEditingController();
  MesaController controlMesa = Get.find();
  String mensaje = "";
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
            Obx(() => Text('${controlMesa.imagenMesa}')),
            Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.only(
                    top: 100, left: 100, right: 100, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  controlMesa.imagenMesa,
                  fit: BoxFit.cover,
                )),
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                enabled: false,
                controller: controlIdMesa,
                decoration: InputDecoration(
                  labelText: 'Id de la Mesa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                enabled: false,
                controller: controlNombreMesa,
                decoration: InputDecoration(
                  labelText: 'Nombre de la Mesa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                enabled: false,
                controller: controlDescripcion,
                decoration: InputDecoration(
                  labelText: 'Descripcion de la Mesa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
