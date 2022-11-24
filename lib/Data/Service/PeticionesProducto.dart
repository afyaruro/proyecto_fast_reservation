import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:proyecto_fast_reservation/domain/models/producto.dart';

class PeticionesProducto {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearProducto(Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idProducto']);
    }

    catalogo['foto'] = url.toString();

    await _db
        .collection('Productos')
        .doc(catalogo['idProducto'])
        .set(catalogo)
        .catchError((e) {});
    //return true;
  }

  static Future<dynamic> cargarfoto(var foto, var idProducto) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Productos");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idProducto).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<void> actualizarProducto(
      String id, Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idProducto']);
    }

    catalogo['foto'] = url.toString();

    await _db.collection('Productos').doc(id).update(catalogo).catchError((e) {
      log(e);
    });
  }

  static Future<void> eliminarMesa(String id) async {
    await _db.collection("Productos").doc(id).delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  static Future<List<Producto>> consultarGral() async {
    List<Producto> lista = [];
    await _db.collection("Productos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Producto.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
