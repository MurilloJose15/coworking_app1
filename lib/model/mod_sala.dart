import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Sala {
  String id;
  String nome_sala;
  int capacidade;
  List<String> equipamentos;
  String observacoes;
  double preco;
  int tamanho;
  bool isReserved;
  final String? userId;

  Sala(
      {required this.id,
      required this.nome_sala,
      required this.capacidade,
      required this.equipamentos,
      required this.observacoes,
      required this.preco,
      required this.tamanho,
      this.isReserved = false,
      this.userId,
      });

  factory Sala.saveFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Sala(id: doc.id,
                nome_sala: data['nome_sala'],
                capacidade: data['capacidade'],
                equipamentos: List<String>.from(data['equipamentos'] ?? []),
                observacoes: data['observacoes'],
                preco: data['preco'],
                tamanho: data['tamanho'],
                isReserved: data['isReserved'] ?? false,
                userId: data['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome_sala': nome_sala,
      'capacidade': capacidade,
      'equipamento': equipamentos,
      'observacoes': observacoes,
      'preco': preco,
      'tamanho': tamanho,
      'isReserved': isReserved,
    };
  }

  Sala copyWith({
    bool? isReserved,
    String? userId,
  }) {
    return Sala(id: id,
                nome_sala: nome_sala,
                capacidade: capacidade,
                equipamentos: equipamentos,
                observacoes: observacoes,
                preco: preco,
                tamanho: tamanho,
                isReserved: isReserved ?? this.isReserved,
                userId: userId ?? this.userId,
    );
  }
}
