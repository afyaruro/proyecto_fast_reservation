import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:proyecto_fast_reservation/domain/models/cliente.dart';

class PeticionesCliente {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearCliente(Map<String, dynamic> catalogo) async {
    await _db
        .collection('Clientes')
        .doc(catalogo['userName'])
        .set(catalogo)
        .catchError((e) {});
  }

  static Future<List<Cliente>> consultarGral() async {
    List<Cliente> lista = [];
    await _db.collection("Clientes").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Cliente.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
