import 'package:albab/Constants/constants.dart';
import 'package:albab/components/school_list.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolSearchScreen extends StatelessWidget {
  String schoolName;

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SchoolSearchProvider>(context);
    final mealSearchProvider = Provider.of<MealSearchProvider>(context);
    final selectProvider = Provider.of<SchoolSelectProvider>(context);

    return Builder(
      builder: (context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '학교 검색',
                  textAlign: TextAlign.center,
                  style: kNaNumExtraBold.copyWith(fontSize: 28, color: kBlue),
                ),
                TextField(
                  controller: searchProvider.textController,
                  // autofocus: true,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "학교를 검색하여주세요.",
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchProvider.schoolSearch();
                      },
                      icon: Icon(Icons.search, color: kBlue),
                    ),
                  ),
                  onChanged: (newText) {
                    schoolName = newText;
                  },
                ),
                Container(
                  height: getProportionateScreenHeight(200),
                  child: Consumer<SchoolSearchProvider>(
                    builder: (ctx, cr, _) {
                      if (cr.status == SearchStatus.end_searching) {
                        return SchoolList();
                      } else if (cr.status == SearchStatus.searching) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                FlatButton(
                  color: kBlue,
                  child: Text('학교 선택',
                      style: kNaNumLight.copyWith(
                          color: Colors.white, fontSize: 16)),
                  onPressed: () {
                    if (selectProvider.schoolDataModel.school_id == "") {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          content: Text(
                            "학교가 선택되지 않았습니다.",
                            style: kNaNumRegular.copyWith(fontSize: 16),
                          ),
                          actions: [
                            new FlatButton(
                              child: new Text(
                                "확인",
                                style: kNaNumExtraBold.copyWith(color: kBlue),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      mealSearchProvider.mealSearch(
                          selectProvider.schoolDataModel.school_id,
                          selectProvider.schoolDataModel.office_code);
                      searchProvider.searchModel.data.clear();
                      searchProvider.textController.clear();
                      Navigator.pop(context, false);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
