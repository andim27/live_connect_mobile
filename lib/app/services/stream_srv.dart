import 'package:live_connect_mobile/app/models/user.dart';
import 'package:live_connect_mobile/app/services/api_client_srv.dart';
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
    var data;
    try {
      String curUserEmail = box.read('cur_user_email');
      String curUserPassword = box.read('cur_user_password');
      data =
          await ApiClient().registerStreamUser(curUserEmail, curUserPassword);
      if (data['id'] != null) {
        print("---registerStreamUser cur_user_id=$data['id']");
        box.write('cur_user_id', data['id'].toString());
        data = await ApiClient().getUserToken(curUserEmail, curUserPassword);
        if (data['token'] != null) {
          box.write('cur_user_token', data['token'].toString());
        } else {
          print("API token Error token: ${data['token'].toString()}");
        }
        return true;
      }
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      print("API result: ${data.toString()}");
      return false;
    }
    return false;
  }

  Future<bool> loginStreamUser() async {
    var data;
    try {
      String curUserEmail = box.read('cur_user_email');
      String curUserPassword = box.read('cur_user_password');
      data = await ApiClient().getUserToken(curUserEmail, curUserPassword);
      if (data['token'] != null) {
        box.write('cur_user_token', data['token'].toString());
        print('API cur_user_token stored!');
        if (data['id'] != null) {
          box.write('cur_user_id', data['id'].toString());
          print('API cur_user_id stored!');
        } else {
          print("API user_id Error id: ${data['id'].toString()}");
          return false;
        }
        return true;
      } else {
        print("API token Error token: ${data['token'].toString()}");
      }
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      print("API result: ${data.toString()}");
      return false;
    }
    return false;
  }

  Future<Map> connectStreamRooms(int roomId, bool watch) async {
    var data;
    try {
      print('----API connectStreamRooms start------');
      data = await ApiClient().connectStreamRooms(roomId, watch);
      if ((data['id'] != null) && (data['viewers'] != null)) {
        print('API StreamRoom ${data['id']} connected!');
        return data['viewers'];
      } else {
        print('API StreamRoom ERROR roomId:${roomId}');
        print('API StreamRoom ERROR data:${data.toString()}');
        return {};
      }
    } catch (e) {
      print("API stream Error: ${e.toString()}");
      print("API result: ${data.toString()}");
      return {};
    }
    return {};
  }
}
