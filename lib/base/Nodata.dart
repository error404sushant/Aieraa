import 'package:aieraa_studies/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
            child: Container(
          margin: EdgeInsets.only(bottom: 60),
          // decoration: BoxDecoration(
          //     color: AppColors.mainColor, borderRadius: BorderRadius.circular(50)),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/NoDataFound.png",
            fit: BoxFit.contain,
          ),
        )),
        Container(
          child: Text('No Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Page has no data, click on the Go back button ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0xFF10C8CD),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "Go Back",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: whiteshade),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
