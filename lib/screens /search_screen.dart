import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookingapp/utils/app_layout.dart';

import '../utils/app_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Gap(Applayout.getHeight(40)),
          Text('What are\nyou looking for?',style: Styles.headLineStyle1.copyWith(fontSize: 35),)
        ],
      ),
    );
  }
}
