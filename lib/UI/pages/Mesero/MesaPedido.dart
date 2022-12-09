import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesMesas.dart';
import 'package:proyecto_fast_reservation/UI/Respuestas/RespuestCuenta.dart';

import '../../../Controller/ControlFirebaseMesas.dart';
import '../../../Controller/ControlProducto.dart';
import '../../../Controller/controlCuenta.dart';
import '../../../Controller/controlMesero.dart';

class MesaPedido extends StatefulWidget {
  MesaPedido({Key? key}) : super(key: key);

  @override
  State<MesaPedido> createState() => _MesaPedidoState();
}

class _MesaPedidoState extends State<MesaPedido> {
  MesaController controladorMesa = Get.find();
  CuentaController control = Get.find();
  final RespuestaCuenta respuesta = new RespuestaCuenta();

  var _image;

  String LLamarImagen(MesaController control, int posicion) {
    if (control.getmesasGral![posicion].foto == "") {
      _image =
          "https://farm5.staticflickr.com/4363/36346283311_74018f6e7d_o.png";
    } else {
      _image = control.getmesasGral![posicion].foto;
    }

    return _image;
  }

  @override
  Widget build(BuildContext context) {
    controladorMesa.consultaMesas().then((value) => null);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Obx(
          () => controladorMesa.getmesasGral?.isEmpty == false
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controladorMesa.getmesasGral?.isEmpty == true
                      ? 0
                      : controladorMesa.getmesasGral!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                  LLamarImagen(controladorMesa, index),
                                ),
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                    Color.fromARGB(192, 87, 87, 87),
                                    BlendMode.modulate))),
                        child: TextButton(
                          onPressed: () {
                            respuesta.ConsultarCuenta(control.idMesa);
                            controladorMesa.consultaMesa(
                                controladorMesa.getmesasGral![index].idMesa);
                            control.AddListaCuenta(
                                controladorMesa.getmesasGral![index].idMesa);
                            Get.toNamed('/cuentaMesa');
                            // Navigator.pushNamed(context, '/cuentaMesa');
                            /* controlCuenta.AddListaCuenta(
                                controladorMesa.idMesa); */
                          },
                          child: Text(
                              controladorMesa.getmesasGral![index].nombreMesa,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ));
                  },
                )
              : const Icon(Icons.abc),
        ),
      ),
    );
  }
}
