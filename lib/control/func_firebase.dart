import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_app/model/mod_firebase.dart';


class UserController extends GetxController {
  Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
}

class LogarBaseFirebase {
  final BuildContext context;
  LogarBaseFirebase(this.context);
  Future<void> logarBase(String email, String senha) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      Get.toNamed('/home');
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class FirestoreService {
  static Future<void> salvarInformacoesUsuario(
      FirebaseFirestore firestore, String userId, String email) async {
    try {
      await firestore.collection('usuarios').doc().set({
        'user_id':userId,
        'email': email,
        'admin': false,
      });
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class CadastrarUsuario {
  final BuildContext context;
  CadastrarUsuario(this.context);
  Future<void> cadastraruser(String email, String senha) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      final User? user = userCredential.user;
      if (user != null) {
        Get.toNamed('/log_user');
        await FirestoreService.salvarInformacoesUsuario(
            FirebaseFirestore.instance, user.uid, email);
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}


class DeslogarFirebase {
  Future<void> deslogar() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.toNamed('/log_user');
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class RedefinirSenha {
  final BuildContext context;
  RedefinirSenha(this.context);
  Future<void> redefinirsenha(String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email);
      Get.toNamed('/log_user');
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class ListarSalas {
  Future<List<Map<String, dynamic>>> listarsalas() async {
    final base = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await base.collection('rooms').get();

    List<Map<String, dynamic>> salas = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> salaData = doc.data() as Map<String, dynamic>;
      salaData['id'] = doc.id;
      salas.add(salaData);
    });
    return salas;
  }
}

class ListarUsuarios {
  Future<List<Usuario>> listarUsuarios() async {
    final base = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await base.collection('usuarios').get();
    List<Usuario> users = [];
    querySnapshot.docs.forEach((doc) {
      users.add(Usuario.fromDocument(doc));
    });
    return users;
  }
}