import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Controller/controlCuenta.dart';
import 'package:proyecto_fast_reservation/UI/Respuestas/RespuestCuenta.dart';
import 'package:proyecto_fast_reservation/domain/models/producto.dart';

import '../../../Controller/ControlFirebaseMesas.dart';
import '../../../Controller/ControlProducto.dart';

class CuentaxMesa extends StatefulWidget {
  CuentaxMesa({Key? key}) : super(key: key);

  @override
  State<CuentaxMesa> createState() => _CuentaxMesaState();
}

class _CuentaxMesaState extends State<CuentaxMesa> {
  MesaController control = Get.find();

  var _image;
  var _imageMesa;
  final RespuestaCuenta respuesta = RespuestaCuenta();

  String LLamarImagen(ProductoController control, int posicion) {
    if (control.getproductosGral![posicion].foto == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = control.getproductosGral![posicion].foto;
    }

    return _image;
  }

  String LLamarImagenMesa() {
    if (control.imagenMesa == "") {
      _imageMesa =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _imageMesa = control.imagenMesa;
    }

    return _imageMesa;
  }

  @override
  Widget build(BuildContext context) {
    CuentaController controlCuenta = Get.find();

    controlCuenta.AddListaCuenta(control.idMesa).then((value) => null);
    controlCuenta.consultaCuentas().then((value) => null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular Cuenta"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/mesaPedido');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(LLamarImagenMesa()),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '${control.nombreMesa}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Obx(
              () => controlCuenta.cuentaxMesa?.isEmpty == false
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controlCuenta.cuentaxMesa?.isEmpty == true
                          ? 0
                          : controlCuenta.cuentaxMesa!.length,
                      itemBuilder: (context, posicion) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            child: Text("Hola"),
                          ),
                          title: Text(
                            controlCuenta.cuentaxMesa![posicion].idCuenta,
                            style: TextStyle(color: Colors.amber),
                          ),
                          subtitle:
                              Text(controlCuenta.cuentaxMesa![posicion].idMesa),
                          trailing: Container(
                            width: 80,
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                controlCuenta.cuentaxMesa![posicion].idProducto,
                              ),
                            ),
                          ),
                        );
                      })
                  : const Text("Esta Mesa no tiene Productos Registrados"),
            ),
            SizedBox(
              width: 20,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.red),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Nueva Cuenta",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    )),
                Container(
                    height: 50,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.lime),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Calcular Cuenta",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    )),
              ],
            ),
            SizedBox(
              width: 20,
              height: 30,
            ),
            Text("Total: 50000", style: TextStyle(fontSize: 30)),
            SizedBox(
              width: 20,
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/listaProducto');
          setState(() {});
        },
        backgroundColor: const Color(0xFF80DDFF),
        child: const Icon(Icons.add_shopping_cart_sharp),
      ),
    );
  }
}
