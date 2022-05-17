import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class JobRepo {
  final ApiClient apiClient;
  JobRepo({required this.apiClient});

  Future<Response> getJobs() async {
    return await apiClient.getData(AppConstants.GET_JOB_URI);
  }

  Future<Response> applyForJob(String files, int jobId) async {
    return await apiClient.postData(
        AppConstants.APPLY_JOB_URI, {"job_cv": files, "job_id": jobId});
  }
}
