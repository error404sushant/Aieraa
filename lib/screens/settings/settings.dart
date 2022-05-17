import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // final Uri _urlfaq = Uri.parse('https://aieraa.com/faq/');
  final String _urlfaq = 'https://aieraa.com/faq/';
  bool isSwitched = true;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

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
                              'Settings',
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
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.06,
                    child: SingleChildScrollView(
                      // top: MediaQuery.of(context).size.height * 0.20,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1.2,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                        // margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                            color: whiteshade,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
                        child: Padding(
                          // padding: const EdgeInsets.only(left: 20, top: 30),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuCard(
                                  menuName: "Profile",
                                  IconName: Icon(Icons.person),
                                  TOmove: "profile"),
                              GestureDetector(
                                  onTap: () {
                                    toggleSwitch;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.add_location),
                                                    onPressed: () {
                                                      // launch(_urlfaq);
                                                    },
                                                  ),
                                                  Text('Location',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  Transform.scale(
                                                      scale: 1.5,
                                                      child: Switch(
                                                        onChanged: toggleSwitch,
                                                        value: isSwitched,
                                                        activeColor:
                                                            Colors.blue,
                                                        activeTrackColor:
                                                            Colors.blueGrey,
                                                        inactiveThumbColor:
                                                            Colors.black26,
                                                        inactiveTrackColor:
                                                            Colors.blueGrey,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              MenuCard(
                                  menuName: "Change Password",
                                  IconName: Icon(Icons.lock),
                                  TOmove: "chnange_password"),
                              // MenuCard(
                              //     menuName: "Privacy Policy",
                              //     IconName: Icon(Icons.shield),
                              //     TOmove: "about_us"),
                              // MenuCard(
                              //     menuName: "Terms & Conditions",
                              //     IconName: Icon(Icons.list),
                              //     TOmove: "about_us"),
                              MenuCard(
                                  menuName: "About us",
                                  IconName: Icon(Icons.info),
                                  TOmove: "about_us"),
                              GestureDetector(
                                  onTap: () {
                                    launch(_urlfaq);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.help),
                                                    onPressed: () {
                                                      launch(_urlfaq);
                                                    },
                                                  ),
                                                  Text('FAQ’s',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  IconButton(
                                                    icon: SvgPicture.asset(
                                                        "assets/icons/ic_play.svg"),
                                                    onPressed: () {
                                                      launch(_urlfaq);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              MenuCard(
                                  menuName: "Logout",
                                  IconName: Icon(Icons.logout),
                                  TOmove: "login"),
                            ],
                          ),
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
  }
}

class MenuCard extends StatelessWidget {
  String menuName;
  Icon IconName;
  String TOmove;
  MenuCard(
      {Key? key,
      required this.menuName,
      required this.IconName,
      required this.TOmove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (menuName == "Logout") {
            Get.find<AuthController>().clearSharedData();
            Navigator.pushNamed(context, '/$TOmove');
          } else {
            Navigator.pushNamed(context, '/$TOmove');
          }

          // Navigator.pushNamed(context,'/event_details');
        },
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: IconName,
                          onPressed: () {
                            Navigator.pushNamed(context, '/$TOmove');
                          },
                        ),
                        Text(menuName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        IconButton(
                          icon: SvgPicture.asset("assets/icons/ic_play.svg"),
                          onPressed: () {
                            if (menuName == "Logout") {
                              Get.find<AuthController>().clearSharedData();
                              Navigator.pushNamed(context, '/$TOmove');
                            } else {
                              Navigator.pushNamed(context, '/$TOmove');
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
