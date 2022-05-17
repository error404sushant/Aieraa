import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class CourseRepo {
  final ApiClient apiClient;
  CourseRepo({required this.apiClient});

  Future<Response> getCourse(subjectId) async {
    return await apiClient
        .getData(AppConstants.GET_COURSE_URI + '?subject_id=$subjectId');
  }

  Future<Response> getChats(messageId) async {
    return await apiClient.getData(AppConstants.USER_CHAT + '?id=$messageId');
  }

  Future<Response> setChat(message, messageId) async {
    return await apiClient.postData(AppConstants.STORE_USER_CHAT,
        {"message": message, "message_id": messageId});
  }
}
