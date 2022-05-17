import 'package:aieraa_studies/base/custom_loaderlogin.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/constants.dart';
import 'package:aieraa_studies/forgot_password.dart';
import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import 'controllers/auth_controller.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double topMar = MediaQuery.of(context).size.height * 0.30;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/aieraa_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 80),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 200,
                                  padding: EdgeInsets.only(left: 35, top: 250),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/aieraa_logo_forbg.png')),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 172,
                                  width: 150,
                                  padding: EdgeInsets.only(left: 10, top: 250),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/Doctorbg.png')),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(children: [
                        SingleChildScrollView(
                          // top: MediaQuery.of(context).size.height * 0.20,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            // height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            // padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            margin: EdgeInsets.only(top: topMar),
                            // margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
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
                                  Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    // margin: EdgeInsets.only(
                                    // left: MediaQuery.of(context).size.width * 0.09),
                                    // child: Image.asset("assets/images/login.png"),
                                    // padding: EdgeInsets.only(left: 20, top: 30),
                                    // padding: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'Welcome to',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Aieraa overseas to learn ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'something new',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // InputField(
                                  //     headerText: "Username",
                                  //     hintTexti: "Username"),
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
                                            color: grayshade.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: TextField(
                                              controller: _phoneController,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 1),
                                              decoration: InputDecoration(
                                                // contentPadding:
                                                //     EdgeInsets.only(bottom: .1),
                                                prefixIcon: Icon(
                                                    Icons.supervisor_account),
                                                hintText: 'Username',
                                                border: InputBorder.none,
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
                                  // InputFieldPassword(
                                  //     headerText: "Password",
                                  //     hintTexti: "At least 8 Charecter"),
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
                                          color: grayshade.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextField(
                                            controller: _passwordController,
                                            obscureText: _visible,
                                            textAlignVertical:
                                                TextAlignVertical(y: 1),
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.lock),
                                                hintText: 'Password',
                                                border: InputBorder.none,
                                                suffixIcon: IconButton(
                                                    icon: Icon(_visible
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: () {
                                                      setState(() {
                                                        _visible = !_visible;
                                                      });
                                                    })),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CheckerBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _login(authController);
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             homeDashboard()));
                                      // Navigator.pushNamed(context, '/home');
                                      print("Sign in Clicked");
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF10C8CD),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          "CONTINUE",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: whiteshade),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                    child: Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text: "Forgot password",
                                            style: TextStyle(
                                                color: blue, fontSize: 16),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            forgotPassword()));
                                                print("forgot Password");
                                              }),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                )
              : CustomLoaderLogin();
        }),
      ),
    );
  }

  void _login(AuthController authController) async {
    String _phone = _phoneController.text.trim();
    String _password = _passwordController.text.trim();

    bool _isValid = GetPlatform.isWeb ? true : false;

    if (_phone.isEmpty) {
      Get.snackbar("UserName", "Type in your Username");
    } else if (_password.isEmpty) {
      Get.snackbar("Password", "Type in your password");
    } else if (_password.length < 7) {
      Get.snackbar("Password", "More than 7");
    } else {
      authController.login(_phone, _password).then((status) async {
        if (status.isSuccess) {
          authController.saveUserNumberAndPassword(_phone, _password);
          String _token = status.message.substring(1, status.message.length);

          Get.toNamed(RouteHelper.getSplashRoute());
          // Get.toNamed(RouteHelper.getInitialRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              // OutlinedBorder:shape,
              value: isCheck,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              checkColor: whiteshade, // color of tick Mark
              activeColor: blue,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "Remember me",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  String hintTexti;
  InputField({Key? key, required this.headerText, required this.hintTexti})
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
                  prefixIcon: Icon(Icons.email),
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

class TopSginin extends StatelessWidget {
  const TopSginin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_sharp,
            color: whiteshade,
            size: 40,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Sign In",
            style: TextStyle(color: whiteshade, fontSize: 25),
          )
        ],
      ),
    );
  }
}
