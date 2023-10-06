import 'package:flutter/material.dart';

class SalasDetalhes extends StatefulWidget {
  final List<Map<String, dynamic>> salad;
  const SalasDetalhes({required this.salad});

  @override
  State<SalasDetalhes> createState() => _SalasDetalhesState();
}

class _SalasDetalhesState extends State<SalasDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${widget.salad[0]['nome_sala']}'),
      ],
    );
  }
}