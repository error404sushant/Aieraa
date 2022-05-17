import 'package:aieraa_studies/base/Nodata.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/gallery_controller.dart';
import 'package:aieraa_studies/screens/gallry/image_details.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';

class GallryGrid extends StatefulWidget {
  int categoryId;

  GallryGrid({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<GallryGrid> createState() => _GallryGridState();
}

class _GallryGridState extends State<GallryGrid> {
  _loadUserInfo() async {
    print("I am in event page ............");
  }

  Future<void> _loadResources(bool reload) async {
    await Get.find<GalleryController>().getGalleries(widget.categoryId);
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
      Get.find<GalleryController>().getGalleries(widget.categoryId);
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
                                          // padding: const EdgeInsets.only(left: 20, top: 30),
                                          padding: const EdgeInsets.all(15),
                                          child: galleryController
                                                      .galleryList.length >
                                                  0
                                              ? GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                  ),
                                                  itemCount: galleryController
                                                      .galleryList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return RawMaterialButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    DetailsPage(
                                                              index: index,
                                                              imagePath: AppConstants
                                                                      .UPLOADS_URL +
                                                                  galleryController
                                                                      .galleryList[
                                                                          index]
                                                                      .url_path,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'logo$index',
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: ImageCard(
                                                            imageUrl: AppConstants
                                                                    .UPLOADS_URL +
                                                                galleryController
                                                                    .galleryList[
                                                                        index]
                                                                    .url_path,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  })
                                              : NoData()
                                          // child: StaggeredGridView.countBuilder(
                                          //   crossAxisCount: 3,
                                          //   itemCount: imageList.length,
                                          //   itemBuilder: (context, index) => ImageCard(
                                          //     imageData: imageList[index],
                                          //   ),
                                          //   staggeredTileBuilder: (index) =>
                                          //       StaggeredTile.count(1, 1),
                                          //   mainAxisSpacing: 8.0,
                                          //   crossAxisSpacing: 8.0,
                                          // ),
                                          // child: new StaggeredGridView.countBuilder(
                                          //     crossAxisCount: 2,
                                          //     crossAxisSpacing: 12,
                                          //     mainAxisSpacing: 12,
                                          //     itemCount: imageList.length,
                                          //     itemBuilder: (context, index) {
                                          //       return Container(
                                          //         decoration: BoxDecoration(
                                          //             color: Colors.transparent,
                                          //             borderRadius: BorderRadius.all(
                                          //                 Radius.circular(12))),
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.all(Radius.circular(12)),
                                          //           child: FadeInImage.assetNetwork(
                                          //             placeholder: "asdf",
                                          //             image: imageList[index],
                                          //             fit: BoxFit.cover,
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //     staggeredTileBuilder: (index) {
                                          //       return new StaggeredTile.count(
                                          //           1, index.isEven ? 1.2 : 1.8);
                                          //     }),
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
}

// class InstagramSearchGrid extends StatelessWidget {
//   const InstagramSearchGrid({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 3,
//       itemCount: imageList.length,
//       itemBuilder: (context, index) => ImageCard(
//         imageData: imageList[index],
//       ),
//       staggeredTileBuilder: (index) => StaggeredTile.count(
//           (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
//       mainAxisSpacing: 8.0,
//       crossAxisSpacing: 8.0,
//     );
//   }
// }
//
// class PinterestGrid extends StatelessWidget {
//   const PinterestGrid({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 2,
//       itemCount: imageList.length,
//       itemBuilder: (context, index) => ImageCard(
//         imageData: imageList[index],
//       ),
//       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//       mainAxisSpacing: 8.0,
//       crossAxisSpacing: 8.0,
//     );
//   }
// }

class ImageCard extends StatelessWidget {
  ImageCard({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
