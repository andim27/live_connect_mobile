import 'package:dio/dio.dart';

class ApiClient {
  final String baseURL = 'http://35.198.180.32';

  Future connectStreamRooms(int roomId) async {
    String apiPath = '/api/stream-rooms';
    Response response = await Dio().patch(this.baseURL + apiPath + '/' + roomId.toString());
    return response;
  }

  Future getStreamUsers() async {
    String apiPath = '/api/stream-users';
    Response response = await Dio().get(this.baseURL + apiPath);
    return response;
  }
}
