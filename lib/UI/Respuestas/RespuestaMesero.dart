import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesMeseros.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesProducto.dart';

import '../../Controller/controlMesero.dart';
import '../../domain/models/mesero.dart';
import '../../domain/models/producto.dart';

class RespuestaMesero {
  String mensaje = "";

  RespuestaAdd(String id, String password, String nombre, String telefono,
      String salario, var _image) async {
    if (id == "" ||
        password == "" ||
        nombre == "" ||
        telefono == "" ||
        salario == "") {
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
      List<Mesero> lista = await PeticionesMesero.consultarGral();
      this.mensaje = "";
      for (var mesero in lista) {
        if (mesero.userName == id) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Error',
            message:
                "Error: Ya un mesero ya se encuentra registrado con el nombre de usuario",
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
          'userName': id,
          'password': password,
          'nombreApellido': nombre,
          'telefono': telefono,
          'tipoUser': 'Mesero',
          'salario': salario,
          'foto': ''
        };

        PeticionesMesero.crearMesero(catalogo, _image);
        Get.showSnackbar(const GetSnackBar(
          title: 'Creación Mesero',
          message: 'Mesero creado correctamente',
          icon: Icon(
            Icons.beenhere,
            color: Colors.lime,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(150, 0, 94, 128),
        ));
      }
    }
  }

  RespuestaModificar(String userName, String password, String nombre,
      String telefono, String salario, var _image) async {
    if (userName == "" ||
        password == "" ||
        nombre == "" ||
        telefono == "" ||
        salario == "") {
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
      List<Mesero> lista = await PeticionesMesero.consultarGral();
      this.mensaje = "";
      for (var mesero in lista) {
        if (mesero.userName == userName) {
          var catalogo = <String, dynamic>{
            'userName': userName,
            'password': password,
            'nombreApellido': nombre,
            'telefono': telefono,
            'tipoUser': 'Mesero',
            'salario': salario,
            'foto': ''
          };

          PeticionesMesero.actualizarMesero(userName, catalogo, _image);
          Get.showSnackbar(const GetSnackBar(
            title: 'Actualización Mesero',
            message: 'Mesero actualizado correctamente',
            icon: Icon(
              Icons.beenhere,
              color: Colors.lime,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(150, 0, 94, 128),
          ));
          this.mensaje = "Encontrada";
        }
      }

      if (mensaje != "Encontrada") {
        Get.showSnackbar(const GetSnackBar(
          title: 'Error',
          message: "Error: El mesero NO EXISTE",
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

  RespuestaDelete(String userName) async {
    if (userName == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos de nombre de usuario vacio, por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Mesero> lista = await PeticionesMesero.consultarGral();
      this.mensaje = "";
      for (var mesero in lista) {
        if (mesero.userName == userName) {
          this.mensaje = "Encontrada";
          PeticionesMesero.eliminarMesero(userName);
          Get.showSnackbar(const GetSnackBar(
            title: 'Mesero Eliminado',
            message: 'Mesero eliminado correctamente',
            icon: Icon(
              Icons.beenhere,
              color: Colors.lime,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(150, 0, 94, 128),
          ));
        }
      }

      if (mensaje != "Encontrada") {
        Get.showSnackbar(const GetSnackBar(
          title: 'Error',
          message: "Error: NO EXISTE un mesero con el nombre de usuario",
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

  RespuestaBusquedaxId(String username, MeseroController control) async {
    control.consultaMesero(username);
    if (username == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos nombre de usuario vacio por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Mesero> lista = await PeticionesMesero.consultarGral();
      this.mensaje = "";
      for (var mesero in lista) {
        if (mesero.userName == username) {
          this.mensaje = "Encontrada";
          Get.toNamed('/consultaMesero');
          Get.showSnackbar(const GetSnackBar(
            title: 'Consulta Mesero',
            message: 'Mesero encontrado correctamente',
            icon: Icon(
              Icons.beenhere,
              color: Colors.lime,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(150, 0, 94, 128),
          ));
        }
      }

      if (mensaje != "Encontrada") {
        Get.showSnackbar(const GetSnackBar(
          title: 'Error',
          message: "Error: NO EXISTE un Mesero con el nombre de usuario",
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
}
