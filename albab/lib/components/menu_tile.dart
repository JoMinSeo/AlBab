import 'package:albab/Constants/constants.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuTile({Key key, @required this.icon, @required this.title})
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
                          color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                  ],
                )
              ],
            ),
          )),
      color: kBlue,
    );
  }
}
