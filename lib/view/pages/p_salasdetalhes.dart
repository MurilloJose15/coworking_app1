import 'package:coworking_app/custom/CustomDrawer.dart';
import 'package:coworking_app/custom/customAppBar.dart';
import 'package:coworking_app/view/pages/p_aux/salasdetalhesP.dart';
import 'package:flutter/material.dart';

import '../../control/func_firebase.dart';

class PSalasDetalhes extends StatefulWidget {
  final String idsala;
  const PSalasDetalhes({required this.idsala});

  @override
  State<PSalasDetalhes> createState() => _PSalasDetalhesState();
}

class _PSalasDetalhesState extends State<PSalasDetalhes> {
  final ListarSalas listarSalas = ListarSalas();
  List<Map<String, dynamic>> salas = [];

  @override
  void initState() {
    super.initState();
    _carregarSalas();
  }

  Future<void> _carregarSalas() async {
    final salasData = await listarSalas.listarsalas();
    setState(() {
      salas = salasData;
      if (widget.idsala.isNotEmpty) {
        salas.retainWhere((sala) => sala['id'] == widget.idsala);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${salas[0]['nome_sala']}'),
      drawer: CustomDrawer(),
      body: SalasDetalhes(salad: salas),
    );
  }
}