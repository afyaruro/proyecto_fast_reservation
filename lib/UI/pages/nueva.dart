import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_fast_reservation/Data/Service/PeticionesMesas.dart';

class AdicionarArticulos extends StatefulWidget {
  const AdicionarArticulos({Key? key}) : super(key: key);

  @override
  State<AdicionarArticulos> createState() => _AdicionarArticulosState();
}

class _AdicionarArticulosState extends State<AdicionarArticulos> {
  var _image;
  ImagePicker picker = ImagePicker();
  TextEditingController controlIdMesa = TextEditingController();
  TextEditingController controlNombreMesa = TextEditingController();
  TextEditingController controlDescripcion = TextEditingController();

  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Articulos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  _opcioncamara(context);
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(48),
                          ),
                          width: 100,
                          height: 100,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            TextField(
              controller: controlIdMesa,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Ingrese el Id'),
            ),
            TextField(
              controller: controlNombreMesa,
              decoration: const InputDecoration(labelText: 'Ingrese el Nombre'),
            ),
            TextField(
              controller: controlDescripcion,
              decoration:
                  const InputDecoration(labelText: 'Ingrese la Descripcion'),
            ),
            ElevatedButton(
                onPressed: () {
                  var catalogo = <String, dynamic>{
                    ' idMesa': controlIdMesa.text,
                    'nombreMesa': controlNombreMesa.text,
                    'descripcionMesa': controlDescripcion.text,
                    'foto': ''
                  };

                  PeticionesMesa.crearMesa(catalogo, _image);
                },
                child: const Text("Guardar Mesa"))
          ],
        ),
      ),
    );
  }

//Seleccionar la camara o la galeria

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Imagen de Galeria'),
                    onTap: () {
                      _camGaleria(false);
                      Get.back();
                      // Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Capturar Imagen'),
                  onTap: () {
                    _camGaleria(true);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
