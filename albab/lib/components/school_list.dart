import 'package:albab/Constants/constants.dart';
import 'package:albab/model/search_model.dart';
import 'package:albab/providers/school_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchprovider = Provider.of<SchoolSearchProvider>(context);
    final selectprovider = Provider.of<SchoolSelectProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchprovider.searchModel.data.length,
      itemBuilder: (context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10)),
          child: InkWell(
            onTap: () =>
                selectprovider.selectSchool(searchprovider.searchModel.data[index]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                      horizontal: getProportionateScreenWidth(10)),
                  child: Icon(
                    Icons.school,
                    color: kBlue,
                  ),
                ),
                Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(1),
                    color: kBlue),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Text(
                        searchprovider.searchModel.data[index].school_name,
                        style: kNaNumRegular,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5),
                          horizontal: getProportionateScreenWidth(10)),
                      child: Text(
                        searchprovider.searchModel.data[index].school_locate,
                        style: kNaNumLight,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
