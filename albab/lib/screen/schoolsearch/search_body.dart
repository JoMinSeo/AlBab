import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody>
    with AutomaticKeepAliveClientMixin {
  FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "학교 검색",
              style:
                  kNaNumExtraBold.copyWith(fontSize: 25, color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            color: kPurple,
          ),
          height: SizeConfig.screenHeight * 0.2,
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
              Icons.fastfood,
              color: Colors.deepOrange,
            ),
            primary: false,
            title: TextField(
              style: kNaNumRegular,
              focusNode: myFocusNode,
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: kPurple),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
