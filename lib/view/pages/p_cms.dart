import 'package:flutter/material.dart';

import '../../custom/CustomDrawer.dart';
import '../../custom/customAppBar.dart';

class PCms extends StatefulWidget {
  const PCms({super.key});

  @override
  State<PCms> createState() => _PCmsState();
}

class _PCmsState extends State<PCms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: 'List Rooms'),
      body: Column(
        children: [],
      ),
    );
  }
}