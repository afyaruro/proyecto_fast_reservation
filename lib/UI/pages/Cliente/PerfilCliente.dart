import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/controlCliente.dart';

class PerfilCliente extends StatefulWidget {
  PerfilCliente({Key? key}) : super(key: key);

  @override
  State<PerfilCliente> createState() => _PerfilClienteState();
}

class _PerfilClienteState extends State<PerfilCliente> {
  ClienteController controlcliente = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(
          width: 20,
          height: 100,
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text("Datos Personales",
                style: TextStyle(
                    color: Color.fromARGB(255, 102, 105, 110), fontSize: 30)),
          ),
        ),
        const SizedBox(
          width: 20,
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: const Text(
            "Nombre de Usuario:",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Obx(
            () => TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: controlcliente.nameUser,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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
        Container(
          margin: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Obx(
            () => TextField(
              enabled: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: controlcliente.password,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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
        Container(
          margin: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Obx(
            () => TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: controlcliente.nombreApellido,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
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
            "Telefonos:",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Obx(
            () => TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: controlcliente.telefono,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
          height: 30,
        ),
        IconButton(
            onPressed: () {
              setState(() {
                controlcliente.Salir(controlcliente.nameUser);
                Get.showSnackbar(const GetSnackBar(
                  title: 'Cerrar Sesión',
                  message: 'Seción Cerrada correctamente',
                  icon: Icon(
                    Icons.beenhere,
                    color: Colors.lime,
                  ),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color.fromARGB(150, 0, 94, 128),
                ));

                Navigator.pushNamed(context, '/login');
              });
            },
            icon: const Icon(
              Icons.exit_to_app,
              size: 30,
            )),
        const SizedBox(
          width: 20,
          height: 30,
        ),
      ]),
    );
  }
}
