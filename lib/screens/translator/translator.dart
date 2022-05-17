import 'package:aieraa_studies/components/my_bottom_nav_bar.dart';
import 'package:aieraa_studies/uitls/translator_language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translator/translator.dart';

import '../../constants.dart';

class Translator extends StatefulWidget {
  const Translator({Key? key}) : super(key: key);

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  String dropdownvalue = 'en';
  String todropdownvalue = 'vi';
  var _fromController = TextEditingController();
  var _toController = TextEditingController();
  String selectedText = 'hello';
  var translated;
  final translator = GoogleTranslator();
  bool _visible = true;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
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
                              'Translation',
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
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,

                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: DropdownButton(
                                          dropdownColor: Colors.black,
                                          value: dropdownvalue,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          ),
                                          items: Translations.languages
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value:
                                                  Translations.getLanguageCode(
                                                      items),
                                              child: Text(items,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                            child: IconButton(
                                          color: Colors.white,
                                          icon: SvgPicture.asset(
                                              "assets/icons/ic_switch.svg"),
                                          onPressed: () {
                                            String _dropdownvalue =
                                                dropdownvalue;
                                            setState(() {
                                              dropdownvalue = todropdownvalue;
                                              todropdownvalue = _dropdownvalue;
                                            });
                                            // Navigator.pop(context);
                                          },
                                        )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: DropdownButton(
                                          dropdownColor: Colors.black,
                                          value: todropdownvalue,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          ),
                                          items: Translations.languages
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value:
                                                  Translations.getLanguageCode(
                                                      items),
                                              child: Text(items,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              todropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ), // Container
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color:
                                              lightblueshadebg.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: TextField(
                                                expands: true,
                                                maxLines: null,
                                                controller: _fromController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                                onChanged: (text) async {
                                                  setState(() {
                                                    selectedText =
                                                        text.toString();
                                                  });
                                                  var trans = await translator
                                                      .translate(text,
                                                          from: dropdownvalue,
                                                          to: todropdownvalue);
                                                  print(trans.text);
                                                  setState(() {
                                                    _toController.text =
                                                        trans.text;
                                                  });
                                                  // const apiKey =
                                                  //     'AIzaSyDcluvgowETwX4QHYJJh8IGBJaG20jQ-v4';
                                                  // const to = 'es';
                                                  // final url = Uri.parse(
                                                  //   'https://translation.googleapis.com/language/translate/v2?q=$text&target=$to&key=$apiKey',
                                                  // );
                                                  // final response =
                                                  //     await http.post(url);
                                                  // final translation =
                                                  //     await text.translate(
                                                  //   from: 'auto', // English
                                                  //   to: 'en', // Spanish
                                                  // );
                                                  // if (response.statusCode ==
                                                  //     200) {
                                                  //   final body = json
                                                  //       .decode(response.body);
                                                  //   final translations =
                                                  //       body['data']
                                                  //               ['translations']
                                                  //           as List;
                                                  //   final translation =
                                                  //       HtmlUnescape().convert(
                                                  //     translations.first[
                                                  //         'translatedText'],
                                                  //   );
                                                  //   print(translation);
                                                  //   setState(() {
                                                  //     translated = translation;
                                                  //   });
                                                  //   _toController.text =
                                                  //       translation;
                                                  // }
                                                }),
                                          ),
                                        )
                                        //IntrinsicHeight

                                        ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color:
                                              lightblueshadebg.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: TextField(
                                              expands: true,
                                              maxLines: null,
                                              controller: _toController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
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
                                // InkWell(
                                //   onTap: () {
                                //     // _login(authController);
                                //     // Navigator.pushReplacement(
                                //     //     context,
                                //     //     MaterialPageRoute(
                                //     //         builder: (context) =>
                                //     //             homeDashboard()));
                                //     // Navigator.pushNamed(context, '/home');
                                //     print("Translate");
                                //   },
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height: MediaQuery.of(context).size.height *
                                //         0.07,
                                //     margin: const EdgeInsets.only(
                                //         left: 20, right: 20),
                                //     decoration: BoxDecoration(
                                //         color: Color(0xFF10C8CD),
                                //         borderRadius: const BorderRadius.all(
                                //             Radius.circular(10))),
                                //     child: Center(
                                //       child: Text(
                                //         "Translate",
                                //         style: TextStyle(
                                //             fontSize: 24,
                                //             fontWeight: FontWeight.w500,
                                //             color: whiteshade),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }
}
