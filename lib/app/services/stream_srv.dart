import 'package:ayas_mobile/app/models/user.dart';
import 'package:ayas_mobile/app/services/api_client_srv.dart';

class StreamService {
  final pooling_time = 1; //--sec-

  connectStreem() {}

  Future<List<UserModel>> getStreamUsers() async {
    try {
      //return ApiClient.getStreamUsers();
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      return null;
    }
  }
}
