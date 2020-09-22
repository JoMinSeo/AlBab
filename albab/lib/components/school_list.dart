import 'package:albab/model/search_model.dart';
import 'package:albab/providers/school_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
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
        return GestureDetector(
          onTap: () => selectprovider.setData(searchprovider.searchModel.data, index),
          child: ListTile(
            title: Text(searchprovider.searchModel.data[index].school_name),
          ),
        );
      },
    );
  }
}
