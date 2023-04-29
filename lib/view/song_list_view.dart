import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_sample/controller/home_controller.dart';
import 'package:audio_player_sample/controller/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongListView extends StatefulWidget {
  const SongListView({super.key});

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  final playerController = Get.put(PlayerController());

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerController>(
      builder: (_) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: playerController.audioList.length,
            itemBuilder: (context, index) {
              final audio = playerController.audioList[index];
              return GestureDetector(
                onTap: () async {
                  await homeController.player.open(
                    Playlist(
                      audios: playerController.audioList,
                      startIndex: index,
                    ),
                    autoStart: true,
                    showNotification: true,
                    loopMode: LoopMode.playlist,
                  );
                  setState(() {
                    homeController.player.getCurrentAudioextra;
                    homeController.player.getCurrentAudioAlbum;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    audio.metas.extra?['image'] != null
                        ? Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Center(
                                  child: Opacity(
                                    opacity: 0.9,
                                    child: Image.memory(
                                      audio.metas.extra?['image'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                child: Icon(
                                  Icons.music_note,
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 10),
                    Text(
                      audio.metas.album.toString(),
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
