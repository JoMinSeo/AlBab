import 'package:albab/Constants/constants.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/swiper_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class MenuList extends StatelessWidget {
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
        return Consumer<MealSearchProvider>(
          builder: (ctx, item, _) {
            final meals = item.mealModel;
            if (item.status == MealStatus.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (item.status == MealStatus.uncomplete) {
              return Text("No Data Found");
            }
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
              height: getProportionateScreenHeight(180),
              width: getProportionateScreenWidth(130),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(iconData[index], color: Colors.white),
                        Text(
                          titles[index],
                          style: kNaNumRegular.copyWith(
                              color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                      ],
                    ),
                    Container(
                      child: Builder(
                        builder: (_) {
                          if (meals.data.meal_menu[index] == null) {
                            return Text("급식이 없습니다.",
                                style:
                                    kNaNumLight.copyWith(color: Colors.white));
                          } else if (meals.data.meal_menu[index] == "null") {
                            return Text(
                              "급식이 없습니다.",
                              style: kNaNumLight.copyWith(color: Colors.white),
                            );
                          }
                          return Text(meals.data.meal_menu[index],
                              style: kNaNumLight.copyWith(color: Colors.white));
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
    );
  }
}
