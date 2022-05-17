import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SupportRepo {
  final ApiClient apiClient;
  SupportRepo({required this.apiClient});

  Future<Response> getSupports() async {
    return await apiClient.getData(AppConstants.SUPPORT_URI);
  }

  Future<Response> getChats(messageId) async {
    return await apiClient.getData(AppConstants.USER_CHAT + '?id=$messageId');
  }

  Future<Response> setChat(message, messageId) async {
    return await apiClient.postData(AppConstants.STORE_USER_CHAT,
        {"message": message, "message_id": messageId});
  }

  Future<Response> setTicket(message, regard, subject, String files) async {
    // return await apiClient.postData(AppConstants.CREATE_TICKET_CHAT,
    //     {"description": message, "subject": regard});
    return await apiClient.postData(AppConstants.STORE_USER_CHAT, {
      "description": message,
      "subject": subject,
      "category": regard,
      "attachmentapi": files
    });
  }

  // Future<Response> createTicket(message, regard) async {
  //   return await apiClient.postData(AppConstants.CREATE_TICKET, {"description": message, "subject": regard});
  // }
}
