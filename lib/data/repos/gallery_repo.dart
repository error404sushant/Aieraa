import 'package:aieraa_studies/data/api/api_client.dart';
import 'package:aieraa_studies/uitls/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class GalleryRepo {
  final ApiClient apiClient;
  GalleryRepo({required this.apiClient});

  Future<Response> getGalleries(categoryId) async {
    return await apiClient
        .getData(AppConstants.GET_GALLERY_URI + '?category_id=$categoryId');
  }

  Future<Response> getGalleryCategory() async {
    return await apiClient.getData(AppConstants.GET_GALLERYCATEGORY_URI);
  }
}
