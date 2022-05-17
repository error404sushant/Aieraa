import 'package:aieraa_studies/constants.dart';
import 'package:aieraa_studies/controllers/gallery_controller.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final int index;
  DetailsPage({required this.imagePath, required this.index});

  @override
  Widget build(BuildContext context) {
    var galleryItem = Get.find<GalleryController>().galleryList[index];
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
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: IconButton(
                              color: Colors.white,
                              icon:
                                  SvgPicture.asset("assets/icons/ic_back.svg"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: whiteshade,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      child: Expanded(
                        child: Hero(
                          tag: 'logo$index',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  AppConstants.UPLOADS_URL +
                                      galleryItem.url_path,
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
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
