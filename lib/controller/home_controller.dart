import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_sample/controller/player_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final player = AssetsAudioPlayer();
  bool isPlaying = true;

  final playerController = Get.put(PlayerController());

  void openPlayer() async {
    await player.open(
      Playlist(audios: playerController.audioList),
      autoStart: false,
      showNotification: true,
      loopMode: LoopMode.playlist,
    );
  }

  @override
  void onInit() {
    openPlayer();
    player.isPlaying.listen((event) {
      isPlaying = event;
      update();
    });
    super.onInit();
  }
}
