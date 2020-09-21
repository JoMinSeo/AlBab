import 'package:albab/Constants/constants.dart';
import 'package:flutter/material.dart';

class SchoolList extends StatelessWidget {
  AsyncSnapshot snapshot;

  SchoolList({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return snapshot.data.data.isEmpty
        ? Center(
            child: Text(
            "검색을 하여 주세요.",
            style: kNaNumLight.copyWith(color: kBlue, fontSize: 32),
          ))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(snapshot.data.data['school_name']),
              );
            },
          );
  }
}
