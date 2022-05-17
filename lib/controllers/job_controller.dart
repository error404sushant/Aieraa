import 'package:aieraa_studies/data/repos/job_repo.dart';
import 'package:aieraa_studies/models/job.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:get/get.dart';

class JobController extends GetxController implements GetxService {
  final JobRepo jobRepo;
  JobController({required this.jobRepo});

  bool get isLoading => _isLoading;
  late List<Job> _jobList = [];
  bool _isLoading = true;
  List<Job> get jobList => _jobList;
  // bool get isLoading => _isLoading;

  Future<void> getJobs() async {
    ResponseModel _responseModel;
    Response response = await jobRepo.getJobs();
    if (response.statusCode == 200) {
      _jobList = [];
      _jobList.addAll(JobModel.fromJson(response.body).jobs);
      //_popularPageSize = ProductModel.fromJson(response.body).totalSize;
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }

  Future<ResponseModel> applyForJob(String files, int jobId) async {
    _isLoading = true;
    update();
    Response response = await jobRepo.applyForJob(files, jobId);
    ResponseModel responseModel;
    print(response.body);
    if (response.statusCode == 200) {
      // await authRepo.updateToken();
      if (response.body['status'] == true) {
        responseModel = ResponseModel(true, response.body['message']);
      } else {
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
