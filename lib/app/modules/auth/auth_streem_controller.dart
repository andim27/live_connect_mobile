import 'package:live_connect_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:live_connect_mobile/app/models/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_connect_mobile/app/services/stream_srv.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';

class AuthStreemController extends GetxController {
  final box = GetStorage();
  Rx<UserModel> _userModel = UserModel().obs;

  var _isUserRegister = false.obs;
  get isUserRegister => this._isUserRegister.value;

  var _isProcessRegister = false.obs;
  get isProcessRegister => this._isProcessRegister.value;

  var _curUserName = ''.obs;
  get curUserName => this._curUserName.value;

  var _curUserEmail = ''.obs;
  get curUserEmail => this._curUserEmail.value;

  var _curUserPassword = ''.obs;
  get curUserPassword => this._curUserPassword.value;

  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;

  @override
  onInit() {
    checkCurUser();
  }

  void clear() {
    _userModel.value = UserModel();
  }

  loginUserStreemDB(String name, String email, String password) async {
    this._isProcessRegister.value = true;
    box.write('cur_user_name', name);
    box.write('cur_user_email', email);
    box.write('cur_user_password', password);
    var res = await StreamService().loginStreamUser();
    if (res) {
      print('----------------(OK)Streem User Login---------------');
      this._isProcessRegister.value = false;
      Get.snackbar(
        "Success:",
        "You are logined user!",
        backgroundColor: ColorBranding.green,
        snackPosition: SnackPosition.TOP,
      );
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.toNamed(Routes.HOME_AYAS);
      });
    } else {
      print(
          '----------------(ERROR)Streem User Login--------:${res.toString()}-------');
      this._isProcessRegister.value = false;
      Get.snackbar(
        "Error:",
        "Error login user",
        backgroundColor: ColorBranding.pink,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  registerUserStreemDB(String name, String email, String password) async {
    this._isProcessRegister.value = true;
    box.write('cur_user_name', name);
    box.write('cur_user_email', email);
    box.write('cur_user_password', password);
    var res = await StreamService().registerStreamUser();
    if (res) {
      print('----------------(OK)Streem User Register---------------');
      this._isUserRegister.value = true;
      this._isProcessRegister.value = false;
      Get.snackbar(
        "Success:",
        "You are registered user!",
        backgroundColor: ColorBranding.green,
        snackPosition: SnackPosition.TOP,
      );
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.toNamed(Routes.HOME_AYAS);
      });
    } else {
      print(
          '----------------(ERROR)Streem User Register-----:${res.toString()}-------');
      this._isUserRegister.value = false;
      this._isProcessRegister.value = false;
      Get.snackbar(
        "Error:",
        "Error register Account",
        backgroundColor: ColorBranding.pink,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  checkCurUser() {
    var curUserName = box.read('cur_user_name');
    if (curUserName != null) {
      this._curUserName.value = curUserName;
    }
    var curUserEmail = box.read('cur_user_email');
    if (curUserName != null) {
      this._curUserEmail.value = curUserEmail;
    }
    var curUserPassword = box.read('cur_user_password');
    if (curUserPassword != null) {
      this._curUserPassword.value = curUserPassword;
    }
    print('---CheckCurUser: email:' + curUserEmail);
  }
}
