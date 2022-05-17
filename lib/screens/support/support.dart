import 'dart:convert';
import 'dart:io';

import 'package:aieraa_studies/base/custom_Succsnackbar.dart';
import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/support_controller.dart';
import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  late File _file = File('');
  String status = '';
  late String base64Image;
  // late XFile tmpFile;
  String error = 'Error';

  final ImagePicker _picker = ImagePicker();

  // chooseImage() {
  Future<File?> chooseImage(SupportController supportController) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    final File? file = File(image!.path);
    _snedText(supportController, file!);
    description.text = '';
    subject.text = '';
    Navigator.pop(context);
    // print(file);
    // return file;
  }

  String dropdownvalue = 'Hostel';
  var regards = TextEditingController();
  var subject = TextEditingController();
  var description = TextEditingController();
  var items = ['Hostel', 'Mess', 'Academic', 'Payment', 'App', 'Other'];
  _loadUserInfo() async {
    print("I am in support page ............");
  }

  Future<void> _loadResources(bool reload) async {
    Get.find<SupportController>().getSupports();
  }

  var _tabTextIconIndexSelected = 0;
  var _listGenderText = ["Fee Due", "History"];
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      _loadResources(true);
      Get.find<SupportController>().getSupports();
      // Get.find<PopularProduct>().getUserInfo(reload);
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
                                print("pooed out ");
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Support',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                GetBuilder<SupportController>(
                  builder: (supportController) {
                    return (_isLoggedIn)
                        ? (supportController.isLoading == false
                            ? Stack(children: [
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
                                                1.5,
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
                                        child: Padding(
                                          // padding: const EdgeInsets.only(left: 20, top: 30),
                                          padding: const EdgeInsets.all(15),
                                          child: ListView.separated(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext, index) {
                                              return ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(AppConstants
                                                                .UPLOADS_URL +
                                                            supportController
                                                                .tokenList[
                                                                    index]
                                                                .userphoto),
                                                    // backgroundImage: AssetImage(
                                                    //     'assets/images/profile_img.png'),
                                                    maxRadius: 30,
                                                  ),
                                                  title: Text(
                                                    supportController
                                                        .tokenList[index]
                                                        .subject,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  subtitle: Text(
                                                      supportController
                                                          .tokenList[index]
                                                          .description,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color:
                                                              Color(0xff1A7ED0),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  trailing: Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: supportController
                                                                    .tokenList[
                                                                        index]
                                                                    .status ==
                                                                'pending'
                                                            ? Colors.green
                                                            : Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Text(
                                                      supportController
                                                                  .tokenList[
                                                                      index]
                                                                  .status ==
                                                              'pending'
                                                          ? 'Active'
                                                          : 'Resolved',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Get.toNamed(RouteHelper
                                                        .getchatRoute(
                                                            index,
                                                            supportController
                                                                .tokenList[
                                                                    index]
                                                                .id,
                                                            supportController
                                                                .tokenList[
                                                                    index]
                                                                .status));
                                                  });
                                            },
                                            separatorBuilder:
                                                (BuildContext, index) {
                                              return Divider(height: 1);
                                            },
                                            itemCount: supportController
                                                .tokenList.length,
                                            padding: EdgeInsets.all(5),
                                            scrollDirection: Axis.vertical,
                                            // physics:
                                            //     AlwaysScrollableScrollPhysics(),
                                            controller: _controller,
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  padding: new EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .80,
                                      left: MediaQuery.of(context).size.width *
                                          .80,
                                      right: 20.0),
                                  child: new Container(
                                    width: 60,
                                    height: 60,
                                    child: InkWell(
                                      onTap: () {
                                        _sendQueryModalBottomSheet(
                                            context, supportController);
                                      },
                                      child: Container(
                                        // margin: const EdgeInsets.only(left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF10C8CD),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30))),
                                        child: Center(
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ])
                            : CustomLoader())
                        // : CircularProgressIndicator())
                        : GoToSignInPage();
                  },
                ),
              ],
            ),
          ),
          // bottomNavigationBar: MyBottomNavBar(),
        ));
  }

  void _sendQueryModalBottomSheet(context, supportController) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .80,
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
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Your Query',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          // foregotPassVerificationScreen("321654"),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: grayshade.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DropdownButton(
                                isExpanded: true,
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: grayshade.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                  controller: subject,
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Subject',
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                              //IntrinsicHeight

                              ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 100,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: grayshade.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                  controller: description,
                                  expands: true,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                              //IntrinsicHeight

                              ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: grayshade.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: RaisedButton(
                                child: Text(
                                  'Upload Image',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                color: Colors.blue,
                                onPressed: () {
                                  chooseImage(supportController);
                                  // uploadImg();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _snedTextwithout_file(supportController);
                              // uploadImg();
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => generatePassword()));

                              description.text = '';
                              subject.text = '';
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Color(0xFF10C8CD),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: whiteshade),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _snedText(SupportController supportController, File files) async {
    String _msg = description.text.trim();
    String _regard = dropdownvalue.trim();
    String _subject = subject.text;

    String fileName = '';

    bool _isValid = GetPlatform.isWeb ? true : false;
    if (null != files) {
      print("_file");
      print(base64Encode(files.readAsBytesSync()).toString());
    }
    if (_msg.isEmpty) {
      Get.snackbar("Message", "Type in your Mesaage");
    } else if (_subject.isEmpty) {
      Get.snackbar("Subject", "Type in your Subject");
    } else {
      supportController
          .setTicket(_msg, _regard, _subject,
              base64Encode(files.readAsBytesSync()).toString())
          .then((status) async {
        if (status.isSuccess) {
          showCustomSuccessSnackBar(status.message);
          setState(() {});
          // Get.toNamed(RouteHelper.getsupportRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _snedTextwithout_file(SupportController supportController) async {
    String _msg = description.text.trim();
    String _regard = dropdownvalue.trim();
    String _subject = subject.text;

    String fileName = '';

    bool _isValid = GetPlatform.isWeb ? true : false;
    if (_msg.isEmpty) {
      Get.snackbar("Message", "Type in your Mesaage");
    } else if (_subject.isEmpty) {
      Get.snackbar("Subject", "Type in your Subject");
    } else {
      supportController
          .setTicket(_msg, _regard, _subject, "")
          .then((status) async {
        if (status.isSuccess) {
          showCustomSuccessSnackBar(status.message);
          setState(() {});
          // Get.toNamed(RouteHelper.getsupportRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}
