import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/constants.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/user_controller.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class homeDashboard extends StatefulWidget {
  const homeDashboard({Key? key}) : super(key: key);

  @override
  State<homeDashboard> createState() => _homeDashboardState();
}

class _homeDashboardState extends State<homeDashboard> {
  @override
  _loadUserInfo() async {
    // await Get.find<LocationController>().getAddressList();
    // if (Get.find<LocationController>().addressList.isNotEmpty) {
    //   var address = Get.find<LocationController>().addressList[0];
    //   await Get.find<LocationController>().saveUserAddress(address);
    // await Get.find<AttendanceController>().getAttendance();

    print("I am in home page ............");
    // } else {
    //   print("addresslist is empty");
    // }
  }

  @override
  Widget build(BuildContext context) {
    // bool _isLoggedIn = false;
    // _checkLogin() async {
    //   bool doLogin = await Get.find<AuthController>().doLoggedIn();
    //   if (doLogin) {
    //     _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    //     if (_isLoggedIn) {
    //       Get.find<UserController>().getUserInfo();
    //       // Get.find<AttendanceController>().getAttendance();
    //       // Get.find<LocationController>().getAddressList();
    //       _loadUserInfo();
    //     } else {
    //       print("empty" + _isLoggedIn.toString());
    //     }
    //   } else {
    //     Get.offNamed(RouteHelper.getloginRoute());
    //   }
    // }

    // _checkLogin();
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<UserController>().getUserInfo();
      // Get.find<AttendanceController>().getAttendance();
      // Get.find<LocationController>().getAddressList();
      _loadUserInfo();
    } else {
      print("empty" + _isLoggedIn.toString());
    }
    // var present =
    //     Get.find<AttendanceController>().attendanceModel.present_class;
    // var total =
    //     Get.find<AttendanceController>().attendanceModel.total_class_days;
    // print(present);
    // print(total);
    // double _percentClass = (int.parse(present) * 100) / int.parse(total);
    // print(_percentClass);
    // double _percentClass = 40.0;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/aieraa_bg.png'), fit: BoxFit.cover),
        ),
        child: GetBuilder<UserController>(builder: (userController) {
          return (_isLoggedIn)
              ? (userController.isLoading == true
                  ? Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SafeArea(
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(left: 16),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/miniLogo.png')),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 50, left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hi ' +
                                        userController.userInfoModel.first_name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 32.0,
                                    // radius: 36,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(AppConstants
                                              .UPLOADS_URL +
                                          userController.userInfoModel.image),
                                      // backgroundImage: AssetImage(
                                      //     'assets/images/profile_img.png'),
                                      radius: 30.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 110, left: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hongbang International University ',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 140, left: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      'Session 2022-23 ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                top: MediaQuery.of(context).size.height * 0.25,
                                child: SingleChildScrollView(
                                  // top: MediaQuery.of(context).size.height * 0.20,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        1.6,
                                    width: MediaQuery.of(context).size.width,
                                    // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                    // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                                    // margin: const EdgeInsets.only(top: 200),
                                    decoration: BoxDecoration(
                                        color: whiteshade,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45))),

                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: GridView.count(
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              primary: false,
                                              crossAxisCount: 2,
                                              children: [
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/attendance');
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 56.0,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Center(
                                                                child:
                                                                    Container(
                                                                  width: 57,
                                                                  height: 57,
                                                                  child:
                                                                      new CircularProgressIndicator(
                                                                    color:
                                                                        kStrokclor,
                                                                    strokeWidth:
                                                                        5,
                                                                    value: userController
                                                                            .userInfoModel
                                                                            .att_percent /
                                                                        100,
                                                                  ),
                                                                ),
                                                              ),
                                                              Center(
                                                                  child: Text(userController
                                                                          .userInfoModel
                                                                          .att_percent
                                                                          .toString() +
                                                                      " %")),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: kDefaultSpace,
                                                        ),
                                                        Text("Attendance"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                MenuCard(
                                                    menuName: "Calender",
                                                    IconName: "ic_event.svg",
                                                    TOmove: "calender"),
                                                MenuCard(
                                                    menuName: "Support 24x7",
                                                    IconName: "ic_doubts.svg",
                                                    TOmove: "support"),
                                                MenuCard(
                                                    menuName: "Translation",
                                                    IconName:
                                                        "ic_translation.svg",
                                                    TOmove: "translator"),
                                                MenuCard(
                                                    menuName: "Events",
                                                    IconName: "ic_event.svg",
                                                    TOmove: "event"),
                                                MenuCard(
                                                    menuName: "Gallery",
                                                    IconName: "ic_gallery.svg",
                                                    TOmove: "gallry"),
                                                MenuCard(
                                                    menuName: "Fees Due",
                                                    IconName: "ic_fees.svg",
                                                    TOmove: "fees"),
                                                MenuCard(
                                                    menuName: "Course Video",
                                                    IconName: "ic_video.svg",
                                                    TOmove: "course"),
                                                MenuCard(
                                                    menuName: "Exam Result",
                                                    IconName: "ic_results.svg",
                                                    TOmove: "exam_result"),
                                                MenuCard(
                                                    menuName: "Part Time Jobs",
                                                    IconName: "ic_jobs.svg",
                                                    TOmove: "part_time_job"),
                                                MenuCard(
                                                    menuName: "Settings",
                                                    IconName: "ic_location.svg",
                                                    TOmove: "settings"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                padding: new EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .77,
                                    right: 20.0,
                                    left: 20.0),
                                child: new Container(
                                  // height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: InkWell(
                                    onTap: () {
                                      launch("tel://938 69 2015");
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFF4D4D),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/ic_phone.svg",
                                              height: 35,
                                            ),
                                            const SizedBox(
                                              height: kDefaultSpace,
                                            ),
                                            Text(
                                              "Call Aieraa ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: whiteshade),
                                            ),
                                            Text("24x7 avilable",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: whiteshade)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      bottomNavigationBar: MyBottomNavBar(),
                    )
                  : CustomLoader())
              // : CircularProgressIndicator())
              : GoToSignInPage();
        }));
  }
}

class MenuCard extends StatelessWidget {
  String menuName;
  String IconName;
  String TOmove;
  MenuCard(
      {Key? key,
      required this.menuName,
      required this.IconName,
      required this.TOmove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/$TOmove');
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => homeDashboard()));
          print("$menuName");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$IconName",
              height: 56,
            ),
            const SizedBox(
              height: kDefaultSpace,
            ),
            Text("$menuName"),
          ],
        ),
      ),
    );
  }
}
