import 'package:flutter/material.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class InicioAdmin extends StatelessWidget {
  const InicioAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: DrawerAdmin(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //  centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text("Gestion Menu"),
        backgroundColor: const Color(0xFF005E80),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(children: [
          Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/mesa1.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0xC080ddff), BlendMode.modulate)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarMesas');
                },
                child: Text("Gestionar Mesas",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              )),
          Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/productos.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0xC080ddff), BlendMode.modulate)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarProductos');
                },
                child: Text("Gestionar Productos",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              )),
          Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("assets/mesero.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0xC080ddff), BlendMode.modulate)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarMeseros');
                },
                child: Text("Gestionar Meseros",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              )),
        ]),
      ),
    );
  }
}

class DrawerAdmin extends StatelessWidget {
  const DrawerAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color(0xFF80ddff),
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150.0, bottom: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/admin2.png"),
              radius: 70.0,
              backgroundColor: Colors.transparent,
            ),
          ),
          Center(
              child: Text(
            "Admin",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          )),
          Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 157, 224, 248),
              margin: EdgeInsets.only(top: 40.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarMesas');
                },
                child: Text("Gestionar Mesas",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 15,
                    )),
              )),
          Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 157, 224, 248),
              margin: EdgeInsets.only(top: 5.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarProductos');
                },
                child: Text("Gestionar Productos",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15)),
              )),
          Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 157, 224, 248),
              margin: EdgeInsets.only(top: 5.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gestionarMeseros');
                },
                child: Text("Gestionar Meseros",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15)),
              )),
          Container(
              width: double.infinity,
              height: 50,
              color: Color.fromARGB(255, 157, 224, 248),
              margin: EdgeInsets.only(top: 5.0, bottom: 50.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Cerrar Sesion",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15)),
              )),
        ],
      ),
    ));
  }
}
