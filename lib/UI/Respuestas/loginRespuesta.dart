import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesAdministrador.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesCliente.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesMeseros.dart';
import 'package:proyecto_fast_reservation/domain/models/user.dart';
import 'package:flutter/material.dart';

import '../../Controller/controlCliente.dart';
import '../../Controller/controlMesero.dart';

class RespuestaLogin {
  String mensaje = "";
  ClienteController controlCliente = Get.find();
  MeseroController controlMesero = Get.find();

  Logeo(String userName, String password) async {
    List<Usuario> listaUser = [];

    mensaje = "";

    var listaAdmin = await PeticionesAdministrador.consultarGral();
    var listaCliente = await PeticionesCliente.consultarGral();
    var listaMesero = await PeticionesMesero.consultarGral();

//guardar admin en la lista
    for (var user in listaAdmin) {
      Usuario usuario = Usuario(
          userName: user.userName,
          password: user.password,
          tipoUser: user.tipoUser);

      //print(usuario.tipoUser);
      listaUser.add(usuario);
    }

    //guardar cliente en la lista
    for (var user in listaCliente) {
      Usuario usuario = Usuario(
          userName: user.userName,
          password: user.password,
          tipoUser: user.tipoUser);
      //print(usuario.tipoUser);
      listaUser.add(usuario);
    }

    //guardar cliente en la lista
    for (var user in listaMesero) {
      Usuario usuario = Usuario(
          userName: user.userName,
          password: user.password,
          tipoUser: user.tipoUser);
      //print(usuario.tipoUser);
      listaUser.add(usuario);
    }

    //pregunto si esta en la lista registrado con el nombre de usuario y si la contraseña coincide
    for (var user in listaUser) {
      if (user.userName == userName && user.password == password) {
        if (user.tipoUser == "Administrador") {
          Get.toNamed('/inicioAdmin');
        } else if (user.tipoUser == "Cliente") {
          controlCliente.consultaCliente(userName);
          Get.toNamed('/ClienteReserva');
        } else if (user.tipoUser == "Mesero") {
          controlMesero.consultaMesero(userName);
          Get.toNamed('/mesaPedido');
        }

        Get.showSnackbar(const GetSnackBar(
          title: 'Validación',
          message: 'Inicio de sesión correcto',
          icon: Icon(
            Icons.beenhere,
            color: Colors.lime,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(150, 0, 94, 128),
        ));
        mensaje = "Encontrado";
      }
    }

    if (mensaje != "Encontrado") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Validacion Incorrecta',
        message: 'Usuario o contraseña incorrecto',
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    }
  }
}
