import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BugReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Lottie.asset('assets/images/bug.json', fit: BoxFit.cover),
            ),
            Text(
              '버그를 제보하여주세요.',
              style: kNaNumBold.copyWith(fontSize: 24),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(52)),
                child: Text(
                  "minseocho0309@gmail.com\n으로 버그를 보내주세요!",
                  textAlign: TextAlign.center,
                  style: kNaNumBold.copyWith(fontSize: 24),
                ))
          ],
        ));
  }
}
