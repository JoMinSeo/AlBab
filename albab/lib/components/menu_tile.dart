import 'package:albab/Constants/constants.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;

  const MenuTile(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: getProportionateScreenHeight(180),
        width: getProportionateScreenWidth(130),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: Colors.white),
                  Text(
                    title,
                    style: kNaNumRegular.copyWith(
                        color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      color: kBlue,
    );
  }
}
