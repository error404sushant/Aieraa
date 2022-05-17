import 'dart:convert';
import 'dart:io';

import 'package:aieraa_studies/base/custom_Succsnackbar.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/job_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class PartTimeJob extends StatefulWidget {
  const PartTimeJob({Key? key}) : super(key: key);

  @override
  State<PartTimeJob> createState() => _PartTimeJobState();
}

class _PartTimeJobState extends State<PartTimeJob> {
  late File _file;
  final ImagePicker _picker = ImagePicker();

  // chooseImage() {

  Future<File?> chooseImage(JobController jobController, jobId) async {
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // File file = await FilePicker.getFile();
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    // if (result == null) return;  // if user don't pick any thing then do nothing just return.

//now do something with file selected
    if (result != null) {
      File file = File(result.files.single.path.toString());
      // PlatformFile file = result.files.first;
      // String fileName = (file.path);
      // print("file name of pdf == " + file.toString());
      // print("file name of pdf == " +
      //     base64Encode(file.readAsBytesSync()).toString());
      // final File? file = File(result!.files.single.path);

      // File file = File(result.files.single.path);
      _snedPdfCv(jobController, file, jobId);
      // final File? file = File(image!.path);
    }

    // Navigator.pop(context);
  }

  _loadUserInfo() async {
    // await Get.find<LocationController>().getAddressList();
    // if (Get.find<LocationController>().addressList.isNotEmpty) {
    //   var address = Get.find<LocationController>().addressList[0];
    //   await Get.find<LocationController>().saveUserAddress(address);
    print("I am in Part time  page ............");
    // } else {
    //   print("addresslist is empty");
    // }
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<JobController>().getJobs();
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
          body: GetBuilder<JobController>(builder: (jobController) {
            return (_isLoggedIn)
                ? (jobController.isLoading == false
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
                                          'Part Time Job',
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
                                          //       fontSize: 20,
                                          //       fontWeight: FontWeight.bold),
                                          // ),
                                          ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(top: 10),
                                            itemCount:
                                                jobController.jobList.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: () {
                                                    _applyNow(
                                                        context,
                                                        jobController
                                                            .jobList[index],
                                                        jobController);
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
                                                        Expanded(
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            height: 127,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      right:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          jobController
                                                                              .jobList[
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
                                                                          jobController
                                                                              .jobList[
                                                                                  index]
                                                                              .from_date,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.w400)),
                                                                    ],
                                                                  ),
                                                                  IconButton(
                                                                    icon: SvgPicture
                                                                        .asset(
                                                                            "assets/icons/ic_play.svg"),
                                                                    onPressed:
                                                                        () {
                                                                      _applyNow(
                                                                          context,
                                                                          jobController
                                                                              .jobList[index],
                                                                          jobController);
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
                        ),
                      )
                    : CustomLoader())
                : GoToSignInPage();
          }),
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }

  void _snedPdfCv(JobController jobController, File files, jobId) async {
    // setState(() {
    //   isLoading = true;
    // });

    bool _isValid = GetPlatform.isWeb ? true : false;
    if (null != files) {
      jobController
          .applyForJob(base64Encode(files.readAsBytesSync()).toString(), jobId)
          .then((status) async {
        if (status.isSuccess) {
          showCustomSuccessSnackBar(status.message);
          Navigator.pop(context);
          setState(() {
            // isLoading = false;
          });
          // Get.toNamed(RouteHelper.getsupportRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _applyNow(context, joblist, jobController) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    // padding: const EdgeInsets.only(left: 20, top: 30),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                joblist.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$' + joblist.salary + ' per hour',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                joblist.description,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            chooseImage(jobController, joblist.id);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Color(0xFF10C8CD),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "UPLOAD CV AND APPLY NOW",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: whiteshade),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
