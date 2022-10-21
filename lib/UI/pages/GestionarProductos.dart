import 'package:flutter/material.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

class GestionarProductos extends StatelessWidget {
  const GestionarProductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gestionar Productos"),
        backgroundColor: const Color(0xFF005E80),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              margin:
                  EdgeInsets.only(top: 100, left: 100, right: 100, bottom: 50),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                  iconSize: 100,
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.add_photo_alternate_outlined)),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Id del Producto',
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
                decoration: InputDecoration(
                  labelText: 'Nombre del Producto',
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
                decoration: InputDecoration(
                  labelText: 'Precio del Producto',
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
                decoration: InputDecoration(
                  labelText: 'Descripcion del Producto',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
            ),
            SizedBox(
              width: 20,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundColor: Color(0xFF005E80),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundColor: Color(0xFF005E80),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.create_rounded),
                        color: Colors.white,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundColor: Color(0xFF005E80),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        color: Colors.white,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundColor: Color(0xFF005E80),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                      )),
                )
              ],
            ),
            SizedBox(
              width: 20,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
