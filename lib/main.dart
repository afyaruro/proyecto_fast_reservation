import 'package:flutter/material.dart';
import 'package:proyecto_fast_reservation/UI/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'Controller/ControlFirebaseMesas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MesaController());

  runApp(const MyApp());
}
