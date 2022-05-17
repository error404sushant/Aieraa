import 'package:aieraa_studies/controllers/event_controller.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatelessWidget {
  int pageId;
  String page;
  String route;

  EventDetails(
      {Key? key, required this.pageId, required this.page, required this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var productItem = Get.find<EventController>().popularProductList[pageId];
    // DateTime parseDate =
    //     DateFormat("yyyy-MM-dd HH:mm:ss").parse(productItem.created_at);
    // var inputDate = DateTime.parse(parseDate.toString());
    // var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
    var outputDate = _TiemFormate(productItem.created_at);
    String imagPath = AppConstants.UPLOADS_URL + productItem.photo;
    // var outputDate = outputFormat.format(inputDate);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // image: NetworkImage(AppConstants
                      //     .UPLOADS_URL +productItem.photo),
                      image: NetworkImage(imagPath),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              left: 15,
              top: 15, //+ MediaQuery.of(context).padding.top
              child: Container(
                child: Row(
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
                                print("pooed out ");
                                Navigator.pop(context);
                              },
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
                            image: AssetImage('assets/icons/back_arrow.svg')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: Offset(0, -4),
                          blurRadius: 8)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 40, right: 20, bottom: 10),
                  // padding: const EdgeInsets.all(15),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              outputDate,
                              style: TextStyle(
                                color: Color(0x950C4778),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              productItem.title,
                              maxLines: 10,
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
                              productItem.description,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _TiemFormate(time) {
    var str = "2019-04-05T14:00:51.000Z";
    var newStr = time.substring(0, 10) + ' ' + time.substring(11, 23);
    print(newStr); // 2019-04-05 14:00:51.000
    DateTime dt = DateTime.parse(newStr);
    print(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt));
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);
  }
}
