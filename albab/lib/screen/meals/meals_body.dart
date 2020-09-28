import 'package:albab/Constants/constants.dart';
import 'package:albab/components/menu_swiper.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_search_provider.dart';
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
    return Column(
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
          height: getProportionateScreenHeight(50),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
          child: Center(
            child: Text(
              "메뉴",
              style: kNaNumRegular.copyWith(fontSize: 24),
            ),
          ),
        ),
        Container(
          height: getProportionateScreenHeight(270),
          child: Consumer<MealSearchProvider>(
            builder: (ctx, cr, _) {
              if (cr.status == MealStatus.complete) {
                return MenuList();
              } else if(cr.status == MealStatus.loading){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                return Container(
                  child: Center(
                    child: Text("아직 학교가 검색되지 않았네요.", style: kNaNumRegular.copyWith(fontSize: 24),),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
