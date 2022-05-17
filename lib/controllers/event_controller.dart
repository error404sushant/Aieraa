import 'package:aieraa_studies/data/repos/event_repo.dart';
import 'package:aieraa_studies/models/product.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:aieraa_studies/models/user_info_model.dart';
import 'package:get/get.dart';

class EventController extends GetxController implements GetxService {
  final EventRepo eventRepo;
  EventController({required this.eventRepo});

  bool get isLoading => _isLoading;
  late List<Product> _popularProductList = [];
  late UserInfoModel _userInfoModel;
  bool _isLoading = true;
  List<Product> get popularProductList => _popularProductList;
  // bool get isLoading => _isLoading;

  Future<void> getEvents() async {
    ResponseModel _responseModel;
    Response response = await eventRepo.getEvents();
    print('response');
    print(response.body['record']);
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList
          .addAll(ProductModel.fromJson(response.body['record']).products);
      //_popularPageSize = ProductModel.fromJson(response.body).totalSize;
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }
}
