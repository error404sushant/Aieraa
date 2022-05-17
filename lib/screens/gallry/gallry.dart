import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/gallery_controller.dart';
import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';

class Gallry extends StatefulWidget {
  const Gallry({Key? key}) : super(key: key);

  @override
  State<Gallry> createState() => _GallryState();
}

class _GallryState extends State<Gallry> {
  _loadUserInfo() async {
    print("I am in event page ............");
  }

  Future<void> _loadResources(bool reload) async {
    await Get.find<GalleryController>().getGalleryCategory();
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
      Get.find<GalleryController>().getGalleryCategory();
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
            child: GetBuilder<GalleryController>(
              builder: (galleryController) {
                return (_isLoggedIn)
                    ? (galleryController.isLoading == false
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
                                            'Gallery',
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
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1.2,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: whiteshade,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(45),
                                              topRight: Radius.circular(45))),
                                      child: Padding(
                                        // padding: const EdgeInsets.only(left: 20, top: 30),
                                        padding: const EdgeInsets.all(15),
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            itemCount: galleryController
                                                .categoryList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return RawMaterialButton(
                                                onPressed: () {
                                                  Get.toNamed(RouteHelper
                                                      .getgallryGridshowRoute(
                                                          galleryController
                                                              .categoryList[
                                                                  index]
                                                              .id));
                                                },
                                                child: Hero(
                                                  tag: 'logo$index',
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Column(
                                                      children: [
                                                        ImageCard(
                                                          imageUrl: AppConstants
                                                                  .UPLOADS_URL +
                                                              galleryController
                                                                  .categoryList[
                                                                      index]
                                                                  .url_path,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                            galleryController
                                                                .categoryList[
                                                                    index]
                                                                .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
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
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }

  _TiemFormate(time) {
    var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);
    DateTime dt = DateTime.parse(newStr);
    print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);
  }
}

class ImageCard extends StatelessWidget {
  ImageCard({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
// ListView.builder(
//   physics:
//       NeverScrollableScrollPhysics(),
//   shrinkWrap: true,
//   padding: EdgeInsets.only(top: 10),
//   itemCount: galleryController
//       .categoryList.length,
//   itemBuilder: (context, index) {
//     return GestureDetector(
//         onTap: () {
//           Get.toNamed(RouteHelper
//               .getgallryGridshowRoute(
//                   galleryController
//                       .categoryList[
//                           index]
//                       .id));
//         },
//         child: Container(
//           margin: EdgeInsets.only(
//               left: 10,
//               right: 10,
//               bottom: 15),
//           child: Row(
//             mainAxisAlignment:
//                 MainAxisAlignment
//                     .start,
//             children: [
//               Container(
//                 width: 75,
//                 height: 103,
//                 decoration: BoxDecoration(
//                     borderRadius:
//                         BorderRadius
//                             .circular(
//                                 12),
//                     image: DecorationImage(
//                         fit: BoxFit
//                             .contain,
//                         image: NetworkImage(AppConstants
//                                 .UPLOADS_URL +
//                             galleryController.categoryList[index].url_path))),
//                 // image: AssetImage(
//                 //               'assets/images/image_1.png'))),
//               ),
//               Expanded(
//                 child: Container(
//                   padding:
//                       EdgeInsets
//                           .all(0),
//                   height: 127,
//                   decoration: BoxDecoration(
//                       color: Colors
//                           .white,
//                       borderRadius: BorderRadius.only(
//                           topRight:
//                               Radius.circular(
//                                   20),
//                           bottomRight:
//                               Radius.circular(
//                                   20))),
//                   child: Padding(
//                     padding: EdgeInsets
//                         .only(
//                             left:
//                                 10,
//                             right:
//                                 10),
//                     child: Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment
//                               .start,
//                       mainAxisAlignment:
//                           MainAxisAlignment
//                               .center,
//                       children: [
//                         Text(
//                             _TiemFormate(galleryController
//                                 .categoryList[
//                                     index]
//                                 .updated_at),
//                             style: TextStyle(
//                                 color: Color(
//                                     0xff0C4778),
//                                 fontSize:
//                                     14,
//                                 fontWeight:
//                                     FontWeight.w400)),
//                         SizedBox(
//                           height:
//                               10,
//                         ),
//                         Text(
//                             galleryController
//                                 .categoryList[
//                                     index]
//                                 .name,
//                             overflow:
//                                 TextOverflow
//                                     .ellipsis,
//                             style: TextStyle(
//                                 color: Colors
//                                     .black,
//                                 fontSize:
//                                     20,
//                                 fontWeight:
//                                     FontWeight.w600)),
//                         SizedBox(
//                           height:
//                               10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   },
// ),GridView.builder(
//                                                   gridDelegate:
//                                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                                     crossAxisCount: 2,
//                                                   ),
//                                                   itemCount: galleryController
//                                                       .galleryList.length,
//                                                   itemBuilder:
//                                                       (BuildContext context,
//                                                           int index) {
//                                                     return RawMaterialButton(
//                                                       onPressed: () {
//                                                         Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                             builder:
//                                                                 (context) =>
//                                                                     DetailsPage(
//                                                               index: index,
//                                                               imagePath: AppConstants
//                                                                       .UPLOADS_URL +
//                                                                   galleryController
//                                                                       .galleryList[
//                                                                           index]
//                                                                       .url_path,
//                                                             ),
//                                                           ),
//                                                         );
//                                                       },
//                                                       child: Hero(
//                                                         tag: 'logo$index',
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(2.0),
//                                                           child: ImageCard(
//                                                             imageUrl: AppConstants
//                                                                     .UPLOADS_URL +
//                                                                 galleryController
//                                                                     .galleryList[
//                                                                         index]
//                                                                     .url_path,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   })
