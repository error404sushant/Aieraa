import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class EventRepo {
  final ApiClient apiClient;
  EventRepo({required this.apiClient});

  Future<Response> getEvents() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
