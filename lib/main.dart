import 'package:flutter/material.dart';
import 'package:proyecto_fast_reservation/Controller/controlCliente.dart';
import 'package:proyecto_fast_reservation/Controller/controlCuenta.dart';
import 'package:proyecto_fast_reservation/Controller/controlMesero.dart';
import 'package:proyecto_fast_reservation/UI/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'Controller/ControlFirebaseMesas.dart';
import 'Controller/ControlProducto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAos6nyH6INMz8TA4bVF6Os586ZcbdcoHw",
              authDomain: "proyecto-fast-reservation.firebaseapp.com",
              projectId: "proyecto-fast-reservation",
              storageBucket: "proyecto-fast-reservation.appspot.com",
              messagingSenderId: "565223568929",
              appId: "1:565223568929:web:dc3a0d284472160cf59560"),
        )
      : await Firebase.initializeApp();

  Get.put(MesaController());
  Get.put(ProductoController());
  Get.put(ClienteController());
  Get.put(MeseroController());
  Get.put(CuentaController());

  runApp(const MyApp());
}
