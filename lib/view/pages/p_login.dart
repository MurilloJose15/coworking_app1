import 'package:flutter/material.dart';
import 'p_aux/loginP.dart';

class PLogin extends StatefulWidget {
  const PLogin({super.key});

  @override
  State<PLogin> createState() => _PLoginState();
}

class _PLoginState extends State<PLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TelaLogin(),
    );
  }
}
