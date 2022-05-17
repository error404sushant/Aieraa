import 'package:aieraa_studies/constants.dart';
import 'package:aieraa_studies/screens/course/course.dart';
import 'package:aieraa_studies/screens/gallry/gallry.dart';
import 'package:aieraa_studies/screens/home/homeDashboard.dart';
import 'package:aieraa_studies/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _kIndex = 0;
  bool is_active = false;
  String active_grid = "";

  // const MyBottomNavBar({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: active_grid == "home" ? Color(0xff8cc0ef) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kPrimaryColor.withOpacity(0.38),
                ),
              ],
            ),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/ic_home.svg"),
              onPressed: () {
                setState(() {
                  active_grid = "home";
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => homeDashboard()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color:
                  active_grid == "gallery" ? Color(0xff8cc0ef) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kPrimaryColor.withOpacity(0.38),
                ),
              ],
            ),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/ic_gallery_ico.svg"),
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  active_grid = "gallery";
                });
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Gallry()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: active_grid == "play" ? Color(0xff8cc0ef) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kPrimaryColor.withOpacity(0.38),
                ),
              ],
            ),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/ic_play.svg"),
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  active_grid = "play";
                });

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Course()));
              },
            ),
          ),
          // IconButton(
          //   icon: SvgPicture.asset("assets/icons/ic_user-square.svg"),
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //         context, MaterialPageRoute(builder: (context) => profile()));
          //   },
          // ),
          Container(
            decoration: BoxDecoration(
              color:
                  active_grid == "setting" ? Color(0xff8cc0ef) : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kPrimaryColor.withOpacity(0.38),
                ),
              ],
            ),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/ic_setting.svg"),
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  active_grid = "setting";
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
