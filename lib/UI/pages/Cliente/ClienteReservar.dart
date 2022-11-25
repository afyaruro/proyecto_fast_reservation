import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/UI/pages/Administrador/InicioAdmin.dart';
import 'package:proyecto_fast_reservation/UI/pages/Login.dart';

import '../ConsultaGenerales/ConsultarProductos.dart';
import 'PerfilCliente.dart';

class ClienteReserva extends StatefulWidget {
  ClienteReserva({Key? key}) : super(key: key);

  @override
  State<ClienteReserva> createState() => _ClienteReservaState();
}

class _ClienteReservaState extends State<ClienteReserva> {
  @override
  int index = 0;
  final List<Widget> Ruta = [
    Login(),
    PerfilCliente(),
    ConsultarProductos(),
    Login()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int i) {
            index = i;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF3CB3DF),
          iconSize: 25.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.groups_sharp,
                ),
                label: "Perfil"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.flatware,
                ),
                label: "Menu"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.deck,
                ),
                label: "Reservas"),
          ]),
      body: Ruta[index],
    );
  }
}
