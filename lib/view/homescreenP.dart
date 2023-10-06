import 'package:coworking_app/custom/CustomText.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HomeScreenP extends StatelessWidget {
  const HomeScreenP({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/6712/6712159.png',width: 200,height: 200,),
        ),
        SizedBox(
          height: 20,
        ),
        CustomText(
          texto: 'Working in Progress',
          cor: ColorsCoworking.texthomeColor,
        )
      ],
    );
  }
}