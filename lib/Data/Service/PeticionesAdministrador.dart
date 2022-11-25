import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_fast_reservation/domain/models/user.dart';
import 'dart:developer';

class PeticionesAdministrador {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearAdministrador(Map<String, dynamic> catalogo) async {
    await _db
        .collection('Administrador')
        .doc(catalogo['userName'])
        .set(catalogo)
        .catchError((e) {});
  }

  static Future<List<Usuario>> consultarGral() async {
    List<Usuario> lista = [];
    await _db.collection("Administrador").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Usuario.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
