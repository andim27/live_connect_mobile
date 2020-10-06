import 'package:ayas_mobile/app/models/live_page.dart';
import 'package:get/get.dart';

class LivePageZoomController extends GetxController {
  Rx<LivePageModel> _livePageModel = LivePageModel().obs;

  LivePageModel get liveStream => _livePageModel.value;

  set liveStream(LivePageModel value) => this._livePageModel.value = value;

  RxBool isLiveRx = false.obs;

  void updateIsLiveBool(bool isLive) {
    if (isLive == true) {
      isLiveRx.value = true;
    } else {
      isLiveRx.value = false;
    }

    update();
  }

  void clear() {
    _livePageModel.value = LivePageModel();
  }
}
