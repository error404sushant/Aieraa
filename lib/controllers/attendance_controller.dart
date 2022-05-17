import 'package:aieraa_studies/data/repos/attendance_repo.dart';
import 'package:aieraa_studies/models/attendance_model.dart';
import 'package:aieraa_studies/models/calender.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController implements GetxService {
  final AttendanceRepo attendanceRepo;
  AttendanceController({required this.attendanceRepo});

  bool get isLoading => _isLoading;
  late AttendanceModel _attendanceModel;
  late List<Calender> _calenderList = [];
  bool _isLoading = true;
  List<Calender> get calenderList => _calenderList;

  AttendanceModel get attendanceModel => _attendanceModel;

  Future<ResponseModel> getAttendance() async {
    ResponseModel _responseModel;
    Response response = await attendanceRepo.getAttendance();
    if (response.statusCode == 200) {
      _attendanceModel = AttendanceModel.fromJson(response.body['record']);

      _responseModel = ResponseModel(true, 'successful');
      _isLoading = true;
    } else {
      _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return _responseModel;
  }

  Future<ResponseModel> getPdf(date) async {
    update();
    Response response = await attendanceRepo.getPdf(date);
    ResponseModel _responseModel;
    if (response.statusCode == 200) {
      _calenderList = [];
      _calenderList.addAll(CalenderModel.fromJson(response.body).calenders);
      _isLoading = false;
      _responseModel = ResponseModel(true, response.statusText!);
      update();
    } else {
      _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return _responseModel;
  }
}
