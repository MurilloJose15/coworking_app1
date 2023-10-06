import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String id;
  final bool admin;
  final String email;
  Usuario({required this.id, required this.admin, required this.email});
  factory Usuario.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Usuario(
      id: data['user_id'] ?? '',
      admin: data['admin'] ?? false,
      email: data['email'] ?? '',
    );
  }
}