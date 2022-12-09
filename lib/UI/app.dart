import 'package:flutter/material.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/Consultas/ConsultaMeseros.dart';
import 'package:proyecto_fast_reservation/UI/pages/Cliente/ClienteReservar.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/Consultas/ConsultarMesa.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/Consultas/ConsultarProducto.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/GestionarMesas.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/GestionarMeseros.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/GestionarProductos.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/InicioAdmin.dart';
import 'package:proyecto_fast_reservation/UI/pages/Cliente/InicioCliente.dart';
import 'package:proyecto_fast_reservation/UI/pages/ConsultaGenerales/Nueva.dart';
import 'package:proyecto_fast_reservation/UI/pages/Login.dart';
import 'package:proyecto_fast_reservation/UI/pages/Mesero/Cuenta.dart';
import 'package:proyecto_fast_reservation/UI/pages/Mesero/ListaProducto.dart';
import 'package:proyecto_fast_reservation/UI/pages/Mesero/MesaPedido.dart';
import 'package:proyecto_fast_reservation/UI/pages/Registro.dart';
import 'package:get/get.dart';

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fast Reservation",
      debugShowCheckedModeBanner: false,
      //home: AdicionarArticulos(),
      home: Login(),
      //home: prueba(),
      routes: {
        '/login': (context) => Login(),
        '/registro': (context) => Registro(),
        '/gestionarMesas': (context) => GestionarMesas(),
        '/gestionarProductos': (context) => GestionarProductos(),
        '/gestionarMeseros': (context) => GestionarMeseros(),
        '/inicioAdmin': (context) => InicioAdmin(),
        '/consultaMesa': (context) => ConsultaMesa(),
        '/consultaProducto': (context) => ConsultaProducto(),
        '/inicioCliente': (context) => InicioCliente(),
        '/ClienteReserva': (context) => ClienteReserva(),
        '/consultaMesero': (context) => ConsultaMesero(),
        '/mesaPedido': (context) => MesaPedido(),
        '/cuentaMesa': (context) => CuentaxMesa(),
        '/listaProducto': (context) => ListaProductos(),
      },
    );
  }
}
