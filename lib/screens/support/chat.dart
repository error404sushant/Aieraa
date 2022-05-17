import 'dart:async';

import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/support_controller.dart';
import 'package:aieraa_studies/screens/support/chat_image_details.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ChatDetails extends StatefulWidget {
  int pageId;
  int msgId;
  String page;

  ChatDetails(
      {Key? key, required this.pageId, required this.msgId, required this.page})
      : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  var _msgController = TextEditingController();
  var _timer;
  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(Duration(seconds: 10), (Timer t) => setState(() {}));
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // new Timer.periodic(threeSecond, (Timer t) => setState((){}));
  _loadUserInfo() async {
    print("I am in Chat page ............");
  }

  Future<void> _loadResources(bool reload) async {
    // await Get.find<PopularProduct>().getPopularProductList(reload);
    // if(Get.find<AuthController>().isLoggedIn()) {
    //   await Get.find<UserController>().getUserInfo();
    //
    // }
  }
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    var msgController = TextEditingController();
    if (_isLoggedIn) {
      _loadResources(true);
      Get.find<SupportController>().getChats(widget.msgId);
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
            child: GetBuilder<SupportController>(
              builder: (supportController) {
                return (_isLoggedIn)
                    ? (supportController.isLoading == false
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
                                            'Chat',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
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
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: whiteshade,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(45),
                                                    topRight:
                                                        Radius.circular(45))),
                                        // child: ChatBox(),
                                        child: Stack(
                                          children: <Widget>[
                                            ListView.builder(
                                              itemCount: supportController
                                                  .chatLists.length,
                                              padding: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              controller: _controller,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      left: 16,
                                                      right: 16,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment: (supportController
                                                                    .chatLists[
                                                                        index]
                                                                    .user_id ==
                                                                "1"
                                                            ? Alignment.topLeft
                                                            : Alignment
                                                                .topRight),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      supportController.chatLists[index].user_id ==
                                                                              "1"
                                                                          ? 0
                                                                          : 20),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      supportController.chatLists[index].user_id ==
                                                                              "1"
                                                                          ? 20
                                                                          : 0),
                                                            ),
                                                            color: (supportController
                                                                        .chatLists[
                                                                            index]
                                                                        .user_id ==
                                                                    "1"
                                                                ? Colors.grey
                                                                    .shade200
                                                                : Colors
                                                                    .blue[200]),
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          child: Text(
                                                            supportController
                                                                .chatLists[
                                                                    index]
                                                                .message,
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      supportController
                                                                  .chatLists[
                                                                      index]
                                                                  .attachment !=
                                                              ''
                                                          ? Align(
                                                              alignment: (supportController
                                                                          .chatLists[
                                                                              index]
                                                                          .user_id ==
                                                                      "1"
                                                                  ? Alignment
                                                                      .topLeft
                                                                  : Alignment
                                                                      .topRight),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              ChatDetailsPage(
                                                                        index:
                                                                            index,
                                                                        imagePath:
                                                                            AppConstants.UPLOADS_URL +
                                                                                supportController.chatLists[index].attachment,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      'logo$index',
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(20),
                                                                        topRight:
                                                                            Radius.circular(20),
                                                                        bottomLeft: Radius.circular(supportController.chatLists[index].user_id ==
                                                                                "1"
                                                                            ? 0
                                                                            : 20),
                                                                        bottomRight: Radius.circular(supportController.chatLists[index].user_id ==
                                                                                "1"
                                                                            ? 20
                                                                            : 0),
                                                                      ),
                                                                      color: (supportController.chatLists[index].user_id ==
                                                                              "1"
                                                                          ? Colors
                                                                              .grey
                                                                              .shade200
                                                                          : Colors
                                                                              .blue[200]),
                                                                    ),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            16),
                                                                    child: Image
                                                                        .network(
                                                                      AppConstants
                                                                              .UPLOADS_URL +
                                                                          supportController
                                                                              .chatLists[index]
                                                                              .attachment,
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : SizedBox(
                                                              height: 1,
                                                            ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 10, top: 10),
                                    height: 60,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: widget.page == 'pending'
                                        ? Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  controller: _msgController,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Write message...",
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.black54),
                                                      border: InputBorder.none),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              FloatingActionButton(
                                                onPressed: () {
                                                  _snedText(supportController);
                                                },
                                                child: Icon(
                                                  Icons.send,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                backgroundColor: Colors.blue,
                                                elevation: 0,
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: const Text(
                                                'Your Ticket has been Rsolved',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                  ),
                                ),
                              ]),
                            ],
                          )
                        : CircularProgressIndicator())
                    : GoToSignInPage();
              },
            ),
          ),
          // bottomNavigationBar: MyBottomNavBar(),
        ));
  }

  void _snedText(SupportController supportController) async {
    String _msg = _msgController.text.trim();
    int _message_id = widget.msgId;

    bool _isValid = GetPlatform.isWeb ? true : false;

    if (_msg.isEmpty) {
      Get.snackbar("Message", "Type in your Mesaage");
    } else {
      supportController.setChat(_msg, _message_id).then((status) async {
        if (status.isSuccess) {
          setState(() {
            _msgController.clear();
          });
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}

// import 'package:aieraa_studies/screens/support/chat_box.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ChatDetails extends StatefulWidget {
//   const ChatDetails({Key? key}) : super(key: key);
//
//   @override
//   State<ChatDetails> createState() => _ChatDetailsState();
// }
//
// class _ChatDetailsState extends State<ChatDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           flexibleSpace: SafeArea(
//             child: Container(
//               padding: EdgeInsets.only(right: 16),
//               child: Row(
//                 children: <Widget>[
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 2,
//                   ),
//                   CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         "<https://randomuser.me/api/portraits/men/5.jpg>"),
//                     maxRadius: 20,
//                   ),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "Kriss Benwat",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 6,
//                         ),
//                         Text(
//                           "Online",
//                           style: TextStyle(
//                               color: Colors.grey.shade600, fontSize: 13),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(
//                     Icons.settings,
//                     color: Colors.black54,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: ChatBox());
//   }
// }

// Stack(
// children: <Widget>[
// ListView.builder(
// itemCount: messages.length,
// shrinkWrap: true,
// padding: EdgeInsets.only(top: 10, bottom: 10),
// physics: NeverScrollableScrollPhysics(),
// itemBuilder: (context, index) {
// return Container(
// padding:
// EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
// child: Align(
// alignment: (messages[index].messageType == "receiver"
// ? Alignment.topLeft
//     : Alignment.topRight),
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20),
// topRight: Radius.circular(20),
// bottomLeft: Radius.circular(
// messages[index].messageType == "receiver" ? 0 : 20),
// bottomRight: Radius.circular(
// messages[index].messageType == "receiver" ? 20 : 0),
// ),
// color: (messages[index].messageType == "receiver"
// ? Colors.grey.shade200
//     : Colors.blue[200]),
// ),
// padding: EdgeInsets.all(16),
// child: Text(
// messages[index].messageContent,
// style: TextStyle(fontSize: 15),
// ),
// ),
// ),
// );
// },
// ),
// ],
// ),
