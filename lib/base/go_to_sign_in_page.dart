import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:aieraa_studies/uitls/app_dimensions.dart';
import 'package:aieraa_studies/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoToSignInPage extends StatelessWidget {
  const GoToSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Dimensions.screenSizeWidth,
      height: Dimensions.screenSizeHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/signintocontinue.png"),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getloginRoute());
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color(0xff1A7ED0),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Sign in here! ",
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
