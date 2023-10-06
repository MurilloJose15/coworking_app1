import 'package:flutter/material.dart';

import '../custom/CustomDrawer.dart';
import '../custom/CustomText.dart';
import '../custom/customAppBar.dart';
import 'homescreenP.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'COWORKING APP',
      ),
      drawer: CustomDrawer(),
      body: HomeScreenP(),
    );
  }
}