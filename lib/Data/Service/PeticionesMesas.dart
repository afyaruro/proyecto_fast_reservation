import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:proyecto_fast_reservation/domain/models/mesa.dart';

class PeticionesMesa {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearMesa(Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idMesa']);
    }

    catalogo['foto'] = url.toString();

    await _db
        .collection('Mesas')
        .doc(catalogo['idMesa'])
        .set(catalogo)
        .catchError((e) {});
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var idMesa) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Mesas");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idMesa).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<void> actualizarMesa(
      String id, Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idMesa']);
    }

    catalogo['foto'] = url.toString();

    await _db.collection('Mesas').doc(id).update(catalogo).catchError((e) {
      log(e);
    });
  }

  static Future<void> eliminarMesa(String id) async {
    await _db.collection("Mesas").doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  static Future<List<Mesa>> consultarGral() async {
    List<Mesa> lista = [];
    await _db.collection("Mesas").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Mesa.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
