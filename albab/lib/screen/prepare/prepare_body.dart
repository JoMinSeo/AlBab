import 'package:albab/Constants/constants.dart';
import 'file:///C:/Users/minse/github/AlBab/albab/lib/screen/meals/meals_page.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class PrepareBody extends StatefulWidget {
  @override
  _PrepareBodyState createState() => _PrepareBodyState();
}

class _PrepareBodyState extends State<PrepareBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(30),
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                height: getProportionateScreenHeight(300),
                image: AssetImage('assets/images/mainimage.png'),
              ),
            ),
            Text(
              '시작할 준비가 되셨나요?',
              style: kNaNumExtraBold.copyWith(fontSize: 24),
            ),
            Text(
              '당신의 급식을 간편하게 한눈에 만나보세요.',
              style: kNaNumLight.copyWith(fontSize: 16),
            ),
            ButtonTheme(
              minWidth: SizeConfig.screenWidth,
              height: getProportionateScreenHeight(60),
              buttonColor: kBlue,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
              child: InkWell(
                child: RaisedButton(
                  child: Text('시작', style: kNaNumBold.copyWith(fontSize: 24,color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealsPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // return DecoratedBox(  //백그라운드 이미지 처리
  // decoration: BoxDecoration(
  // image: DecorationImage(
  // image: AssetImage("assets/images/plants_back.png"),
  // fit: BoxFit.cover
  // )
  // ),
}
