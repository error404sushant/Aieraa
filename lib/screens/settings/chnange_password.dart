import 'package:aieraa_studies/base/custom_Succsnackbar.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/constants.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/user_controller.dart';
import 'package:aieraa_studies/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  var _currentPassController = TextEditingController();
  var _passwordOneController = TextEditingController();
  var _passwordTwoController = TextEditingController();
  bool _visible = true;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<UserController>().getUserInfo();
      // Get.find<LocationController>().getAddressList();
    } else {
      print("empty" + _isLoggedIn.toString());
    }
    return GetBuilder<UserController>(builder: (userController) {
      return (_isLoggedIn)
          ? (userController.isLoading == true
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/aieraa_bg.png'),
                        fit: BoxFit.cover),
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
                                        'Change Password',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic),
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              decoration: BoxDecoration(
                                                color:
                                                    grayshade.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: TextField(
                                                  controller:
                                                      _currentPassController,
                                                  obscureText: _visible,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.lock),
                                                      hintText:
                                                          'Current Cassword',
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                          icon: Icon(_visible
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off),
                                                          onPressed: () {
                                                            setState(() {
                                                              _visible =
                                                                  !_visible;
                                                            });
                                                          })),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // InputFieldPass(
                                        //     headerText: "Password",
                                        //     hintTexti: "curren password "),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              decoration: BoxDecoration(
                                                color:
                                                    grayshade.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: TextField(
                                                  controller:
                                                      _passwordOneController,
                                                  obscureText: _visible,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.lock),
                                                      hintText: 'New Password',
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                          icon: Icon(_visible
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off),
                                                          onPressed: () {
                                                            setState(() {
                                                              _visible =
                                                                  !_visible;
                                                            });
                                                          })),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // InputFieldPass(
                                        //     headerText: "Password",
                                        //     hintTexti: "new password "),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 10,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              decoration: BoxDecoration(
                                                color:
                                                    grayshade.withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: TextField(
                                                  controller:
                                                      _passwordTwoController,
                                                  obscureText: _visible,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.lock),
                                                      hintText:
                                                          're-confirm password',
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                          icon: Icon(_visible
                                                              ? Icons.visibility
                                                              : Icons
                                                                  .visibility_off),
                                                          onPressed: () {
                                                            setState(() {
                                                              _visible =
                                                                  !_visible;
                                                            });
                                                          })),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        // InputFieldPass(
                                        //     headerText: "Password",
                                        //     hintTexti: "re-confirm password"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _updatePass(userController);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF10C8CD),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Center(
                                              child: Text(
                                                "Change password",
                                                style: TextStyle(
                                                    fontSize: 24,
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
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    // bottomNavigationBar: MyBottomNavBar(),
                  ))
              : CustomLoader())
          // : CircularProgressIndicator())
          : GoToSignInPage();
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/ic_back.svg"),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyLogin()));
        },
      ),
    );
  }

  void _updatePass(UserController userController) async {
    // setState(() {
    //   _loading = true;
    // });
    String _currentPassword = _currentPassController.text.trim();
    String _onePassword = _passwordOneController.text.trim();
    String _twoPassword = _passwordTwoController.text.trim();
    String _userId = userController.userInfoModel.email;

    bool _isValid = GetPlatform.isWeb ? true : false;

    if (_currentPassword.isEmpty) {
      Get.snackbar("Current Password", "Type in your Username");
    } else if (_onePassword.isEmpty) {
      Get.snackbar("Password", "Type in your password");
    } else if (_twoPassword.isEmpty) {
      Get.snackbar("Password", "Type in your password");
    } else if (_onePassword.length < 7) {
      Get.snackbar("Password", "More than 7 character");
    } else {
      userController
          .resetcurrentpass(_currentPassword, _twoPassword, _userId)
          .then((status) async {
        if (status.isSuccess) {
          setState(() {
            _loading = false;
          });
          showCustomSuccessSnackBar(status.message);
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context);
          });
        } else {
          setState(() {
            _loading = false;
          });
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}

class InputFieldPass extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputFieldPass({Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          // child: Text(
          //   headerText,
          //   style: const TextStyle(
          //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          // ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
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
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
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

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          // child: Text(
          //   widget.headerText,
          //   style: const TextStyle(
          //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          // ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
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
              obscureText: _visible,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}
