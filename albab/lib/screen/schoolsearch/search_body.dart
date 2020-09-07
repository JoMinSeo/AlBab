import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // Background
          child: Center(
              child: Text("Home",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
          color: kImproveGrey, height: SizeConfig.screenHeight*0.2,
          width: SizeConfig.screenWidth,
        ),
        Container(), // Required some widget in between to float AppBar
        Positioned(
          // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.menu,
              color: kGrey,
            ),
            primary: false,
            title: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: kImproveGrey),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
