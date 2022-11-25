import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/controlCliente.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesCliente.dart';
import 'package:proyecto_fast_reservation/domain/models/cliente.dart';

class RespuestaCliente {
  String mensaje = "";

  RespuestaAdd(String userName, String password, String nombreApellido,
      String telefono, ClienteController clienteController) async {
    if (userName == "" ||
        password == "" ||
        nombreApellido == "" ||
        telefono == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos Vacios por favor llenarlos todos",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Cliente> lista = await PeticionesCliente.consultarGral();
      this.mensaje = "";
      for (var cliente in lista) {
        if (cliente.userName == userName) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Error',
            message: "Error: Ya existe un cliente con el nombre de usuario",
            icon: Icon(
              Icons.error,
              color: Color.fromARGB(255, 187, 2, 2),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(150, 0, 94, 128),
          ));
          this.mensaje = "Encontrada";
        }
      }

      if (mensaje != "Encontrada") {
        var catalogo = <String, dynamic>{
          'userName': userName,
          'password': password,
          'nombreApellido': nombreApellido,
          'telefono': telefono,
          'tipoUser': 'Cliente'
        };

        PeticionesCliente.crearCliente(catalogo);
        Get.showSnackbar(const GetSnackBar(
          title: 'Creación Cliente',
          message: 'Cliente creado correctamente',
          icon: Icon(
            Icons.beenhere,
            color: Colors.lime,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(150, 0, 94, 128),
        ));

        clienteController.consultaCliente(userName);

        Get.toNamed('/inicioCliente');
      }
    }
  }
}
