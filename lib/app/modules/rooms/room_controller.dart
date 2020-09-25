import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/src/chewie_player.dart';

class RoomController extends GetxController {
  final _version = ''.obs;
  get version => this._version.value;

  Rx<TargetPlatform> _platform;
  Rx<VideoPlayerController> _videoPlayerController1 = Rx<VideoPlayerController>();
  Rx<VideoPlayerController> _videoPlayerController2 = Rx<VideoPlayerController>();
  Rx<ChewieController> _chewieController = Rx<ChewieController>();
  final _video_0_url = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4".obs;
  final _video_1_url = "http://35.198.180.32/hls/test-stream-1/index.m3u8".obs;
  final _video_2_url = "http://35.198.180.32/hls/test-stream-2/index.m3u8".obs;

  get videoPlayerController1 => this._videoPlayerController1.value;
  get videoPlayerController2 => this._videoPlayerController2.value;
  get chewieController => this._chewieController.value;

  Rx<List> _activeStreamUsers = Rx<List>();
  get activeStreamUsers => this._activeStreamUsers.value;

  var _isLiveRoom = false.obs;
  get isLiveRoom => this._isLiveRoom.value;

  @override
  void onInit() {
    super.onInit();
    initVideoControllers();
    getActiveStreamUsers();
  }

  initVideoControllers() {
    this._videoPlayerController1.value = VideoPlayerController.network(this._video_1_url.value);
    this._videoPlayerController2.value = VideoPlayerController.network(this._video_2_url.value);
    this._chewieController.value = ChewieController(
      videoPlayerController: this._videoPlayerController1.value,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    print('-----------------------initVideoControllers----------');
  }

  playRoomVideo(int nomer) {
    this._chewieController.value.dispose();
    this._videoPlayerController2.value.pause();
    this._videoPlayerController2.value.seekTo(Duration(seconds: 0));
    this._chewieController.value = ChewieController(
      videoPlayerController: (nomer == 1) ? this._videoPlayerController1.value : this._videoPlayerController2.value,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  playFullScreen() {
    this._chewieController.value.enterFullScreen();
  }

  openLiveRoom() {
    this._isLiveRoom.value = !this._isLiveRoom.value;
  }

  backPage() {
    this._chewieController.value.dispose();
    this._videoPlayerController2.value.pause();
    Get.back();
  }

  getActiveStreamUsers() {
    //--call api--

    _activeStreamUsers.value = [
      {'name': 'user-1'},
      {'name': 'user-2'},
      {'name': 'user-3'},
      {'name': 'user-4'},
      {'name': 'user-5'},
      {'name': 'user-6'},
      {'name': 'user-7'},
      {'name': 'user-8'},
      {'name': 'user-9'},
      {'name': 'user-10'}
    ];
  }

  connectStreamRooms(int roomId) {}
}
