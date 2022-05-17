import 'package:aieraa_studies/base/Nodata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class EaxmResult extends StatefulWidget {
  const EaxmResult({Key? key}) : super(key: key);

  @override
  State<EaxmResult> createState() => _EaxmResultState();
}

class _EaxmResultState extends State<EaxmResult> {
  String dropdownvalue = 'semester 1';
  var items = [
    'semester 1',
    'semester 2',
    'semester 3',
  ];
  List<String> subjects = [
    "English",
    "Science",
    "Maths",
    "Social Study",
    "Drawing",
    "Computer",
  ];
  List<String> numbers = [
    "91-A",
    "84-B",
    "74-B",
    "88-B",
    "66-C",
    "90-A",
  ];
  var _tabTextIconIndexSelected = 0;
  var _listGenderText = ["Fee Due", "History"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/aieraa_bg.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 16),
                                  child: IconButton(
                                    color: Colors.white,
                                    icon: SvgPicture.asset(
                                        "assets/icons/ic_back.svg"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Exam Result',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                // Image.asset("assets/images/logo.png")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/miniLogo.png')),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  // color: Colors.white60,
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140.0,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 140,
                                height: 140,
                                child: new CircularProgressIndicator(
                                  color: Color(0xff10C8CD),
                                  backgroundColor: Colors.white60,
                                  strokeWidth: 7,
                                  value: 0,
                                  // value: 0.8,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  "0 %",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                  ),
                                )),
                                Center(
                                    child: Text(
                                  "Grade A",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Text("Attendance"),
                    ],
                  ),
                ),
                Stack(children: [
                  SingleChildScrollView(
                    // top: MediaQuery.of(context).size.height * 0.20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      width: MediaQuery.of(context).size.width,
                      // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                      margin: const EdgeInsets.only(top: 220),
                      decoration: BoxDecoration(
                          color: whiteshade,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      child: Padding(
                        // padding: const EdgeInsets.only(left: 20, top: 30),
                        padding: const EdgeInsets.all(15),
                        // child: Column(
                        //   // mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       height: heightInPercent(5, context),
                        //     ),
                        //     Image.asset('assets/commingSoon.png',
                        //         fit: BoxFit.contain),
                        //     SizedBox(
                        //       height: heightInPercent(5, context),
                        //     ),
                        //     Text(
                        //       "You Will Get This Feature Soon ",
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.bold),
                        //     ),
                        //     // Container(
                        //     //   child: DropdownButton(
                        //     //     dropdownColor: Colors.white,
                        //     //     value: dropdownvalue,
                        //     //     icon: const Icon(
                        //     //       Icons.keyboard_arrow_down,
                        //     //       color: Colors.black,
                        //     //     ),
                        //     //     items: items.map((String items) {
                        //     //       return DropdownMenuItem(
                        //     //         value: items,
                        //     //         child: Text(items,
                        //     //             style: TextStyle(
                        //     //                 color: Colors.black,
                        //     //                 fontWeight: FontWeight.bold)),
                        //     //       );
                        //     //     }).toList(),
                        //     //     onChanged: (String? newValue) {
                        //     //       setState(() {
                        //     //         dropdownvalue = newValue!;
                        //     //       });
                        //     //     },
                        //     //   ),
                        //     // ),
                        //     // Text(
                        //     //   'You are Excellent!!',
                        //     //   style: TextStyle(
                        //     //     color: Colors.black,
                        //     //     fontSize: 18,
                        //     //   ),
                        //     // ),
                        //     // Text(
                        //     //   "Student Name",
                        //     //   style: TextStyle(
                        //     //       color: Colors.black,
                        //     //       fontSize: 45,
                        //     //       fontWeight: FontWeight.w700),
                        //     // ),
                        //     // ListView.separated(
                        //     //   itemBuilder: (BuildContext, index) {
                        //     //     return ListTile(
                        //     //       leading: Text(
                        //     //         subjects[index],
                        //     //         style: TextStyle(
                        //     //             color: Colors.black,
                        //     //             fontSize: 18,
                        //     //             fontWeight: FontWeight.w600),
                        //     //       ),
                        //     //       trailing: Text(numbers[index],
                        //     //           style: TextStyle(
                        //     //               color: Color(0xff1A7ED0),
                        //     //               fontSize: 20,
                        //     //               fontWeight: FontWeight.w600)),
                        //     //     );
                        //     //   },
                        //     //   separatorBuilder: (BuildContext, index) {
                        //     //     return Divider(height: 1);
                        //     //   },
                        //     //   itemCount: subjects.length,
                        //     //   shrinkWrap: true,
                        //     //   padding: EdgeInsets.all(5),
                        //     //   scrollDirection: Axis.vertical,
                        //     // ),
                        //     // const SizedBox(
                        //     //   height: 10,
                        //     // ),
                        //     // InkWell(
                        //     //   onTap: () {
                        //     //     Navigator.pop(context);
                        //     //   },
                        //     //   child: Container(
                        //     //     width: MediaQuery.of(context).size.width,
                        //     //     height:
                        //     //         MediaQuery.of(context).size.height * 0.07,
                        //     //     margin:
                        //     //         const EdgeInsets.only(left: 20, right: 20),
                        //     //     decoration: BoxDecoration(
                        //     //         color: Color(0xFF10C8CD),
                        //     //         borderRadius: const BorderRadius.all(
                        //     //             Radius.circular(10))),
                        //     //     child: Center(
                        //     //       child: Text(
                        //     //         "Download PDF",
                        //     //         style: TextStyle(
                        //     //             fontSize: 24,
                        //     //             fontWeight: FontWeight.w500,
                        //     //             color: whiteshade),
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        child: NoData(),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          // bottomNavigationBar: MyBottomNavBar(),
        ));
  }
}
