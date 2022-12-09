import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/controlCuenta.dart';

class prueba extends StatefulWidget {
  prueba({Key? key}) : super(key: key);

  @override
  State<prueba> createState() => _pruebaState();
}

class _pruebaState extends State<prueba> {
  @override
  Widget build(BuildContext context) {
    CuentaController control = Get.find();
    control.consultaCuentas().then((value) => null);
    return Scaffold(
      body: Obx(
        () => control.getcuentasGral?.isEmpty == false
            ? ListView.builder(
                itemCount: control.getcuentasGral?.isEmpty == true
                    ? 0
                    : control.getcuentasGral!.length,
                itemBuilder: (context, posicion) {
                  return ListTile(
                    leading: Text("Hola"),
                    title: Text(
                      control.getcuentasGral![posicion].idCuenta,
                      style: TextStyle(color: Colors.amber),
                    ),
                    subtitle: Text(control.getcuentasGral![posicion].idMesa),
                    trailing: Container(
                      width: 80,
                      height: 40,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          control.getcuentasGral![posicion].idProducto,
                        ),
                      ),
                    ),
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
