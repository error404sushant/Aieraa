import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/models/place_order.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  OrderRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getOrderList() async {
    return await apiClient.getData(AppConstants.ORDER_LIST_URI);
  }

  Future<Response> getOrderDetails(String orderID) async {
    return await apiClient.getData('${AppConstants.ORDER_DETAILS_URI}$orderID');
  }

  Future<Response> cancelOrder(String orderID) async {
    return await apiClient.postData(
        AppConstants.ORDER_CANCEL_URI, {'_method': 'put', 'order_id': orderID});
  }

  Future<Response> trackOrder(String orderID) async {
    return await apiClient.getData('${AppConstants.TRACK_URI}$orderID');
  }

  Future<Response> placeOrder(PlaceOrderBody orderBody) async {
    print("in the repo now" + orderBody.toJson().toString());
    return await apiClient.postData(
        AppConstants.PLACE_ORDER_URI, orderBody.toJson());
  }
}
