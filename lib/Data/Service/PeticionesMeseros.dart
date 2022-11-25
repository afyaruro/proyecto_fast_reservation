import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_fast_reservation/domain/models/mesero.dart';
import 'dart:developer';

class PeticionesMesero {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearMesero(Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['userName']);
    }

    catalogo['foto'] = url.toString();

    await _db
        .collection('Meseros')
        .doc(catalogo['userName'])
        .set(catalogo)
        .catchError((e) {});
  }

  static Future<dynamic> cargarfoto(var foto, var idMesero) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Meseros");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idMesero).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<void> actualizarMesero(
      String id, Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['userName']);
    }

    catalogo['foto'] = url.toString();

    await _db.collection('Meseros').doc(id).update(catalogo).catchError((e) {
      log(e);
    });
  }

  static Future<void> eliminarMesero(String id) async {
    await _db.collection("Meseros").doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  static Future<List<Mesero>> consultarGral() async {
    List<Mesero> lista = [];
    await _db.collection("Meseros").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Mesero.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
