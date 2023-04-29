import 'package:audio_player_sample/controller/home_controller.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../constants/assets.dart';
import 'favorite_view.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final HomeController _homeController = Get.put(HomeController());

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    animationController.repeat();
    _homeController.player.onReadyToPlay.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration?.duration ?? Duration.zero;
        });
      }
    });

    _homeController.player.currentPosition.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF302549),
            Color(0xFF8B6D95),
            Color(0xFFA96079),
            Color(0x0021233e),
            Color(0x00242643),
            Color(0x001e1e37),
          ],
          stops: [
            0.1,
            1,
            1,
            1,
            0.1,
            0.1,
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Now Playing',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const FavoriteView());
                  },
                  child: Icon(
                    FeatherIcons.heart,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  Text(
                    'Now PLaying',
                    style: TextStyle(),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                  ),
                  Text('Now PLaying')
                ],
              ),
              Center(
                child: GlassmorphicContainer(
                  width: double.infinity,
                  height: double.infinity,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                    const Color(0xFF302549),
                    const Color(0xFFFFFFFF).withOpacity(0.05),
                  ], stops: const [
                    0.1,
                    1,
                  ]),
                  borderGradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [],
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: AnimatedBuilder(
                              animation: animationController,
                              child: _homeController.player.getCurrentAudioextra['image'] != null
                                  ? Hero(
                                      tag: 'tag1',
                                      child: Opacity(
                                        opacity: 0.9,
                                        child: CircleAvatar(
                                          radius: 150,
                                          backgroundImage: MemoryImage(
                                            _homeController.player.getCurrentAudioextra['image'],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Hero(
                                      tag: 'tag2',
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white.withOpacity(0.5),
                                        radius: 150,
                                        child: Icon(
                                          Icons.music_note,
                                          size: 120,
                                          color: Colors.black.withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: animationController.value * 6.3,
                                  child: child,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _homeController.player.getCurrentAudioAlbum,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _homeController.player.getCurrentAudioTitle,
                            style: const TextStyle(
                              // color: Colors.grey.shade500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 50),
                          GetBuilder<HomeController>(
                            builder: (_) {
                              return Slider(
                                activeColor: Colors.black.withOpacity(0.8),
                                inactiveColor: Colors.white.withOpacity(0.5),
                                value: position.inSeconds.toDouble(),
                                min: 0,
                                max: duration.inSeconds.toDouble(),
                                onChanged: (value) async {
                                  await _homeController.player.seek(
                                    Duration(
                                      seconds: value.toInt(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 200,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white.withOpacity(0.7),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Divider(
                                                color: Colors.white.withOpacity(0.2),
                                              ),
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Title : ',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white.withOpacity(0.6),
                                                    ),
                                                  ),
                                                  Text(
                                                    _homeController.player.getCurrentAudioTitle,
                                                    style: TextStyle(
                                                      color: Colors.white.withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Album : ',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white.withOpacity(0.6),
                                                    ),
                                                  ),
                                                  Text(
                                                    _homeController.player.getCurrentAudioAlbum,
                                                    style: TextStyle(
                                                      color: Colors.white.withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Artist : ',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white.withOpacity(0.6),
                                                    ),
                                                  ),
                                                  Text(
                                                    _homeController.player.getCurrentAudioArtist,
                                                    style: TextStyle(
                                                      color: Colors.white.withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Image.asset(
                                  Assets.more,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _homeController.player.previous();
                                },
                                child: Image.asset(
                                  Assets.previous,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _homeController.player.playOrPause();
                                  if (!_homeController.isPlaying) {
                                    animationController.stop();
                                  } else {
                                    animationController.repeat();
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                  child: _homeController.isPlaying
                                      ? Image.asset(
                                          Assets.pause,
                                          height: 40,
                                          width: 40,
                                        )
                                      : Image.asset(
                                          Assets.playWhite,
                                          height: 40,
                                          width: 40,
                                        ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _homeController.player.next();
                                },
                                child: Image.asset(
                                  Assets.next,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              Image.asset(
                                Assets.refresh,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
