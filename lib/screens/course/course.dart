import 'package:aieraa_studies/base/Nodata.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/course_controller.dart';
import 'package:aieraa_studies/screens/gallry/image_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  _loadUserInfo() async {
    print("I am in Course page ............");
  }

  int subjectId = 0;
  List<String> subjects = [
    "Development",
    "Marketing",
    "Entrepreneurship",
    "IT & Software",
    "Business",
    "Health & Fitness",
  ];
  List<String> numbers = [
    "How To Become A Naturopathic Doctor",
    "Sport Competitions ",
    "Rock Climbing Walls",
    "Create a Hiking Group",
    "Create a Tour Group",
    "Create a Mountaineering Group",
  ];
  List<String> descriptions = [
    "Step-by-step guide to gaining admission an...",
    "Instead of just hosting the usual college sports team games...",
    "Rent a large, fake rock-climbing wall to setup outside  time....",
    "Offer students a chance to get off Create a clu....",
    "Instead of just hosting the usual  compe...",
    "Offer students a chance to get off . Create a clu....",
  ];
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<CourseController>().getCourses(subjectId);
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
            child: GetBuilder<CourseController>(
              builder: (courseController) {
                return (_isLoggedIn)
                    ? (courseController.isLoading == false
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
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Course Video',
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
                                  top:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: SingleChildScrollView(
                                    // top: MediaQuery.of(context).size.height * 0.20,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.2,
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
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 30,
                                            bottom: 15),
                                        child: NoData(),
                                        // padding: const EdgeInsets.all(15),
                                        // child: Column(
                                        //   children: [
                                        //     // Image.asset('assets/noData.png',
                                        //     //     fit: BoxFit.contain),
                                        //     // Text(
                                        //     //   "You Will Get This Feature Soon ",
                                        //     //   style: TextStyle(
                                        //     //       fontSize: 20,
                                        //     //       fontWeight: FontWeight.bold),
                                        //     // ),
                                        //
                                        //     Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         Text('Categories',
                                        //             style: TextStyle(
                                        //                 color: Colors.black,
                                        //                 fontSize: 24,
                                        //                 fontWeight:
                                        //                     FontWeight.w700)),
                                        //         GestureDetector(
                                        //           onTap: () {
                                        //             setState(() {
                                        //               subjectId = 0;
                                        //             });
                                        //           },
                                        //           child: Text('see all',
                                        //               style: TextStyle(
                                        //                   color:
                                        //                       Color(0xff1A7ED0),
                                        //                   fontSize: 18,
                                        //                   fontWeight:
                                        //                       FontWeight.w400)),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       height: 10,
                                        //     ),
                                        //     Container(
                                        //       height: 40,
                                        //       child: ListView.builder(
                                        //           scrollDirection:
                                        //               Axis.horizontal,
                                        //           itemCount: courseController
                                        //               .subjectList.length,
                                        //           itemBuilder: (ctx, i) =>
                                        //               GestureDetector(
                                        //                 onTap: () {
                                        //                   setState(() {
                                        //                     subjectId =
                                        //                         courseController
                                        //                             .subjectList[
                                        //                                 i]
                                        //                             .id;
                                        //                   });
                                        //                   // Navigator.pushNamed(
                                        //                   //     context,
                                        //                   //     '/course_description');
                                        //                 },
                                        //                 child: Container(
                                        //                   padding:
                                        //                       EdgeInsets.only(
                                        //                     left: 5,
                                        //                     right: 5,
                                        //                   ),
                                        //                   margin:
                                        //                       EdgeInsets.all(5),
                                        //                   height: 30,
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(
                                        //                           color: Colors
                                        //                               .black12),
                                        //                       color:
                                        //                           Colors.white,
                                        //                       borderRadius: BorderRadius
                                        //                           .all(Radius
                                        //                               .circular(
                                        //                                   20))),
                                        //                   child: Padding(
                                        //                     padding:
                                        //                         const EdgeInsets
                                        //                             .all(5.0),
                                        //                     child: Center(
                                        //                         child: Text(
                                        //                             courseController
                                        //                                 .subjectList[
                                        //                                     i]
                                        //                                 .name)),
                                        //                   ),
                                        //                 ),
                                        //               )),
                                        //     ),
                                        //     SizedBox(
                                        //       height: 30,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         Text('Latest Lecture',
                                        //             style: TextStyle(
                                        //                 color: Colors.black,
                                        //                 fontSize: 24,
                                        //                 fontWeight:
                                        //                     FontWeight.w700)),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       height: 30,
                                        //     ),
                                        //     Container(
                                        //       height: 250,
                                        //       child:
                                        //           courseController.courseList
                                        //                       .length >
                                        //                   0
                                        //               ? ListView.builder(
                                        //                   scrollDirection:
                                        //                       Axis.horizontal,
                                        //                   shrinkWrap: true,
                                        //                   itemCount:
                                        //                       courseController
                                        //                           .courseList
                                        //                           .length,
                                        //                   itemBuilder: (ctx,
                                        //                           i) =>
                                        //                       GestureDetector(
                                        //                         onTap: () {
                                        //                           Get.toNamed(RouteHelper
                                        //                               .getcourse_descriptionRoute(
                                        //                                   i,
                                        //                                   "course_description"));
                                        //                           // Navigator.pushNamed(
                                        //                           //     context,
                                        //                           //     '/course_description');
                                        //                         },
                                        //                         child:
                                        //                             Container(
                                        //                           padding:
                                        //                               EdgeInsets
                                        //                                   .all(
                                        //                                       0),
                                        //                           margin:
                                        //                               EdgeInsets
                                        //                                   .all(
                                        //                                       5),
                                        //                           // height: 30,
                                        //                           width: 165,
                                        //                           decoration: BoxDecoration(
                                        //                               border: Border.all(
                                        //                                   color: Colors
                                        //                                       .black12),
                                        //                               color: Colors
                                        //                                   .white,
                                        //                               borderRadius:
                                        //                                   BorderRadius.all(
                                        //                                       Radius.circular(20))),
                                        //                           child:
                                        //                               Padding(
                                        //                             padding:
                                        //                                 const EdgeInsets
                                        //                                     .all(0),
                                        //                             child:
                                        //                                 Column(
                                        //                               mainAxisAlignment:
                                        //                                   MainAxisAlignment
                                        //                                       .start,
                                        //                               children: [
                                        //                                 Container(
                                        //                                   height:
                                        //                                       90,
                                        //                                   width:
                                        //                                       162,
                                        //                                   child:
                                        //                                       ClipRRect(
                                        //                                     borderRadius:
                                        //                                         BorderRadius.circular(16.0),
                                        //                                     // child: Image.network(
                                        //                                     //     AppConstants.UPLOADS_URL +
                                        //                                     //         courseController.courseList[i].thumbnail,
                                        //                                     //     fit: BoxFit.cover),
                                        //                                     child:
                                        //                                         Image.network('https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg', fit: BoxFit.contain),
                                        //                                   ),
                                        //                                 ),
                                        //                                 SizedBox(
                                        //                                   height:
                                        //                                       5,
                                        //                                 ),
                                        //                                 new Divider(
                                        //                                   color:
                                        //                                       Colors.black,
                                        //                                 ),
                                        //                                 Center(
                                        //                                     child:
                                        //                                         Text(courseController.courseList[i].name, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold))),
                                        //                                 Center(
                                        //                                     child:
                                        //                                         Padding(
                                        //                                   padding:
                                        //                                       const EdgeInsets.all(5.0),
                                        //                                   child: Text(
                                        //                                       courseController.courseList[i].description,
                                        //                                       maxLines: 2,
                                        //                                       style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                                        //                                 )),
                                        //                                 Padding(
                                        //                                   padding:
                                        //                                       const EdgeInsets.all(5.0),
                                        //                                   child:
                                        //                                       Row(
                                        //                                     children: [
                                        //                                       Text('Subject : ', maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                                        //                                       Text(courseController.courseList[i].subject_name, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                                        //                                     ],
                                        //                                   ),
                                        //                                 ),
                                        //                                 Padding(
                                        //                                   padding:
                                        //                                       const EdgeInsets.all(5.0),
                                        //                                   child:
                                        //                                       Row(
                                        //                                     children: [
                                        //                                       Text(_TiemFormate(courseController.courseList[i].created_at), maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                                        //                                       // Text(_TiemFormate(courseController.courseList[i].created_at), maxLines: 2, style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                                        //                                     ],
                                        //                                   ),
                                        //                                 ),
                                        //                               ],
                                        //                             ),
                                        //                           ),
                                        //                         ),
                                        //                       ))
                                        //               : Text('No Data Found'),
                                        //     ),
                                        //     SizedBox(
                                        //       height: 10,
                                        //     ),
                                        //     // Row(
                                        //     //   children: [
                                        //     //     Text('Aromatherapy',
                                        //     //         style: TextStyle(
                                        //     //             color: Colors.black,
                                        //     //             fontSize: 24,
                                        //     //             fontWeight:
                                        //     //                 FontWeight.w700)),
                                        //     //   ],
                                        //     // ),
                                        //     // SizedBox(
                                        //     //   height: 30,
                                        //     // ),
                                        //     // Container(
                                        //     //   height: 250,
                                        //     //   child:
                                        //     //       courseController.courseList
                                        //     //                   .length >
                                        //     //               0
                                        //     //           ? ListView.builder(
                                        //     //               scrollDirection:
                                        //     //                   Axis.horizontal,
                                        //     //               shrinkWrap: true,
                                        //     //               itemCount:
                                        //     //                   courseController
                                        //     //                       .courseList
                                        //     //                       .length,
                                        //     //               itemBuilder: (ctx,
                                        //     //                       i) =>
                                        //     //                   GestureDetector(
                                        //     //                     onTap: () {
                                        //     //                       Get.toNamed(RouteHelper
                                        //     //                           .getcourse_descriptionRoute(
                                        //     //                               i,
                                        //     //                               "course_description"));
                                        //     //                       // Navigator.pushNamed(
                                        //     //                       //     context,
                                        //     //                       //     '/course_description');
                                        //     //                     },
                                        //     //                     child:
                                        //     //                         Container(
                                        //     //                       padding:
                                        //     //                           EdgeInsets
                                        //     //                               .all(
                                        //     //                                   0),
                                        //     //                       margin:
                                        //     //                           EdgeInsets
                                        //     //                               .all(
                                        //     //                                   5),
                                        //     //                       // height: 30,
                                        //     //                       width: 165,
                                        //     //                       decoration: BoxDecoration(
                                        //     //                           border: Border.all(
                                        //     //                               color: Colors
                                        //     //                                   .black12),
                                        //     //                           color: Colors
                                        //     //                               .white,
                                        //     //                           borderRadius:
                                        //     //                               BorderRadius.all(
                                        //     //                                   Radius.circular(20))),
                                        //     //                       child:
                                        //     //                           Padding(
                                        //     //                         padding:
                                        //     //                             const EdgeInsets
                                        //     //                                 .all(0),
                                        //     //                         child:
                                        //     //                             Column(
                                        //     //                           mainAxisAlignment:
                                        //     //                               MainAxisAlignment
                                        //     //                                   .start,
                                        //     //                           children: [
                                        //     //                             Container(
                                        //     //                               height:
                                        //     //                                   100,
                                        //     //                               width:
                                        //     //                                   162,
                                        //     //                               child:
                                        //     //                                   ClipRRect(
                                        //     //                                 borderRadius:
                                        //     //                                     BorderRadius.circular(16.0),
                                        //     //                                 // child: Image.network(
                                        //     //                                 //     AppConstants.UPLOADS_URL +
                                        //     //                                 //         courseController.courseList[i].thumbnail,
                                        //     //                                 //     fit: BoxFit.cover),
                                        //     //                                 child:
                                        //     //                                     Image.network('https://www.nopcommerce.com/images/thumbs/0005720_coming-soon-page_550.jpeg', fit: BoxFit.cover),
                                        //     //                               ),
                                        //     //                             ),
                                        //     //                             Center(
                                        //     //                                 child:
                                        //     //                                     Text(courseController.courseList[i].name, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600))),
                                        //     //                             Center(
                                        //     //                                 child:
                                        //     //                                     Padding(
                                        //     //                               padding:
                                        //     //                                   const EdgeInsets.all(5.0),
                                        //     //                               child: Text(
                                        //     //                                   courseController.courseList[i].description,
                                        //     //                                   maxLines: 5,
                                        //     //                                   style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                                        //     //                             )),
                                        //     //                           ],
                                        //     //                         ),
                                        //     //                       ),
                                        //     //                     ),
                                        //     //                   ))
                                        //     //           : Text('No Data Found'),
                                        //     // ),
                                        //   ],
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          )
                        : CustomLoader())
                    // : CircularProgressIndicator())
                    : GoToSignInPage();
              },
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }

  _TiemFormate(time) {
    var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);
    DateTime dt = DateTime.parse(newStr);
    return DateFormat("d MMM yyyy HH:mm:ss").format(dt);
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
          Navigator.pushNamed(context, '/$TOmove');
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
                            // _applyNow(context);
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
                            // _applyNow(context);
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

class ImageCard extends StatelessWidget {
  const ImageCard({required this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}
