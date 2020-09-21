import 'package:albab/Constants/constants.dart';
import 'package:albab/components/school_list.dart';
import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/search_data.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class SchoolSearchScreen extends StatefulWidget {
  @override
  _SchoolSearchScreenState createState() => _SchoolSearchScreenState();
}

class _SchoolSearchScreenState extends State<SchoolSearchScreen> {
  Future<SearchModel> searchModel;
  String schoolName;

  @override
  void initState() {
    super.initState();
    searchModel = searchData(schoolName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        height: getProportionateScreenHeight(400),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: FutureBuilder<SearchModel>(
          future: searchModel,
          builder: (context, AsyncSnapshot snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('학교 검색',
                    textAlign: TextAlign.center,
                    style:
                        kNaNumExtraBold.copyWith(fontSize: 28, color: kBlue)),
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
                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                  height: getProportionateScreenHeight(200),
            child: SchoolList(),
            );
                }else{
                  return CircularProgressIndicator(),
            },
                FlatButton(
                  color: kBlue,
                  child: Text('학교 선택',
                      style: kNaNumLight.copyWith(
                          color: Colors.white, fontSize: 16)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
