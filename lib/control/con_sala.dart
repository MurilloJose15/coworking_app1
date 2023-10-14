import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_app/model/mod_sala.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CtrlSala extends GetxController {
  var salas = <Sala>[].obs;
  var isLoading = true.obs;

  List<String> get Equipamentos => [
        "Televisão",
        "Projetor",
        "Lousa",
        "Cine Sala",
        "Ar-condicionado",
      ];


  Future<List<Map<String, dynamic>>?> listarSalas() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('salas').get();

      return querySnapshot.docs
          .map((doc) => doc.data())
          .toList(); // Retorna uma lista de Mapas (um mapa por sala)
    } catch (e) {
      print('Erro ao listar salas: $e');
      return null;
    }
  }


  Future<void> cadSala(Sala sala) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('salas')
          .doc(sala.id)
          .set(sala.toMap());
    } catch (e) {
      print('Erro: $e');
    } finally {
      isLoading(false);
      Get.back();
    }
  }

  Future<void> saveSala({
    required String nome_sala,
    required String capacidade,
    required List<String> equipamentos,
    required String observacoes,
    required String preco,
    required String tamanho,
  }) async {
    if (nome_sala.isNotEmpty && capacidade.isNotEmpty && observacoes.isNotEmpty && preco.isNotEmpty && tamanho.isNotEmpty) {
      Sala novaSala = Sala(
          id: FirebaseFirestore.instance.collection('salas').doc().id,
          nome_sala: nome_sala,
          capacidade: int.parse(capacidade),
          equipamentos: equipamentos,
          observacoes: observacoes,
          preco: double.parse(preco),
          tamanho: int.parse(tamanho),
      );
      await cadSala(novaSala);
      Get.back();
    } else {
      if (kDebugMode) {
        print("Informações inválidas");
      }
    }
  }
}
