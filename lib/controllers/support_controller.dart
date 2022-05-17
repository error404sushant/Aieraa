import 'package:aieraa_studies/data/repos/support_repo.dart';
import 'package:aieraa_studies/models/chat_user.dart';
import 'package:aieraa_studies/models/response_model.dart';
import 'package:aieraa_studies/models/support.dart';
import 'package:get/get.dart';

class SupportController extends GetxController implements GetxService {
  final SupportRepo supportRepo;
  SupportController({required this.supportRepo});

  bool get isLoading => _isLoading;
  late List<MsgToken> _tokenList = [];
  late List<Chats> _chatList = [];
  late List<Chats_u> _chatLists = [];
  bool _isLoading = true;
  List<MsgToken> get tokenList => _tokenList;
  List<Chats> get chatList => _chatList;
  List<Chats_u> get chatLists => _chatLists;

  Future<void> getSupports() async {
    ResponseModel _responseModel;
    Response response = await supportRepo.getSupports();
    if (response.statusCode == 200) {
      _tokenList = [];
      _tokenList.addAll(SupportModel.fromJson(response.body).tokens);
      //_popularPageSize = ProductModel.fromJson(response.body).totalSize;
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }

  Future<void> getChats(messageId) async {
    ResponseModel _responseModel;
    Response response = await supportRepo.getChats(messageId);
    if (response.statusCode == 200) {
      _chatLists = [];
      _chatLists.addAll(ChatModel.fromJson(response.body).chats);
      _isLoading = false;
      update();
    } else {
      // _responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    // return _responseModel;
  }

  Future<ResponseModel> setChat(String message, int msgId) async {
    _isLoading = true;
    update();
    Response response = await supportRepo.setChat(message, msgId);
    ResponseModel responseModel;
    if (response.statusCode == 200 && response.body['status'] == true) {
      responseModel = ResponseModel(true, response.body['message']);
      this.getChats(msgId);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> setTicket(
      String message, String regard, String subject, String files) async {
    print('response.body');
    _isLoading = true;
    update();
    Response response =
        await supportRepo.setTicket(message, regard, subject, files);
    ResponseModel responseModel;
    if (response.statusCode == 200 && response.body['status'] == true) {
      responseModel = ResponseModel(true, response.body['message']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
