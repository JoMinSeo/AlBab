import 'package:albab/Constants/constants.dart';
import 'package:albab/providers/screenChange.dart';
import 'package:albab/screen/bug/bug_page.dart';
import 'package:albab/screen/meals/meals_body.dart';
import 'package:albab/screen/schoolsearch/search_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatelessWidget {
  final _pageOptions = [SearchPage(), MealsBody(), BugPage()];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _pageOptions[Provider.of<ScreenChange>(context).selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: kPurple,
        color: Colors.white,
        height: getProportionateScreenHeight(60),
        initialActiveIndex: 1,
        items: [
          TabItem(icon: Icons.search, title: '학교 검색'),
          TabItem(icon: Icons.home, title: '홈'),
          TabItem(icon: Icons.report, title: '신고'),
        ],
        onTap: (int index) {
          Provider.of<ScreenChange>(context, listen: false).setPage(index);
          print(_pageOptions[
              Provider.of<ScreenChange>(context, listen: false).selectedPage]);
        },
      ),
    );
  }
}
