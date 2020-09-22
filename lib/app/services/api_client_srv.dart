import 'package:dio/dio.dart';

class ApiClient {
  final String baseURL = 'http://35.198.180.32';

  Future connectStreamRooms(int roomId) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath + '/' + roomId.toString();
    Response response = await Dio().patch(apiUrl);
    return response;
  }

  Future getStreamUsers(int roomId) async {
    String apiPath = '/api/stream-rooms';
    String apiUrl = this.baseURL + apiPath + '/' + roomId.toString();
    Response response = await Dio().get(apiUrl);
    return response;
  }
}
