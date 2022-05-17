import 'package:aieraa_studies/base/Nodata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  var _tabTextIconIndexSelected = 0;
  var _listGenderText = ["Hostel", "College", "History"];
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 16),
                              child: IconButton(
                                color: Colors.white,
                                icon: SvgPicture.asset(
                                    "assets/icons/ic_back.svg"),
                                onPressed: () {
                                  print("pooed out ");
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Fees Due',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          // Image.asset("assets/images/logo.png")
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
                Stack(children: [
                  SingleChildScrollView(
                    // top: MediaQuery.of(context).size.height * 0.20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      width: MediaQuery.of(context).size.width,
                      // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                      margin: const EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                          color: whiteshade,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      child: Padding(
                        // padding: const EdgeInsets.only(left: 20, top: 30),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: NoData(),
                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     FlutterToggleTab(
                              //       width: 70,
                              //       borderRadius: 15,
                              //       selectedTextStyle: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 18,
                              //           fontWeight: FontWeight.w400),
                              //       unSelectedTextStyle: TextStyle(
                              //           color: Colors.blue,
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w400),
                              //       labels: _listGenderText,
                              //       // icons: _listIconTabToggle,
                              //       selectedIndex: _tabTextIconIndexSelected,
                              //       selectedLabelIndex: (index) {
                              //         setState(() {
                              //           _tabTextIconIndexSelected = index;
                              //         });
                              //       },
                              //     ),
                              //   ],
                              // ),
                            ),
                            // SizedBox(
                            //   height: heightInPercent(5, context),
                            // ),
                            // Image.asset('assets/commingSoon.png',
                            //     fit: BoxFit.contain),
                            // SizedBox(
                            //   height: heightInPercent(5, context),
                            // ),
                            // Text(
                            //   "You Will Get This Feature Soon ",
                            //   style: TextStyle(
                            //       fontSize: 20, fontWeight: FontWeight.bold),
                            // ),
                            // Text(
                            //   "Selected Tab : ${_listGenderText[_tabTextIconIndexSelected]} Coming Soon ",
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // Expanded(
                            //   child:
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ));
    ;
  }
}
