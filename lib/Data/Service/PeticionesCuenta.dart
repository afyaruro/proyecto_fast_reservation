import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:proyecto_fast_reservation/domain/models/cuenta.dart';

class PeticionesCuenta {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearCuenta(Map<String, dynamic> catalogo) async {
    await _db
        .collection('Cuenta')
        .doc(catalogo['idCuenta'])
        .set(catalogo)
        .catchError((e) {});
  }

  static Future<List<Cuenta>> consultarGral() async {
    List<Cuenta> lista = [];
    await _db.collection("Cuenta").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Cuenta.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
