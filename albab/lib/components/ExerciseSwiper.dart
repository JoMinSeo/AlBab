import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';

class ExerciseSwiper extends StatefulWidget {
  @override
  _ExerciseSwiperState createState() => _ExerciseSwiperState();
}

class _ExerciseSwiperState extends State<ExerciseSwiper> {

  final gifList = [
    'tennis.json',
    'running.json',
    'bowling.json',
    'mountain.json',
    'yoga.json',
    'jumpRope.json'
  ];
  final exerciseList = ['테니스', '달리기', '볼링', '등산', '요가', '줄넘기'];
  final kcalList = [
    '411.0 Kcal',
    '470.0 Kcal',
    '352.0 Kcal',
    '538.0 Kcal',
    '168.0 Kcal',
    '672.0 Kcal'
  ];
  int swiperIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(300),
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
        itemCount: gifList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: kGrey,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                        spreadRadius: 5.0)
                  ],
                ),
                child: ClipOval(
                  child: Lottie.asset(
                    'assets/images/${gifList[index]}',
                    height: getProportionateScreenHeight(200),
                  ),
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
                "이 운동은 ${kcalList[index]}를 소모합니다.",
                style: kNaNumRegular.copyWith(fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}
