import 'package:albab/Constants/constants.dart';
import 'package:albab/services/network/search_data.dart';
import 'package:flutter/material.dart';

class SchoolSearchScreen extends StatelessWidget {
  String schoolName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('학교 검색',
                textAlign: TextAlign.center,
                style: kNaNumExtraBold.copyWith(fontSize: 28, color: kBlue)),
            TextField(
              autofocus: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "학교를 검색하여주세요.",
                suffixIcon: IconButton(
                  onPressed: () => searchData(schoolName),
                  icon: Icon(Icons.search, color: kBlue),
                ),
              ),
              onChanged: (newText) {
                schoolName = newText;
              },
            ),
            FlatButton(
              color: kBlue,
              child: Text('학교 선택',
                  style:
                      kNaNumLight.copyWith(color: Colors.white, fontSize: 16)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
