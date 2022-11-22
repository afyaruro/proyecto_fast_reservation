import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 200,
                child: SvgPicture.asset(
                  color: Color(0xFF80DDFF),
                  'assets/wave.svg',
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
                    Text(
                      "SIGN IN ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "/",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      child: Text("SIGN UP",
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    )
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
                  decoration: InputDecoration(
                    labelText: 'User Name',
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
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 50,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/inicioAdmin');
                    },
                    child: Text("Ingresar",
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
