import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiClient {
  final String baseURL = 'http://35.198.180.32';
  final box = GetStorage();

  String getCurUserToken() {
    String token = box.read('cur_user_token');
    return token;
  }

  Future<Map<String, dynamic>> connectStreamRooms(int roomId, bool watch) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath + '/' + roomId.toString();
    //--AUTH set:
    String curUserToken = getCurUserToken();
    Response response = await Dio().patch(apiUrl,
        data: {'watch': watch},
        options: Options(
          headers: {"Authorization": "Bearer $curUserToken"},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> getStreamUsers(int roomId) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath + '/' + roomId.toString();
    //--AUTH set:
    String curUserToken = getCurUserToken();
    Response response = await Dio().get(apiUrl,
        options: Options(
          headers: {"Authorization": "Bearer $curUserToken"},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> getStreamRooms() async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath;
    //--AUTH set:
    String curUserToken = getCurUserToken();
    Response response = await Dio().get(apiUrl,
        options: Options(
          headers: {"Authorization": "Bearer $curUserToken"},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> getStreamRoomById(int roomId) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath + roomId.toString();
    //--AUTH set:
    String curUserToken = getCurUserToken();
    Response response = await Dio().get(apiUrl,
        options: Options(
          headers: {"Authorization": "Bearer $curUserToken"},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> registerStreamUser(String email, String password) async {
    String apiPath = '/api/users';
    String apiUrl = this.baseURL + apiPath;
    Response response = await Dio().post(apiUrl, data: {'email': email, 'password': password});
    return response.data;
  }

  Future<Map<String, dynamic>> getUserToken(String email, String password) async {
    String apiPath = '/api/sessions';
    String apiUrl = this.baseURL + apiPath;
    Response response = await Dio().post(apiUrl, data: {'email': email, 'password': password});
    return response.data; //token
  }

  Future<Map<String, dynamic>> createStreamRoom(String streamSrc) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath;
    //--AUTH set:
    String curUserToken = getCurUserToken();
    Response response = await Dio().post(apiUrl,
        data: {'stream_src': streamSrc},
        options: Options(
          headers: {"Authorization": "Bearer $curUserToken"},
        ));
    return response.data; //stream_src;
  }
}
