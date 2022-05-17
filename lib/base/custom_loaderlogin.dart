import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Center(
            child: Container(
          margin: EdgeInsets.only(bottom: 60),
          // decoration: BoxDecoration(
          //     color: AppColors.mainColor, borderRadius: BorderRadius.circular(50)),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/aieraagroup.png",
            fit: BoxFit.contain,
          ),
        )),
        Container(
          child: Image.asset(
            "assets/GroupDoc.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
