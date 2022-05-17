import 'dart:io';

import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/attendance_controller.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../constants.dart';

class PdfShow extends StatefulWidget {
  File files;

  PdfShow({
    Key? key,
    required this.files,
  }) : super(key: key);

  @override
  State<PdfShow> createState() => _PdfShowState();
}

class _PdfShowState extends State<PdfShow> {
  // late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  _loadUserInfo() async {
    print("I am in PDF page ............");
  }

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.files.path);
    final text = '${indexPage + 1} of $pages';
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<AttendanceController>().getAttendance();
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
          body:
              GetBuilder<AttendanceController>(builder: (attendanceController) {
            return (_isLoggedIn)
                ? (attendanceController.isLoading == true
                    ? SafeArea(
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          'PDF',
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
                                        image:
                                            AssetImage('assets/miniLogo.png')),
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
                                    height: MediaQuery.of(context).size.height *
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
                                      child: Expanded(
                                        child: Container(),
                                        // child: PDFView(
                                        //   filePath: widget.files.path,
                                        //   enableSwipe: true,
                                        //   swipeHorizontal: true,
                                        //   autoSpacing: true,
                                        //   // swipeHorizontal: true,
                                        //   pageSnap: true,
                                        //   pageFling: true,
                                        //   onRender: (pages) => setState(
                                        //       () => this.pages = pages!),
                                        //   onViewCreated: (controller) =>
                                        //       setState(() =>
                                        //           this.controller = controller),
                                        //   onPageChanged: (indexPage, _) =>
                                        //       setState(() =>
                                        //           this.indexPage = indexPage!),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      )
                    : // CustomLoader())
                    CircularProgressIndicator())
                : GoToSignInPage();
          }),
        ));
    ;
  }
}
