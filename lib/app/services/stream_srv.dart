import 'package:ayas_mobile/app/models/user.dart';
import 'package:ayas_mobile/app/services/api_client_srv.dart';
import 'package:get_storage/get_storage.dart';

class StreamService {
  final pooling_time = 1; //--sec-
  final box = GetStorage();

  connectStreem() {}

  Future<List<UserModel>> getStreamUsers() async {
    try {
      //return ApiClient.getStreamUsers();
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      return null;
    }
  }

  Future<bool> registerStreamUser() async {
    try {
      String curUserEmail = box.read('cur_user_email');
      String curUserPassword = box.read('cur_user_password');
      var data = await ApiClient().registerStreamUser(curUserEmail, curUserPassword);
      if (data['id'] != null) {
        print("---registerStreamUser:$data['id']");
        box.write('cur_user_id', data['id'].toString());
        return true;
      }
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      return false;
    }
    return false;
  }
}
