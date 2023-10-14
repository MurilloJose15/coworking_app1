import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_app/control/con_sala.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom/CustomButtom.dart';
import '../../custom/CustomDrawer.dart';
import '../../custom/CustomText.dart';
import '../../custom/customAppBar.dart';
import '../../model/mod_sala.dart';
import '../../utils/colors.dart';


class CadSala extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _formValido = false;
  final TextEditingController _nome_sala = TextEditingController();
  final TextEditingController _capacidade = TextEditingController();
  final TextEditingController _observacoes = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _tamanho = TextEditingController();
  final RxList<String> _equipamentos = RxList<String>();

  final CtrlSala ctrlSala = Get.put(CtrlSala());

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return 'Campo preenchido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'COWORKING APP',
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.add_location,
                          color: ColorsCoworking.iconpageColor,
                        ),
                      ),
                      CustomText(
                        texto: 'Área Cadastro de sala',
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
                  controller: _nome_sala,
                  decoration: InputDecoration(
                    errorStyle:
                    TextStyle(color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red)),
                    labelText: "Nome da Sala",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira o nome da sala.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _capacidade,
                  decoration: InputDecoration(
                    errorStyle:
                    TextStyle(color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValido ? Colors.blue : Colors.red),
                    ),
                    labelText: "Capacidade",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira o nome da sala.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Equipamentos:'),
                SizedBox(height: 10,),
                _buildChips(),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _observacoes,
                  decoration: InputDecoration(
                    errorStyle:
                    TextStyle(color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValido ? Colors.blue : Colors.red),
                    ),
                    labelText: "Observações",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira o nome da sala.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _preco,
                  decoration: InputDecoration(
                    errorStyle:
                    TextStyle(color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValido ? Colors.blue : Colors.red),
                    ),
                    labelText: "Preço",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira o nome da sala.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _tamanho,
                  decoration: InputDecoration(
                    errorStyle:
                    TextStyle(color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValido ? Colors.blue : Colors.red),
                    ),
                    labelText: "Tamanho",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira o nome da sala.';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButtom(
                  textobuttom: 'Cadastrar',
                  corbuttom: ColorsCoworking.buttompageColor,
                  funcao: _saveSala,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildChips() {
    return Obx(() {
      return Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: ctrlSala.Equipamentos.map((equipamento) {
          return _buildFilterChip(equipamento);
        }).toList(),
      );
    });
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      selected: _equipamentos.contains(label),
      onSelected: (isSelected) {
        if (isSelected) {
          _equipamentos.add(label);
        } else {
          _equipamentos.remove(label);
        }
      },
    );
  }

  void _saveSala() async {
    if (_formkey.currentState!.validate()) {
      Sala novaSala = Sala(
        id: FirebaseFirestore.instance
            .collection('salas')
            .doc()
            .id,
        nome_sala: _nome_sala.text,
        capacidade: int.parse(_capacidade.text),
        equipamentos: _equipamentos,
        observacoes: _observacoes.text,
        preco: double.parse(_preco.text),
        tamanho: int.parse(_tamanho.text),
      );
      await ctrlSala.cadSala(novaSala);
    }
  }
}

