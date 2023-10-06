import 'package:flutter/material.dart';
import 'p_aux/caduserP.dart';

class PCadU extends StatefulWidget {
  const PCadU({super.key});

  @override
  State<PCadU> createState() => _PCadUState();
}

class _PCadUState extends State<PCadU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CadastroUser(),
    );
  }
}
