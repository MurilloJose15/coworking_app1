import 'package:flutter/material.dart';

import '../../../control/func_firebase.dart';
import '../../../custom/CustomButtom.dart';
import '../../../custom/CustomText.dart';
import '../../../utils/colors.dart';

class RedefinirSenhaUser extends StatefulWidget {
  const RedefinirSenhaUser({super.key});

  @override
  State<RedefinirSenhaUser> createState() => _RedefinirSenhaUserState();
}

class _RedefinirSenhaUserState extends State<RedefinirSenhaUser> {
  final _formkey = GlobalKey<FormState>();
  bool _formValido = false;
  TextEditingController _emailvalido = TextEditingController();

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return 'Campo preenchido';
    }
  }

  @override
  Widget build(BuildContext context) {
    RedefinirSenha redefinirSenha = RedefinirSenha(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: ColorsCoworking.iconpageColor,
                    ),
                  ),
                  CustomText(
                    texto: 'Redefinr a senha',
                    cor: ColorsCoworking.textpageColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailvalido,
              decoration: InputDecoration(
                errorStyle:
                TextStyle(color: _formValido ? Colors.blue : Colors.red),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: _formValido ? Colors.blue : Colors.red)),
                labelText: "Email para redefinir a senha",
              ),
              onChanged: (value) {
                setState(() {
                  _formValido = value.isNotEmpty;
                });
              },
              validator: _validarEntrada,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtom(
              textobuttom: 'Enviar',
              corbuttom: ColorsCoworking.buttompageColor,
              funcao: () {
                redefinirSenha.redefinirsenha(
                  _emailvalido.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
