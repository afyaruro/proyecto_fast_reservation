import 'package:flutter/material.dart';
import 'package:proyecto_fast_reservation/UI/pages/ConsultarMesa.dart';
import 'package:proyecto_fast_reservation/UI/pages/GestionarMesas.dart';
import 'package:proyecto_fast_reservation/UI/pages/GestionarMeseros.dart';
import 'package:proyecto_fast_reservation/UI/pages/GestionarProductos.dart';
import 'package:proyecto_fast_reservation/UI/pages/InicioAdmin.dart';
import 'package:proyecto_fast_reservation/UI/pages/Login.dart';
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
      routes: {
        '/login': (context) => Login(),
        '/registro': (context) => Registro(),
        '/gestionarMesas': (context) => GestionarMesas(),
        '/gestionarProductos': (context) => GestionarProductos(),
        '/gestionarMeseros': (context) => GestionarMeseros(),
        '/inicioAdmin': (context) => InicioAdmin(),
        '/consultaMesa': (context) => ConsultaMesa(),
      },
    );
  }
}
