import 'package:coworking_app/view/pages/p_aux/resetpwP.dart';
import 'package:flutter/material.dart';


class PResetPW extends StatefulWidget {
  const PResetPW({super.key});

  @override
  State<PResetPW> createState() => _PResetPWState();
}

class _PResetPWState extends State<PResetPW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RedefinirSenhaUser(),
    );
  }
}
