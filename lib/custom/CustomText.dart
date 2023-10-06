import 'package:flutter/material.dart';
import 'package:coworking_app/utils/colors.dart';

class CustomText extends StatelessWidget {
  final String texto;
  final Color cor;

  const CustomText({required this.texto, this.cor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(color: cor), // Usar a cor passada como parâmetro
    );
  }
}