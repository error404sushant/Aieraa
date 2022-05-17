import 'package:aieraa_studies/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  final String _urlover = 'https://aieraa.com/overview/';
  final String _urlsigni = 'https://aieraa.com/significant/';
  final String _urlds = 'https://aieraa.com/directors-speak/';
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
                              'About Us',
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
                        height: MediaQuery.of(context).size.height,
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
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          launch(_urlover);
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
                                                          color:
                                                              Colors.black12),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          icon:
                                                              Icon(Icons.list),
                                                          onPressed: () {
                                                            launch(_urlover);
                                                          },
                                                        ),
                                                        Text('Overview',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        IconButton(
                                                          icon: SvgPicture.asset(
                                                              "assets/icons/ic_play.svg"),
                                                          onPressed: () {
                                                            launch(_urlover);
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
                                    GestureDetector(
                                        onTap: () {
                                          launch(_urlds);
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
                                                          color:
                                                              Colors.black12),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          icon:
                                                              Icon(Icons.list),
                                                          onPressed: () {
                                                            launch(_urlds);
                                                          },
                                                        ),
                                                        Text('Directors Speak',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        IconButton(
                                                          icon: SvgPicture.asset(
                                                              "assets/icons/ic_play.svg"),
                                                          onPressed: () {
                                                            launch(_urlds);
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
                                    GestureDetector(
                                        onTap: () {
                                          launch(_urlsigni);
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
                                                          color:
                                                              Colors.black12),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          icon:
                                                              Icon(Icons.list),
                                                          onPressed: () {
                                                            launch(_urlsigni);
                                                          },
                                                        ),
                                                        Text('Significant',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                        IconButton(
                                                          icon: SvgPicture.asset(
                                                              "assets/icons/ic_play.svg"),
                                                          onPressed: () {
                                                            launch(_urlsigni);
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
                                  ],
                                ),
                              ),
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
          // bottomNavigationBar: MyBottomNavBar(),
        ));
  }
}
