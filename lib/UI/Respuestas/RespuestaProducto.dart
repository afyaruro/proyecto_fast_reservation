import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/ControlProducto.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesProducto.dart';

import '../../domain/models/producto.dart';

class RespuestaProducto {
  String mensaje = "";

  RespuestaAdd(String id, String descripcion, String nombre, String precio,
      var _image) async {
    if (id == "" || nombre == "" || descripcion == "" || precio == "") {
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
      List<Producto> lista = await PeticionesProducto.consultarGral();
      this.mensaje = "";
      for (var producto in lista) {
        if (producto.idProducto == id) {
          Get.showSnackbar(const GetSnackBar(
            title: 'Error',
            message:
                "Error: Ya un producto ya se encuentra registrado con el id",
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
          'idProducto': id,
          'nombreProducto': nombre,
          'descripcionProducto': descripcion,
          'precioProducto': precio,
          'foto': ''
        };

        PeticionesProducto.crearProducto(catalogo, _image);
        Get.showSnackbar(const GetSnackBar(
          title: 'Creación Producto',
          message: 'Producto creado correctamente',
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

  RespuestaModificar(String id, String descripcion, String nombre,
      String precio, var _imagen) async {
    if (id == "" || descripcion == "" || nombre == "" || precio == "") {
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
      List<Producto> lista = await PeticionesProducto.consultarGral();
      this.mensaje = "";
      for (var producto in lista) {
        if (producto.idProducto == id) {
          var catalogo = <String, dynamic>{
            'idProducto': id,
            'nombreProducto': nombre,
            'descripcionProducto': descripcion,
            'precioProducto': precio,
            'foto': ''
          };

          PeticionesProducto.actualizarProducto(id, catalogo, _imagen);
          Get.showSnackbar(const GetSnackBar(
            title: 'Actualización Producto',
            message: 'Producto actualizado correctamente',
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
          message: "Error: El producto NO EXISTE",
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
        message: "Error: Campos de Id Producto vacio, por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Producto> lista = await PeticionesProducto.consultarGral();
      this.mensaje = "";
      for (var producto in lista) {
        if (producto.idProducto == id) {
          this.mensaje = "Encontrada";
          PeticionesProducto.eliminarMesa(id);
          Get.showSnackbar(const GetSnackBar(
            title: 'Producto Eliminado',
            message: 'Producto eliminado correctamente',
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
          message: "Error: NO EXISTE un producto con el id",
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

  RespuestaBusquedaxId(String id, ProductoController controlProducto) async {
    controlProducto.consultaMesa(id);
    if (id == "") {
      Get.showSnackbar(const GetSnackBar(
        title: 'Error',
        message: "Error: Campos de Id Producto vacio por favor llenarlo",
        icon: Icon(
          Icons.error,
          color: Color.fromARGB(255, 187, 2, 2),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Color.fromARGB(150, 0, 94, 128),
      ));
    } else {
      List<Producto> lista = await PeticionesProducto.consultarGral();
      this.mensaje = "";
      for (var producto in lista) {
        if (producto.idProducto == id) {
          this.mensaje = "Encontrada";
          Get.toNamed('/consultaProducto');
          Get.showSnackbar(const GetSnackBar(
            title: 'Consulta Producto',
            message: 'Producto encontrado correctamente',
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
          message: "Error: NO EXISTE un producto con el id",
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
