import 'package:flutter/material.dart';

import '../../../control/func_firebase.dart';
import '../../../custom/CustomButtom.dart';
import '../../../custom/CustomText.dart';
import '../../../utils/colors.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final _formkey = GlobalKey<FormState>();
  bool _formValido = false;
  TextEditingController _emailvalido = TextEditingController();
  TextEditingController _senhavalida = TextEditingController();

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return 'Campo preenchido';
    }
  }

  @override
  Widget build(BuildContext context) {
    CadastrarUsuario cadastrarUsuario = CadastrarUsuario(context);
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
                    texto: 'Área Cadastro de usuário',
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
                labelText: "Email (example@gmail.com)",
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _senhavalida,
              obscureText: true,
              decoration: InputDecoration(
                errorStyle:
                TextStyle(color: _formValido ? Colors.blue : Colors.red),
                errorBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: _formValido ? Colors.blue : Colors.red),
                ),
                labelText: "Password",
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
            CustomButtom(
              textobuttom: 'Cadastrar',
              corbuttom: ColorsCoworking.buttompageColor,
              funcao: () {
                cadastrarUsuario.cadastraruser(
                  _emailvalido.text,
                  _senhavalida.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}