import 'package:aieraa_studies/data/repos/course_repo.dart';
import 'package:aieraa_studies/models/course.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:get/get.dart';

class CourseController extends GetxController implements GetxService {
  final CourseRepo courseRepo;
  CourseController({required this.courseRepo});

  bool get isLoading => _isLoading;
  late List<Courses> _courseList = [];
  late List<Subjects> _subjectList = [];
  bool _isLoading = true;
  List<Courses> get courseList => _courseList;
  List<Subjects> get subjectList => _subjectList;

  Future<void> getCourses(subjectId) async {
    ResponseModel _responseModel;
    Response response = await courseRepo.getCourse(subjectId);
    if (response.statusCode == 200) {
      _courseList = [];
      _subjectList = [];

      _courseList.addAll(CourseModel.fromJson(response.body).courses);
      _subjectList.addAll(CourseModel.fromJson(response.body).subjects);
      //_popularPageSize = ProductModel.fromJson(response.body).totalSize;
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }

  // Future<void> getChats(messageId) async {
  //   ResponseModel _responseModel;
  //   Response response = await courseRepo.getChats(messageId);
  //   if (response.statusCode == 200) {
  //     _chatLists = [];
  //     _chatLists.addAll(ChatModel.fromJson(response.body).chats);
  //     _isLoading = false;
  //     update();
  //   } else {
  //     // _responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   update();
  //   // return _responseModel;
  // }
  //
  // Future<ResponseModel> setChat(String message, int msgId) async {
  //   _isLoading = true;
  //   update();
  //   Response response = await courseRepo.setChat(message, msgId);
  //   ResponseModel responseModel;
  //   if (response.statusCode == 200 && response.body['status'] == true) {
  //     responseModel = ResponseModel(true, response.body['message']);
  //     this.getChats(msgId);
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isLoading = false;
  //   update();
  //   return responseModel;
  // }
}
