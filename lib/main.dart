import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'view/homeScreen.dart';
import 'view/pages/p_login.dart';
import 'view/pages/p_caduser.dart';
import 'view/pages/p_resetpw.dart';
import 'view/pages/p_salas.dart';
import 'view/pages/p_cadsala.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/log_user',
    getPages: [
      GetPage(name: '/log_user', page: () => PLogin()),
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/cad_user', page: () => PCadU()),
      GetPage(name: '/reset_pw', page: () => PResetPW()),
      GetPage(name: '/reset_pw', page: () => PSalas()),
      GetPage(name: '/salas', page: () => PSalas()),
      GetPage(name: '/cadsala', page: () => CadSala()),
    ],
  ));
}