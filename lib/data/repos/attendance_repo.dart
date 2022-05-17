import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class AttendanceRepo {
  final ApiClient apiClient;
  AttendanceRepo({required this.apiClient});

  Future<Response> getAttendance() async {
    return await apiClient.getData(AppConstants.GET_ATTENDANCE_URI);
  }

  Future<Response> getPdf(DateTime date) async {
    return await apiClient
        .getData(AppConstants.GET_CLAENDER_URI + '?currdate=$date');
  }
}
