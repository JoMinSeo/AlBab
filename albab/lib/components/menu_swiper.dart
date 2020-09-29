import 'package:albab/Constants/constants.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/swiper_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class MenuSwiper extends StatelessWidget {
  List<String> menu;

  void splitMenu(String menuString) {
    menu = menuString.split('<br/>');
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealSearchProvider>(context);
    final swiper = Provider.of<SwiperProvider>(context, listen: false);
    final titles = ["아침", "점심", "저녁"];
    final List<IconData> iconData = [
      Icons.wb_sunny,
      Icons.wb_cloudy,
      Icons.lightbulb_outline
    ];

    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(300),
      child: Consumer<MealSearchProvider>(
        builder: (ctx, item, _) {
          final meals = item.mealModel;
          if (item.status == MealStatus.food_searching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (item.status == MealStatus.error_food_searching) {
            return Text("No Data Found");
          }
          return Swiper(
            viewportFraction: 0.6,
            scale: 0.8,
            index: swiper.index,
            onIndexChanged: (index) {
              swiper.index = index;
            },
            loop: false,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: kBlue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x10000000),
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(
                        titles[index],
                        style: kNaNumRegular.copyWith(
                            color: Colors.white, fontSize: 24),
                      ),
                      Container(
                        child: Builder(
                          builder: (_) {
                            if (meals.data.meal_menu[index] == "null") {
                              return Container(
                                height: getProportionateScreenHeight(200),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "급식이  없습니다.",
                                    textAlign: TextAlign.center,
                                    style: kNaNumBold.copyWith(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              );
                            }
                            if (meals.data.meal_menu[index] == null) {
                              return Container(
                                height: getProportionateScreenHeight(200),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "급식이  없습니다.",
                                    style: kNaNumBold.copyWith(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              );
                            }
                            splitMenu(meals.data.meal_menu[index]);
                            return Padding(
                              padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(20),
                              ),
                              child: SizedBox(
                                height: getProportionateScreenHeight(200),
                                child: ListView.builder(
                                  itemBuilder: (_, index) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: getProportionateScreenHeight(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        menu[index],
                                        style: kNaNumBold.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  itemCount: menu.length,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
