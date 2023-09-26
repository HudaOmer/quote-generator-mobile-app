import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class MyIcon extends StatelessWidget {
  IconData theIcon;
  MyIcon({super.key, required this.theIcon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          width: 84,
          height: 84,
          color: tblack20,
          child: Icon(
            theIcon,
            size: 36,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
