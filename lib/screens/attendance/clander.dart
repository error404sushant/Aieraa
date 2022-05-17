import 'dart:async';
import 'dart:io';

import 'package:aieraa_studies/base/custom_loader.dart';
import 'package:aieraa_studies/base/custom_snackbar.dart';
import 'package:aieraa_studies/base/go_to_sign_in_page.dart';
import 'package:aieraa_studies/controllers/attendance_controller.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/screens/attendance/open_pdf.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:table_calendar/table_calendar.dart';

// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  _loadUserInfo() async {
    // await Get.find<LocationController>().getAddressList();
    // if (Get.find<LocationController>().addressList.isNotEmpty) {
    //   var address = Get.find<LocationController>().addressList[0];
    //   await Get.find<LocationController>().saveUserAddress(address);
    print("I am in ATTENDANCE page ............");
    // } else {
    //   print("addresslist is empty");
    // }
  }

  // final controller = PdfViewerController();
  var _tabTextIconIndexSelected = 0;
  var _listGenderText = ["Fee Due", "History"];
  bool _isloading = false;
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().isLoggedIn();
    if (_isLoggedIn) {
      Get.find<AttendanceController>().getAttendance();
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
          body:
              GetBuilder<AttendanceController>(builder: (attendanceController) {
            return (_isLoggedIn)
                ? ((attendanceController.isLoading == true ||
                        _isloading == false)
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
                                          'Attendance',
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
                                    decoration: BoxDecoration(
                                        color: whiteshade,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45))),
                                    child: Padding(
                                        // padding: const EdgeInsets.only(left: 20, top: 30),
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TableCalendar(
                                              focusedDay: selectedDay,
                                              firstDay: DateTime(1990),
                                              lastDay: DateTime(2050),
                                              calendarFormat: format,
                                              onFormatChanged:
                                                  (CalendarFormat _format) {
                                                setState(() {
                                                  format = _format;
                                                });
                                              },
                                              startingDayOfWeek:
                                                  StartingDayOfWeek.sunday,
                                              daysOfWeekVisible: true,

                                              //Day Changed
                                              onDaySelected:
                                                  (DateTime selectDay,
                                                      DateTime focusDay) {
                                                setState(() {
                                                  selectedDay = selectDay;
                                                  focusedDay = focusDay;
                                                });
                                                _open_pdf(
                                                    context,
                                                    attendanceController,
                                                    focusedDay);
                                                print(focusedDay);
                                              },
                                              selectedDayPredicate:
                                                  (DateTime date) {
                                                return isSameDay(
                                                    selectedDay, date);
                                              },

                                              // eventLoader: _getEventsfromDay,

                                              //To style the Calendar
                                              calendarStyle: CalendarStyle(
                                                isTodayHighlighted: true,
                                                selectedDecoration:
                                                    BoxDecoration(
                                                  color: Colors.blue,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                selectedTextStyle: TextStyle(
                                                    color: Colors.white),
                                                todayDecoration: BoxDecoration(
                                                  color: Colors.purpleAccent,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                defaultDecoration:
                                                    BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                weekendDecoration:
                                                    BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                              headerStyle: HeaderStyle(
                                                formatButtonVisible: true,
                                                titleCentered: true,
                                                formatButtonShowsNext: false,
                                                formatButtonDecoration:
                                                    BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                formatButtonTextStyle:
                                                    TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10)
                                          ],
                                        )),
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

  Future<void> _open_pdf(BuildContext context,
      AttendanceController attendanceController, DateTime date) async {
    setState(() {
      _isloading = true;
    });

    DateTime _date = date;
    attendanceController.getPdf(_date).then((status) async {
      if (status.isSuccess) {
        setState(() {
          _isloading = false;
        });
        // if(attendanceController.calenderList.length > 0){
        _showPdfOpt(context, attendanceController.calenderList);
        // }
        // Get.toNamed(RouteHelper.getInitialRoute());
      } else {
        showCustomSnackBar(status.message);
      }
    });

    // final url =
    //     'https://www.ece.uvic.ca/~itraore/elec567-13/notes/dist-03-4.pdf';
    // final file = await loadNetwork(url);
    // setState(() {
    //   _isloading = false;
    // });
    // openPDF(context, file);
    // Get.toNamed(RouteHelper.getpdfshowRoute(file));
  }

  void _showPdfOpt(context, calenderlist) {
    int _numbers = 0;
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
                            child: calenderlist.length > 0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 10),
                                        itemCount: calenderlist.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  _isloading = true;
                                                });
                                                final file = await loadNetwork(
                                                    AppConstants.UPLOADS_URL +
                                                        calenderlist[index]
                                                            .path_url);
                                                setState(() {
                                                  _isloading = false;
                                                });
                                                _numbers = index + 1;
                                                openPDF(context, file);
                                                // Get.toNamed(RouteHelper
                                                //     .getgallryGridshowRoute(
                                                //     galleryController
                                                //         .categoryList[
                                                //     index]
                                                //         .id));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    // Text('$_numbers ,'),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff9c9da8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                  calenderlist[
                                                                          index]
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      ),
                                    ],
                                  )
                                : Text("No Data Found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PdfShow(files: file)),
      );
  Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

class MenuCard extends StatelessWidget {
  String menuName;
  String qty;
  Color bgcolor;
  MenuCard(
      {Key? key,
      required this.menuName,
      required this.bgcolor,
      required this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(menuName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(qty,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
