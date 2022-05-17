import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/models/user_info_model.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.CUSTOMER_INFO_URI);
  }

  Future<Response> resetcurrentpass(
      String oldpass, String password, String email) async {
    return await apiClient.postData(AppConstants.UPDATE_CURRENTPASS_URI,
        {"oldpass": oldpass, "password": password, "email": email});
  }

  Future<Response> updateUserImage(String files, int id) async {
    return await apiClient.postData(
        AppConstants.UPDATEUSERPHOTO_URI, {"photo": files, "user_id": id});
  }

  Future<Response> updateUser(UserInfoModel userInfo) async {
    return await apiClient.postData(
        AppConstants.UPDATEUSER_URI, userInfo.toJson());
  }

  /*Future<Response> updateProfile(UserInfoModel userInfoModel, String password, PickedFile file) async {
    FormData _formData = FormData({
      'image': file != null ? MultipartFile(file.path, filename: basename(file.path)) : null,
      '_method': 'put', 'f_name': userInfoModel.fName, 'l_name': userInfoModel.lName, 'phone': userInfoModel.phone,
      'password': password.isNotEmpty ? password : null
    });
    return await apiClient.postData(AppConstants.UPDATE_PROFILE_URI, _formData);
  }*/
  /*
  Future<http.StreamedResponse> updateProfile(UserInfoModel userInfoModel, PickedFile data, String token) async {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.BASE_URL}${AppConstants.UPDATE_PROFILE_URI}'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    if(GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    }else if(GetPlatform.isWeb && data != null) {
      Uint8List _list = await data.readAsBytes();
      var part = http.MultipartFile('image', data.readAsBytes().asStream(), _list.length, filename: basename(data.path),
          contentType: MediaType('image', 'jpg'));
      request.files.add(part);
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'f_name': userInfoModel.fName, 'l_name': userInfoModel.lName, 'email': userInfoModel.email
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();
    return response;
  }
  */
  /*
  Future<Response> changePassword(UserInfoModel userInfoModel) async {
    return await apiClient.postData(AppConstants.UPDATE_PROFILE_URI, {'f_name': userInfoModel.fName, 'l_name': userInfoModel.lName,
      'email': userInfoModel.email, 'password': userInfoModel.password});
  }*/

}
