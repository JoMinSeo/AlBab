import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class BugBody extends StatefulWidget {
  @override
  _BugBodyState createState() => _BugBodyState();
}

class _BugBodyState extends State<BugBody> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Center(
        child: Text(
          'BUG',
          style: kNaNumRegular.copyWith(fontSize: 42),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
