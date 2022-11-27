import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/controlMesero.dart';

class MesaPedido extends StatefulWidget {
  MesaPedido({Key? key}) : super(key: key);

  @override
  State<MesaPedido> createState() => _MesaPedidoState();
}

class _MesaPedidoState extends State<MesaPedido> {
  MeseroController controlMesero = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Hola Mesero ${controlMesero.nameUser}"),
      ),
    );
  }
}
