import 'package:coworking_app/custom/CustomDrawer.dart';
import 'package:coworking_app/custom/customAppBar.dart';
import 'package:flutter/material.dart';
import 'p_aux/salasP.dart';

class PSalas extends StatefulWidget {
  const PSalas({super.key});

  @override
  State<PSalas> createState() => _PSalasState();
}

class _PSalasState extends State<PSalas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: 'List Rooms'),
      body: ListRooms(),
    );
  }
}