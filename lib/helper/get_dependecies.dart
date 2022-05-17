import 'package:aieraa_studies/controllers/attendance_controller.dart';
import 'package:aieraa_studies/controllers/auth_controller.dart';
import 'package:aieraa_studies/controllers/cart_controller.dart';
import 'package:aieraa_studies/controllers/course_controller.dart';
import 'package:aieraa_studies/controllers/event_controller.dart';
import 'package:aieraa_studies/controllers/gallery_controller.dart';
import 'package:aieraa_studies/controllers/job_controller.dart';
import 'package:aieraa_studies/controllers/location_controller.dart';
import 'package:aieraa_studies/controllers/popular_product.dart';
import 'package:aieraa_studies/controllers/support_controller.dart';
import 'package:aieraa_studies/controllers/user_controller.dart';
import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/data/repos/attendance_repo.dart';
import 'package:aieraa_studies/data/repos/auth_repo.dart';
import 'package:aieraa_studies/data/repos/cart_repo.dart';
import 'package:aieraa_studies/data/repos/course_repo.dart';
import 'package:aieraa_studies/data/repos/event_repo.dart';
import 'package:aieraa_studies/data/repos/gallery_repo.dart';
import 'package:aieraa_studies/data/repos/job_repo.dart';
import 'package:aieraa_studies/data/repos/location_repo.dart';
import 'package:aieraa_studies/data/repos/order_controller.dart';
import 'package:aieraa_studies/data/repos/order_repo.dart';
import 'package:aieraa_studies/data/repos/popular_product_repo.dart';
import 'package:aieraa_studies/data/repos/product_repo.dart';
import 'package:aieraa_studies/data/repos/support_repo.dart';
import 'package:aieraa_studies/data/repos/user_repo.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //first load the repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => EventRepo(apiClient: Get.find()));
  Get.lazyPut(() => SupportRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => CourseRepo(apiClient: Get.find()));
  Get.lazyPut(() => AttendanceRepo(apiClient: Get.find()));
  Get.lazyPut(() => JobRepo(apiClient: Get.find()));
  Get.lazyPut(() => GalleryRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => OrderRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));

  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => EventController(eventRepo: Get.find()));
  Get.lazyPut(() => SupportController(supportRepo: Get.find()));
  // Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => PopularProduct(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  Get.lazyPut(() => CourseController(courseRepo: Get.find()));
  Get.lazyPut(() => AttendanceController(attendanceRepo: Get.find()));
  Get.lazyPut(() => JobController(jobRepo: Get.find()));
  Get.lazyPut(() => GalleryController(galleryRepo: Get.find()));
}
