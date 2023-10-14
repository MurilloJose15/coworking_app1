import 'package:coworking_app/control/con_sala.dart';
import 'package:coworking_app/custom/CustomDrawer.dart';
import 'package:coworking_app/custom/customAppBar.dart';
import 'package:flutter/material.dart';
import 'p_aux/salasP.dart';

class PSalas extends StatefulWidget {
  @override
  _PSalasState createState() => _PSalasState();
}

class _PSalasState extends State<PSalas> {
  List<Map<String, dynamic>> salasCadastradas = [];

  @override
  void initState() {
    super.initState();
    listarSalas();
  }

  Future<void> listarSalas() async {
    final salas = await CtrlSala().listarSalas(); // Suponha que esta função liste as salas no Firebase
    if (salas != null) {
      setState(() {
        salasCadastradas = salas;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lista de Salas',
      ),
      body: ListView.builder(
        itemCount: salasCadastradas.length,
        itemBuilder: (context, index) {
          final sala = salasCadastradas[index];
          return Card(
            child: ListTile(
              title: Text(sala['nome_sala'] ?? ''),
              subtitle: Text('Capacidade: ${sala['capacidade'] ?? ''}'),
              trailing: Wrap(
                spacing: 4, // Espaçamento entre os equipamentos
                children: sala['equipamento'] is List
                ? (sala['equipamento'] as List).map((equipamento) {
                return Chip(
                  label: Text(equipamento, style: TextStyle(fontSize: 10.0),),
                  // Personalize a aparência dos chips conforme necessário
                );
              }).toList(): [],
              ),
            ),
          );
        },
      ),
    );
  }
}
