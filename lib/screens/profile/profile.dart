import 'dart:convert';
import 'dart:io';

import 'package:aieraa_studies/base/custom_Succsnackbar.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/user_controller.dart';
import 'package:aieraa_studies/models/user_info_model.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  // chooseImage() {
  Future<File?> chooseImage(UserController userController) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    final File? file = File(image!.path);
    _snedImage(userController, file!);
    // setState(() {});
    // Navigator.pop(context);
  }

  _loadUserInfo() async {
    // await Get.find<LocationController>().getAddressList();
    // if (Get.find<LocationController>().addressList.isNotEmpty) {
    //   var address = Get.find<LocationController>().addressList[0];
    //   await Get.find<LocationController>().saveUserAddress(address);
    print("I am in Profile page ............");
    // } else {
    //   print("addresslist is empty");
    // }
  }

  var rollController = TextEditingController();
  var yearController = TextEditingController();
  var classController = TextEditingController();
  var doaController = TextEditingController();
  var doblController = TextEditingController();
  var emailController = TextEditingController();
  var motherController = TextEditingController();
  var addressController = TextEditingController();
  var fatherController = TextEditingController();
  var phoneController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();

    if (_isLoggedIn) {
      Get.find<UserController>().getUserInfo();
      rollController.text =
          "1000" + Get.find<UserController>().userInfoModel.id.toString();
      // yearController.text = Get.find<UserController>().userInfoModel.id.toString();
      // classController.text = Get.find<UserController>().userInfoModel.id.toString();
      yearController.text = "2022";
      classController.text =
          Get.find<UserController>().userInfoModel.id.toString();
      doaController.text =
          Get.find<UserController>().userInfoModel.id.toString();
      doblController.text =
          Get.find<UserController>().userInfoModel.dob.toString();
      emailController.text =
          Get.find<UserController>().userInfoModel.email.toString();
      phoneController.text =
          Get.find<UserController>().userInfoModel.phone.toString();
      motherController.text =
          Get.find<UserController>().userInfoModel.mother_name.toString();
      addressController.text =
          Get.find<UserController>().userInfoModel.address.toString();
      fatherController.text =
          Get.find<UserController>().userInfoModel.father_name.toString();
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
        child: GetBuilder<UserController>(builder: (userController) {
          return (_isLoggedIn)
              ? (userController.isLoading == true && isLoading == false
                  ? Scaffold(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 16),
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
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Profile',
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
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: const BoxDecoration(
                                    image: const DecorationImage(
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
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 15),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  height: 127,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: 52.0,
                                                          // radius: 36,
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(AppConstants
                                                                        .UPLOADS_URL +
                                                                    userController
                                                                        .userInfoModel
                                                                        .image),
                                                            // backgroundImage: AssetImage(
                                                            //     'assets/images/profile_img.png'),
                                                            radius: 50.0,
                                                          ),
                                                        ),
                                                        // Container(
                                                        //   width: 100,
                                                        //   height: 127,
                                                        //   decoration: BoxDecoration(
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(
                                                        //                   12),
                                                        //       image: DecorationImage(
                                                        //           fit: BoxFit
                                                        //               .contain,
                                                        //           image: NetworkImage(AppConstants
                                                        //                   .UPLOADS_URL +
                                                        //               userController
                                                        //                   .userInfoModel
                                                        //                   .image))),
                                                        // ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                                userController
                                                                    .userInfoModel
                                                                    .first_name,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            const Text(
                                                                'Session 2022-23',
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xff808083),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                                'Roll no: 1000' +
                                                                    userController
                                                                        .userInfoModel
                                                                        .id
                                                                        .toString(),
                                                                style: const TextStyle(
                                                                    color: const Color(
                                                                        0xff808083),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
                                                          ],
                                                        ),
                                                        IconButton(
                                                          icon: const Icon(
                                                              Icons.camera),
                                                          onPressed: () {
                                                            chooseImage(
                                                                userController);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InputField(
                                                        headerText: "Roll No",
                                                        hintTexti: "10005",
                                                        containerSize: 2.5,
                                                        readOnly: true,
                                                        textController:
                                                            rollController),
                                                    InputField(
                                                        headerText:
                                                            "Academic Year",
                                                        hintTexti: "2022-23",
                                                        containerSize: 2.5,
                                                        readOnly: true,
                                                        textController:
                                                            yearController),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment
                                                //           .spaceBetween,
                                                //   children: [
                                                //     InputField(
                                                //         headerText: "Class",
                                                //         hintTexti: "B-Tech",
                                                //         containerSize: 2.5,
                                                //         readOnly: true,
                                                //         textController:
                                                //             classController),
                                                //     InputField(
                                                //         headerText:
                                                //             "Date Of Admission",
                                                //         hintTexti:
                                                //             "4 july 2022",
                                                //         containerSize: 2.5,
                                                //         readOnly: true,
                                                //         textController:
                                                //             doaController),
                                                //   ],
                                                // ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InputField(
                                                    headerText: "Date Of Birth",
                                                    hintTexti: "15 Aug 1999",
                                                    containerSize: 1,
                                                    readOnly: true,
                                                    textController:
                                                        doblController),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InputField(
                                                    headerText: "Email id",
                                                    hintTexti: "abc@gmail.com",
                                                    containerSize: 1,
                                                    readOnly: false,
                                                    textController:
                                                        emailController),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                        // left: 20,
                                                        // right: 20,
                                                        bottom: 10,
                                                      ),
                                                      child: const Text(
                                                        "Phone",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                        // margin: const EdgeInsets.only(left: 20, right: 20),
                                                        height: 50,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grayshade
                                                              .withOpacity(0.5),
                                                          // border: Border.all(
                                                          //   width: 1,
                                                          // ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                phoneController,
                                                            readOnly: false,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  "0123456985",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        )
                                                        //IntrinsicHeight

                                                        ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InputField(
                                                    headerText: "Mother Name",
                                                    hintTexti: "Mother's Name",
                                                    containerSize: 1,
                                                    readOnly: false,
                                                    textController:
                                                        motherController),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InputField(
                                                    headerText: "Father Name",
                                                    hintTexti: "Father's Name",
                                                    containerSize: 1,
                                                    readOnly: false,
                                                    textController:
                                                        fatherController),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InputField(
                                                    headerText: "Address",
                                                    hintTexti: "xyz.. street",
                                                    containerSize: 1,
                                                    readOnly: false,
                                                    textController:
                                                        addressController),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _register(userController);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20),
                                                    decoration: const BoxDecoration(
                                                        color: const Color(
                                                            0xFF10C8CD),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Center(
                                                      child: Text(
                                                        "CONTINUE",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: whiteshade),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                      bottomNavigationBar: MyBottomNavBar(),
                    )
                  : CustomLoader())
              // : CircularProgressIndicator())
              : const GoToSignInPage();
        }));
  }

  void _snedImage(UserController userController, File files) async {
    setState(() {
      isLoading = true;
    });
    String fileName = '';

    bool _isValid = GetPlatform.isWeb ? true : false;
    if (null != files) {
      userController
          .updateUserImage(base64Encode(files.readAsBytesSync()).toString(),
              userController.userInfoModel.id)
          .then((status) async {
        if (status.isSuccess) {
          showCustomSuccessSnackBar(status.message);
          setState(() {
            isLoading = false;
          });
          // Get.toNamed(RouteHelper.getsupportRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _register(UserController userController) async {
    String _email = emailController.text.trim();
    String _mother = motherController.text.trim();
    String _father = fatherController.text.trim();
    String _address = addressController.text.trim();
    String _phone = phoneController.text.trim();
    if (_email.isEmpty) {
      showCustomSnackBar("Type in your name", title: "Name");
    } else if (_mother.isEmpty) {
      showCustomSnackBar("Type in your Email", title: "Email");
    } else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar("Type in correct Email", title: "Email");
    } else if (_father.isEmpty) {
      showCustomSnackBar("Type in your Phone Number", title: "Phone Number");
    } else if (_address.isEmpty) {
      showCustomSnackBar("Type in your Password", title: "Password");
    } else {
      UserInfoModel userInfo = UserInfoModel(
          id: userController.userInfoModel.id,
          email: _email,
          mother_name: _mother,
          father_name: _father,
          phone: _phone,
          address: _address);
      userController.updateUser(userInfo).then((status) async {
        if (status.isSuccess) {
          // Get.offNamed(RouteHelper.getInitialRoute());
          showCustomSuccessSnackBar(status.message);
          setState(() {});
        } else {
          Get.snackbar("Wrong", "Something went wrong");
        }
      });
    }
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
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
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
                            style: const TextStyle(
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

class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  double containerSize;
  bool readOnly;
  TextEditingController textController;
  InputField(
      {Key? key,
      required this.headerText,
      required this.hintTexti,
      required this.containerSize,
      required this.readOnly,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            // left: 20,
            // right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            // margin: const EdgeInsets.only(left: 20, right: 20),
            height: 50,
            width: MediaQuery.of(context).size.width / containerSize,
            decoration: BoxDecoration(
              color: grayshade.withOpacity(0.5),
              // border: Border.all(
              //   width: 1,
              // ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: textController,
                readOnly: readOnly,
                decoration: InputDecoration(
                  hintText: hintTexti,
                  border: InputBorder.none,
                ),
              ),
            )
            //IntrinsicHeight

            ),
      ],
    );
  }
}
