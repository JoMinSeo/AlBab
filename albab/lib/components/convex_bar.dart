import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBar extends StatelessWidget {
  Function onTap;

  ConvexBar({this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: 1,
      style: TabStyle.reactCircle,
      backgroundColor: kPurple,
      color: Colors.white,
      height: getProportionateScreenHeight(60),
      items: [
        TabItem(icon: Icons.home, title: '홈'),
        TabItem(icon: Icons.search, title: '학교 검색'),
        TabItem(icon: Icons.report, title: '신고'),
      ],
      onTap: (index) => onTap(index),
    );
  }
}
