import 'package:aieraa_studies/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/get_dependecies.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<CartController>().getCartsData();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aieraa',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
            // color: Colors.blue,
            color: Color(0xff1A7ED0),
          )),
      // initialRoute: RouteHelper.getSplashRoute(),
      initialRoute: RouteHelper.getloginRoute(),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//         appBarTheme: AppBarTheme(
//       color: Colors.white,
//     )),
//     initialRoute: RouteHelper.getloginRoute(),
//     getPages: RouteHelper.routes,
//     defaultTransition: Transition.topLevel,
//     // home: MyLogin(),
//     // routes: {
//     //   '/register': (context) => MyRegister(),
//     //   '/login': (context) => MyLogin(),
//     //   '/home': (context) => homeDashboard(),
//     //   '/forgetPass': (context) => forgotPassword(),
//     //   '/verifyPass': (context) => forgotPassword(),
//     //   '/verifyPass': (context) => homeDashboard(),
//     //   '/fees': (context) => FeesScreen(),
//     //   '/exam_result': (context) => EaxmResult(),
//     //   '/event': (context) => Event(),
//     //   '/event_details': (context) => EventDetails(),
//     //   '/gallry': (context) => Gallry(),
//     //   '/part_time_job': (context) => PartTimeJob(),
//     //   '/settings': (context) => Settings(),
//     //   '/chnange_password': (context) => changePassword(),
//     //   '/about_us': (context) => aboutUs(),
//     //   '/profile': (context) => profile(),
//     //   '/course': (context) => profile(),
//     //   '/course_description': (context) => productDescription(),
//     // },
//   ));
// }
