import 'package:aieraa_studies/data/repos/gallery_repo.dart';
import 'package:aieraa_studies/models/gallery.dart';
import 'package:aieraa_studies/models/gallery_category.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController implements GetxService {
  final GalleryRepo galleryRepo;
  GalleryController({required this.galleryRepo});

  bool get isLoading => _isLoading;
  late List<Gallery> _galleryList = [];
  late List<Category> _categoryList = [];
  bool _isLoading = true;
  List<Gallery> get galleryList => _galleryList;
  List<Category> get categoryList => _categoryList;
  // bool get isLoading => _isLoading;

  Future<void> getGalleries(int categoryId) async {
    ResponseModel _responseModel;
    Response response = await galleryRepo.getGalleries(categoryId);
    if (response.statusCode == 200) {
      _galleryList = [];
      // _categoryList = [];
      _galleryList.addAll(GalleryModel.fromJson(response.body).galleries);
      // _categoryList.addAll(GalleryModel.fromJson(response.body).categories);
      //_popularPageSize = ProductModel.fromJson(response.body).totalSize;
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }

  Future<void> getGalleryCategory() async {
    ResponseModel _responseModel;
    Response response = await galleryRepo.getGalleryCategory();
    if (response.statusCode == 200) {
      _categoryList = [];
      _categoryList
          .addAll(GalleryCategoryModel.fromJson(response.body).categories);
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }
}
