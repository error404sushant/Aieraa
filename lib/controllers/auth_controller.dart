import 'package:aieraa_studies/data/repos/auth_repo.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:aieraa_studies/models/signup_body.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool _notification = true;
  bool _acceptTerms = true;

  bool get isLoading => _isLoading;

  bool get notification => _notification;

  bool get acceptTerms => _acceptTerms;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      //await authRepo.updateToken();

      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String phone, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone, password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      // await authRepo.updateToken();
      if (response.body['status'] == true) {
        authRepo.saveUserToken(response.body['token']);
        authRepo.saveUserName(phone);
        authRepo.saveUserPass(password);
        responseModel = ResponseModel(true, response.body['token']);
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

  Future<ResponseModel> sendotp(String email) async {
    _isLoading = true;
    update();
    Response response = await authRepo.sendotp(email);
    ResponseModel responseModel;
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

  Future<ResponseModel> checkotp(String email, int otp) async {
    _isLoading = true;
    update();
    Response response = await authRepo.checkotp(email, otp);
    ResponseModel responseModel;
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

  Future<ResponseModel> updatepass(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await authRepo.updatepass(email, password);
    ResponseModel responseModel;
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

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> doLoggedIn() {
    print("jio dhan dhana duhisd");
    return authRepo.doLoggedIn();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
}
