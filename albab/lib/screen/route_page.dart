import 'package:albab/Constants/constants.dart';
import 'package:albab/components/convex_bar.dart';
import 'package:albab/providers/screenChange.dart';
import 'package:albab/screen/bug/bug_body.dart';
import 'package:albab/screen/meals/meals_body.dart';
import 'package:albab/screen/schoolsearch/search_body.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:provider/provider.dart';

class BottomNavPage extends StatefulWidget{
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final _pageOptions = [ MealsBody(), SearchBody(), BugBody()];

  final pageController = PageController(initialPage: 1);

  void _onTap(int index){
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index){
    Provider.of<ScreenChange>(context, listen: false).setPage(index);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _pageOptions,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ConvexBar(onTap: _onTap,)
    );
  }
}
