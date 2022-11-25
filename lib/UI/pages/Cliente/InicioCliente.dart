import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Controller/controlCliente.dart';

class InicioCliente extends StatefulWidget {
  InicioCliente({Key? key}) : super(key: key);

  @override
  State<InicioCliente> createState() => _InicioClienteState();
}

class _InicioClienteState extends State<InicioCliente> {
  ClienteController controlcliente = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.60,
              decoration: const BoxDecoration(color: Color(0xFF80DDFF)),
              child: Center(
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Obx(
                      () => Text(
                          "Hola, Bienvenido " + controlcliente.nombreApellido,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          )),
                    )),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 100,
              color: Color(0xFF80DDFF),
              child: SvgPicture.asset(
                //color: Color(0xFF80DDFF),
                'assets/wave3.svg',
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 50),
              child: const Text(
                "En esta aplicación usted podra realizar las reservar de su mesa y conocer el menu que manejamos",
                style:
                    TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
                height: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF00BBFF),
                      Color(0xFF80DDFF),
                      Color(0xFF00BBFF),
                    ])),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ClienteReserva');
                  },
                  child: Text("Continuar",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                )),
          ],
        ),
      ),
    );
  }
}
