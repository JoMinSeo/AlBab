import 'package:albab/Constants/constants.dart';
import 'package:albab/components/menu_swiper.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealsBody extends StatefulWidget {
  @override
  _MealsBodyState createState() => _MealsBodyState();
}

class _MealsBodyState extends State<MealsBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final selectProvider = Provider.of<SchoolSelectProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
              child: Text(
                "ALBAB",
                style: kNaNumRegular.copyWith(fontSize: 42),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(36),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(16)),
            child: Center(
              child: Text(
                selectProvider.schoolDataModel.school_name == ""
                    ? "학교가 검색되지 않았네요"
                    : selectProvider.schoolDataModel.school_name,
                style: kNaNumRegular.copyWith(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: getProportionateScreenWidth(16)),
            child: Center(
              child: Text(
                "메뉴",
                style: kNaNumRegular.copyWith(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: kRed,
            height: getProportionateScreenHeight(300),
            child: MenuSwiper(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
