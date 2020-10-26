import 'package:albab/Constants/constants.dart';
import 'package:albab/screen/bug/bugreport_page.dart';
import 'package:albab/screen/schoolsearch/school_search.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FloatingMenu extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FloatingMenu({this.onPressed, this.tooltip, this.icon});

  @override
  _FloatingMenuState createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    //여기
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: kBlue,
      end: kRed,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget bug() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: kBlue,
        heroTag: "FAB1",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BugReportPage()));
        },
        tooltip: 'BUG',
        child: Icon(Icons.bug_report),
      ),
    );
  }

  Widget search() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: kBlue,
        heroTag: "FAB2",
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SchoolSearchScreen(),
              ),
            ),
          );
        },
        tooltip: 'SEARCH',
        child: Icon(Icons.search),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "FAB3",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: bug(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: search(),
        ),
        toggle(),
      ],
    );
  }
}
