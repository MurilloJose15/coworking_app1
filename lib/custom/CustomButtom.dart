import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButtom extends StatelessWidget {
  final String textobuttom;
  final Color corbuttom;
  final VoidCallback? funcao;

  const CustomButtom({
    required this.textobuttom,
    this.corbuttom = Colors.red,
    this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcao,
      child: Text(
        textobuttom,
        style: TextStyle(
          color: ColorsCoworking.textbuttompageColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: corbuttom,
      ),
    );
  }
}