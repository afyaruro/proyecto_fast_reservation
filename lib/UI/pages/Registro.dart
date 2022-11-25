import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proyecto_fast_reservation/UI/Respuestas/RespuestaCliente.dart';

import '../../Controller/controlCliente.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class Registro extends StatelessWidget {
  Registro({Key? key}) : super(key: key);

  TextEditingController controlNameUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  TextEditingController controlNombreApellido = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();
  ClienteController controlCliente = Get.find();
  final RespuestaCliente respuesta = RespuestaCliente();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 200,
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
                color: Colors.transparent,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text("SIGN IN",
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ),
                    Text(
                      "/",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      " SIGN UP",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text("Fast Reservation",
                      style: TextStyle(
                          color: Color.fromARGB(255, 102, 105, 110),
                          fontSize: 30)),
                ),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  controller: controlNameUser,
                  decoration: InputDecoration(
                    labelText: 'Nombre de Usuario',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  controller: controlPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  controller: controlNombreApellido,
                  decoration: InputDecoration(
                    labelText: 'Nombre y Apellido',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  controller: controlTelefono,
                  decoration: InputDecoration(
                    labelText: 'Telefono',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 30,
              ),
              Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(colors: [
                        Color(0xFF00BBFF),
                        Color(0xFF80DDFF),
                        Color(0xFF00BBFF),
                      ])),
                  child: TextButton(
                    onPressed: () async {
                      respuesta.RespuestaAdd(
                          controlNameUser.text,
                          controlPassword.text,
                          controlNombreApellido.text,
                          controlTelefono.text,
                          controlCliente);
                    },
                    child: Text("Registrarse",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  )),
              SizedBox(
                width: 20,
                height: 50,
              ),
            ],
          )),
    );
  }
}
