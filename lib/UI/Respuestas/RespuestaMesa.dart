import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/ControlFirebaseMesas.dart';

import '../../Data/Service/PeticionesMesas.dart';
import '../../domain/models/mesa.dart';

class RespuestaMesa {
  String mensaje = "";

  RespuestaAdd(String id, String nombre, String descripcion, var _image) async {
    if (id == "" || nombre == "" || descripcion == "") {
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
      List<Mesa> lista = await PeticionesMesa.consultarGral();
      this.mensaje = "";
      for (var mesa in lista) {
        if (mesa.idMesa == id) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Error',
            message:
                "Error: La Mesa con la identificacion ya se encuentra registrada",
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
          'idMesa': id,
          'nombreMesa': nombre,
          'descripcionMesa': descripcion,
          'foto': ''
        };

        PeticionesMesa.crearMesa(catalogo, _image);
        Get.showSnackbar(const GetSnackBar(
          title: 'Creación Mesa',
          message: 'Mesa creada correctamente',
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

  RespuestaActualizar(
      String id, String nombre, String descripcion, var _image) async {
    if (id == "" || nombre == "" || descripcion == "") {
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
      List<Mesa> lista = await PeticionesMesa.consultarGral();
      this.mensaje = "";
      for (var mesa in lista) {
        if (mesa.idMesa == id) {
          var catalogo = <String, dynamic>{
            'idMesa': id,
            'nombreMesa': nombre,
            'descripcionMesa': descripcion,
            'foto': ''
          };

          PeticionesMesa.actualizarMesa(id, catalogo, _image);
          Get.showSnackbar(const GetSnackBar(
            title: 'Actualización Mesa',
            message: 'Mesa actualizada correctamente',
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
          message: "Error: La Mesa NO EXISTE",
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

  RespuestaConsultarxId(String id, MesaController controlMesa) async {
    controlMesa.consultaMesa(id);
    if (id == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos de Id Mesa vacio por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Mesa> lista = await PeticionesMesa.consultarGral();
      this.mensaje = "";
      for (var mesa in lista) {
        if (mesa.idMesa == id) {
          this.mensaje = "Encontrada";
          Get.toNamed('/consultaMesa');
          Get.showSnackbar(const GetSnackBar(
            title: 'Consulta Mesa',
            message: 'Mesa encontrada',
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
          message: "Error: NO EXISTE una mesa con el id",
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

  RespuestaDelete(String id) async {
    if (id == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos de Id Mesa vacio por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Mesa> lista = await PeticionesMesa.consultarGral();
      this.mensaje = "";
      for (var mesa in lista) {
        if (mesa.idMesa == id) {
          this.mensaje = "Encontrada";
          PeticionesMesa.eliminarMesa(id);
          Get.showSnackbar(const GetSnackBar(
            title: 'Mesa Eliminada',
            message: 'Mesa eliminada correctamente',
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
          message: "Error: NO EXISTE una mesa con el id",
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
