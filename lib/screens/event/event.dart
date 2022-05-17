import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/event_controller.dart';
import 'package:aieraa_studies/controllers/popular_product.dart';
import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  _loadUserInfo() async {
    print("I am in event page ............");
  }

  Future<void> _loadResources(bool reload) async {
    await Get.find<PopularProduct>().getPopularProductList(reload);
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   await Get.find<UserController>().getUserInfo();
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      _loadResources(true);
      Get.find<EventController>().getEvents();
      // Get.find<PopularProduct>().getUserInfo(reload);
      // Get.find<LocationController>().getAddressList();
      _loadUserInfo();
    } else {
      print("empty" + _isLoggedIn.toString());
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/aieraa_bg.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: GetBuilder<EventController>(
                builder: (eventController) {
                  return (_isLoggedIn)
                      ? (eventController.isLoading == false
                          ? Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(top: 50, left: 16, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              'Event',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
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
                                            image: AssetImage(
                                                'assets/miniLogo.png')),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    top: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: SingleChildScrollView(
                                      // top: MediaQuery.of(context).size.height * 0.20,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1.2,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                        // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                                        // margin: const EdgeInsets.only(top: 60),
                                        decoration: BoxDecoration(
                                            color: whiteshade,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(45),
                                                    topRight:
                                                        Radius.circular(45))),
                                        child: Padding(
                                          // padding: const EdgeInsets.only(left: 20, top: 30),
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                itemCount: eventController
                                                    .popularProductList.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(RouteHelper
                                                            .getevent_detailsRoute(
                                                                index,
                                                                "event_details",
                                                                RouteHelper
                                                                    .initial)); // Navigator.pop(context);
                                                        // Navigator.pushNamed(
                                                        //     context,
                                                        //     '/event_details');
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            bottom: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 75,
                                                              height: 103,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(AppConstants
                                                                              .UPLOADS_URL +
                                                                          eventController
                                                                              .popularProductList[index]
                                                                              .photo))),
                                                              // image: AssetImage(
                                                              //               'assets/images/image_1.png'))),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(0),
                                                                height: 127,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                20),
                                                                        bottomRight:
                                                                            Radius.circular(20))),
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          _TiemFormate(eventController
                                                                              .popularProductList[
                                                                                  index]
                                                                              .created_at),
                                                                          style: TextStyle(
                                                                              color: Color(0xff0C4778),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w400)),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          eventController
                                                                              .popularProductList[
                                                                                  index]
                                                                              .title,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w600)),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          eventController
                                                                              .popularProductList[
                                                                                  index]
                                                                              .short_description,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.w400)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            )
                          : CustomLoader())
                      : GoToSignInPage();
                },
              ),
              // bottomNavigationBar: MyBottomNavBar(),
            )));
  }

  _TiemFormate(time) {
    var str = "2019-04-05T14:00:51.000Z";
    var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);
    print(newStr); // 2019-04-05 14:00:51.000
    DateTime dt = DateTime.parse(newStr);
    print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);
  }
}
