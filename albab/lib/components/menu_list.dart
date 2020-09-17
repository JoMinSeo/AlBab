import 'package:albab/components/menu_tile.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: getProportionateScreenWidth(5),
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return MenuTile(
          icon: iconSelect(index),
          title: titleSelect(index),
        );
      },
      itemCount: 3,
    );
  }
}

IconData iconSelect(int index){
  if(index == 0){
    return Icons.wb_sunny;
  }else if(index == 1){
    return Icons.wb_cloudy;
  }else if(index == 2){
    return Icons.lightbulb_outline;
  }
}

String titleSelect(int index){
  if(index == 0){
    return "아침";
  }else if(index == 1){
    return "점심";
  }else if(index == 2){
    return "저녁";
  }
}
