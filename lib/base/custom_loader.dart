import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        SpinKitThreeInOut(
          color: Colors.white,
          size: 50.0,
        ),
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
    // return Center(
    //     child: Container(
    //   height: 100,
    //   width: 100,
    //   decoration: BoxDecoration(
    //       color: AppColors.mainColor, borderRadius: BorderRadius.circular(50)),
    //   alignment: Alignment.center,
    //   child: CircularProgressIndicator(color: Colors.white),
    // ));
  }
}
