import 'package:albab/screen/prepare/prepare_body.dart';

import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';

class PreparePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(child: PrepareBody()),
    );
  }
}
