import 'dart:core';

import 'package:albab/Constants/constants.dart';
import 'package:albab/components/calGraph.dart';
import 'package:albab/components/menu_swiper.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/providers/swiper_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MealsBody extends StatefulWidget {
  @override
  _MealsBodyState createState() => _MealsBodyState();
}

class _MealsBodyState extends State<MealsBody>
    with AutomaticKeepAliveClientMixin {
  final gifList = ['tennis.json', 'running.json', 'bowling.json'];
  final exerciseList = ['tennis', 'run', 'bowling'];
  int swiperIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider =
        Provider.of<MealSearchProvider>(context, listen: false);
    final selectProvider =
        Provider.of<SchoolSelectProvider>(context, listen: false);

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
              child: GestureDetector(
                onTap: () {
                  final now = DateTime.now();
                  DatePicker.showDatePicker(
                    context,
                    locale: LocaleType.ko,
                    onConfirm: (date) {
                      print(date);
                      mealProvider.time = date;
                      mealProvider.mealSearch(
                          selectProvider.schoolDataModel.school_id,
                          selectProvider.schoolDataModel.office_code);
                    },
                    currentTime: mealProvider.time,
                    minTime: DateTime(now.year, 1, 1),
                    maxTime: DateTime(now.year, now.month,
                        DateTime(now.year, now.month + 1, 0).day),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.calendar_today),
                ),
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
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getProportionateScreenHeight(300),
                    child: MenuSwiper(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(32),
                  ),
                  Container(
                    child: SizedBox(
                      width: getProportionateScreenWidth(200),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Consumer<MealSearchProvider>(
                          builder: (ctx, i, _) {
                            if (i.status == MealStatus.food_searching)
                              return CircularProgressIndicator();
                            if (i.status == MealStatus.error_food_searching)
                              return Center(
                                child: Text(
                                  "급식 정보가 없어요.",
                                  style: kNaNumRegular.copyWith(fontSize: 24),
                                ),
                              );
                            return Consumer<SwiperProvider>(
                              builder: (ctx, item, _) {
                                double value = 0;
                                final meal = i.mealModel.getFromIdx(item.index);
                                if (meal != "null" &&
                                    !i.mealModel.isEmpty(item.index)) {
                                  // if(i.mealModel.data.calories[item.index] == null){
                                  //   value = 0;
                                  // }
                                  // if(i.mealModel.data.calories[item.index] == "null"){
                                  //   value = 0;
                                  // }
                                  value = double.parse(i.mealModel
                                      .getFromIdx(item.index)
                                      .replaceAll(" Kcal", ""));
                                }
                                return AnimatedKcalGraph(
                                  key: UniqueKey(),
                                  value: value,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(36),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(500),
                    child: Swiper(
                      viewportFraction: 0.6,
                      scale: 0.8,
                      index: swiperIndex,
                      onIndexChanged: (index) {
                        setState(() {
                          print(index);
                          swiperIndex = index;
                        });
                      },
                      loop: false,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Lottie.asset(
                                'assets/images/${gifList[index]}',
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(12),
                            ),
                            Text(
                              exerciseList[index],
                              style: kNaNumExtraBold.copyWith(fontSize: 24),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(12),
                            ),
                            Text(
                              "이 운동은 이만큼의 칼로리를 소모합니다.",
                              style: kNaNumRegular.copyWith(fontSize: 20),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// value = double.parse(i.mealModel
//     .getFromIdx(item.index)
// .replaceAll(" Kcal", ""));
