import 'dart:io';

import 'package:aieraa_studies/components/bottom_stack.dart';
import 'package:aieraa_studies/forgot_password.dart';
import 'package:aieraa_studies/generate_password.dart';
import 'package:aieraa_studies/login.dart';
import 'package:aieraa_studies/register.dart';
import 'package:aieraa_studies/screens/attendance/attendance.dart';
import 'package:aieraa_studies/screens/attendance/clander.dart';
import 'package:aieraa_studies/screens/attendance/open_pdf.dart';
import 'package:aieraa_studies/screens/course/course.dart';
import 'package:aieraa_studies/screens/course/course_description.dart';
import 'package:aieraa_studies/screens/event/event.dart';
import 'package:aieraa_studies/screens/event/event_details.dart';
import 'package:aieraa_studies/screens/fees/fees.dart';
import 'package:aieraa_studies/screens/gallry/gallry.dart';
import 'package:aieraa_studies/screens/gallry/gallry_grid.dart';
import 'package:aieraa_studies/screens/home/homeDashboard.dart';
import 'package:aieraa_studies/screens/job/part_time_job.dart';
import 'package:aieraa_studies/screens/profile/profile.dart';
import 'package:aieraa_studies/screens/result/exam_result.dart';
import 'package:aieraa_studies/screens/settings/about_us.dart';
import 'package:aieraa_studies/screens/settings/chnange_password.dart';
import 'package:aieraa_studies/screens/settings/settings.dart';
import 'package:aieraa_studies/screens/support/chat.dart';
import 'package:aieraa_studies/screens/support/support.dart';
import 'package:aieraa_studies/screens/translator/translator.dart';
import 'package:get/get.dart';
// import '../screens/checkout/order_successful_page.dart';
// import '../screens/checkout/payment_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgetPass = '/forgetPass';
  static const String verifyPass = '/verifyPass';
  static const String generatePass = '/generatePass';
  static const String fees = '/fees';
  static const String exam_result = '/exam_result';
  static const String event = '/event';
  static const String event_details = '/event_details';
  static const String gallry = '/gallry';
  static const String part_time_job = '/part_time_job';
  static const String settings = '/settings';
  static const String chnange_password = '/chnange_password';
  static const String about_us = '/about_us';
  static const String profile = '/profile';
  static const String course = '/course';
  static const String course_description = '/course_description';
  static const String translator = '/translator';
  static const String support = '/support';
  static const String chat = '/chat';
  static const String attendance = '/attendance';
  static const String pdfshow = '/pdfshow';
  static const String gallryGridshow = '/gallryGridshow';
  static const String calender = '/calender';

  // static String getPickMapRoute(String page, bool canRoute) =>
  //     '$pickMap?page=$page&route=${canRoute.toString()}';

  static String getSplashRoute() => '$splash';
  static String getInitialRoute() => '$initial';
  // static String getSignUpRoute() => '$signUp';
  static String getregisterRoute() => '$register';
  static String getloginRoute() => '$login';
  static String gethomeRoute() => '$home';
  static String getforgetPassRoute() => '$forgetPass';
  static String getverifyPassRoute() => '$verifyPass';
  static String getgeneratePassRoute(String email) =>
      '$generatePass?email=$email';
  static String getfeesRoute() => '$fees';
  static String getexam_resultRoute() => '$exam_result';
  static String geteventRoute() => '$event';
  static String getattendanceRoute() => '$attendance';
  static String getevent_detailsRoute(int pageId, String page, String route) =>
      '$event_details?id=$pageId&page=$page&route=$route';
  // static String getevent_detailsRoute() => '$event_details';
  static String getgallryRoute() => '$gallry';
  static String getpart_time_jobRoute() => '$part_time_job';
  static String getsettingsRoute() => '$settings';
  static String getchnange_passwordRoute() => '$chnange_password';
  static String getabout_usRoute() => '$about_us';
  static String getprofileRoute() => '$profile';
  static String getcourseRoute() => '$course';
  static String gettranslatorRoute() => '$translator';
  static String getsupportRoute() => '$support';
  static String getcalenderRoute() => '$calender';
  static String getpdfshowRoute(File file) => '$pdfshow?files=$file';
  static String getchatRoute(int pageId, int msgId, String page) =>
      '$chat?id=$pageId&msgId=$msgId&page=$page';
  static String getcourse_descriptionRoute(int pageId, String page) =>
      '$course_description?id=$pageId&page=$page';
  static String getgallryGridshowRoute(int categoryId) =>
      '$gallryGridshow?categoryId=$categoryId ';

  static List<GetPage> routes = [
    GetPage(
        name: register,
        page: () {
          return MyRegister();
        }),
    GetPage(
        name: login,
        page: () {
          return MyLogin();
        }),
    GetPage(
        name: home,
        page: () {
          return homeDashboard();
        }),
    GetPage(
        name: forgetPass,
        page: () {
          return forgotPassword();
        }),
    GetPage(
        name: generatePass,
        page: () {
          return generatePassword(
            email: Get.parameters['email']!,
          );
        }),
    GetPage(
        name: verifyPass,
        page: () {
          return OptVerifyCodes();
        }),
    GetPage(
        name: fees,
        page: () {
          return FeesScreen();
        }),
    GetPage(
        name: calender,
        page: () {
          return CalenderView();
        }),
    GetPage(
        name: pdfshow,
        page: () {
          return PdfShow(
            files: File(Get.parameters['file']!),
          );
        }),
    GetPage(
        name: exam_result,
        page: () {
          return EaxmResult();
        }),
    GetPage(
        name: event,
        page: () {
          return Event();
        }),
    GetPage(
        name: attendance,
        page: () {
          return Attendance();
        }),
    GetPage(
        name: chat,
        page: () {
          return ChatDetails(
            pageId: int.parse(Get.parameters['id']!),
            msgId: int.parse(Get.parameters["msgId"]!),
            page: Get.parameters['page']!,
          );
        }),
    GetPage(
        name: event_details,
        page: () {
          return EventDetails(
              pageId: int.parse(Get.parameters['id']!),
              page: Get.parameters['page']!,
              route: Get.parameters["route"]!);
        },
        transition: Transition.fadeIn),
    // GetPage(
    //     name: event_details,
    //     page: () {
    //       return EventDetails();
    //     }),
    GetPage(
        name: gallry,
        page: () {
          return Gallry();
        }),
    GetPage(
        name: part_time_job,
        page: () {
          return PartTimeJob();
        }),
    GetPage(
        name: settings,
        page: () {
          return Settings();
        }),
    GetPage(
        name: chnange_password,
        page: () {
          return changePassword();
        }),
    GetPage(
        name: about_us,
        page: () {
          return aboutUs();
        }),
    GetPage(
        name: translator,
        page: () {
          return Translator();
        }),
    GetPage(
        name: support,
        page: () {
          return Support();
        }),
    GetPage(
        name: profile,
        page: () {
          return ProfilePage();
        }),
    GetPage(
        name: initial,
        page: () {
          return homeDashboard();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: course,
        page: () {
          return Course();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: course_description,
        page: () {
          return productDescription(
            pageId: int.parse(Get.parameters['id']!),
            page: Get.parameters['page']!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: gallryGridshow,
        page: () {
          return GallryGrid(
            categoryId: int.parse(Get.parameters['categoryId']!),
          );
        },
        transition: Transition.fadeIn),
    // GetPage(
    //     name: accountPage,
    //     page: () {
    //       return AccountPage();
    //     }),
    // GetPage(
    //     name: cartPage,
    //     page: () {
    //       return CartPage(
    //           pageId: int.parse(Get.parameters['id']!),
    //           page: Get.parameters['page']!);
    //     },
    //     transition: Transition.fadeIn),
    // //GetPage(name: address, page: () => AddressScreen()),
    // GetPage(name: addAddress, page: () => AddAddressScreen()),
    // GetPage(
    //     name: payment,
    //     page: () => PaymentScreen(
    //         orderModel: OrderModel(
    //             id: int.parse(Get.parameters['id']!),
    //             userId: int.parse(
    //               Get.parameters['user']!,
    //             )))),
    // GetPage(
    //     name: orderSuccess,
    //     page: () => OrderSuccessfulScreen(
    //           orderID: Get.parameters['id']!,
    //           status: Get.parameters['status'].toString().contains('success')
    //               ? 1
    //               : 0,
    //         )),
  ];
}
