import 'package:coworking_app/view/pages/p_cadsala.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_app/utils/colors.dart';
import 'package:coworking_app/control/func_firebase.dart';

import 'CustomText.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  DeslogarFirebase deslogarBaseFirebase = DeslogarFirebase();
  final UserController _userController = Get.put(UserController());
  bool isAdmin = false;


  @override
  void initState() {
    super.initState();
    isUserAdmin().then((result) {
      setState(() {
        isAdmin = result;
      });
    });
  }

  Future<bool> isUserAdmin() async {
    final currentUser = _userController.user;
    if (currentUser != null) {
      final usuarios = await ListarUsuarios().listarUsuarios();
      final isAdmin = usuarios.any((usuario) => usuario.email == currentUser.email && usuario.admin);
      return isAdmin;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsCoworking.drawerColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_userController.user?.displayName ?? ''),
            accountEmail: Text(_userController.user?.email ?? 'No user logged in'),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userController.user?.email?.isNotEmpty == true
                      ? _userController.user!.email![0].toUpperCase()
                      : '/',
                  style: TextStyle(fontSize: 40.0),
                )),
          ),
          Card(
            color: ColorsCoworking.buttomdrawerColor,
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: ColorsCoworking.icondrawerColor,
              ),
              title: CustomText(
                texto: 'Home',
                cor: ColorsCoworking.textdrawerColor,
              ),
              onTap: () {
                Get.toNamed('/');
              },
            ),
          ),
          Card(
            color: ColorsCoworking.buttomdrawerColor,
            child: ListTile(
              leading: Icon(
                Icons.person_3,
                color: ColorsCoworking.icondrawerColor,
              ),
              title: CustomText(
                texto: 'Cadastro de usuário',
                cor: ColorsCoworking.textdrawerColor,
              ),
              onTap: () {
                Get.toNamed('/cad_user');
              },
            ),
          ),
          Card(
            color: ColorsCoworking.buttomdrawerColor,
            child: ListTile(
              leading: Icon(
                Icons.room,
                color: ColorsCoworking.icondrawerColor,
              ),
              title: CustomText(
                texto: 'Salas',
                cor: ColorsCoworking.textdrawerColor,
              ),
              onTap: () {
                Get.toNamed('/salas');
              },
            ),
          ),
          Card(
            color: ColorsCoworking.buttomdrawerColor,
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: ColorsCoworking.icondrawerColor,
              ),
              title: CustomText(
                texto: 'Sair',
                cor: ColorsCoworking.textdrawerColor,
              ),
              onTap: () {
                deslogarBaseFirebase.deslogar();
              },
            ),
          ),
          if  (isAdmin)
            Card(
              color: ColorsCoworking.buttomdrawerColor,
              child: ListTile(
                leading: Icon(
                  Icons.add_location,
                  color: ColorsCoworking.icondrawerColor,
                ),
                title: CustomText(
                  texto: 'Cadastro de sala',
                  cor: ColorsCoworking.textdrawerColor,
                ),
                onTap: () {
                  Get.toNamed('/cadsala');
                },
              ),
            ),
        ],
      ),
    );
  }
}