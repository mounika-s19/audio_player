import 'package:audio_player_sample/constants/assets.dart';
import 'package:audio_player_sample/controller/home_controller.dart';
import 'package:audio_player_sample/view/player_view.dart';
import 'package:audio_player_sample/view/song_list_view.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  final homeController = Get.put(HomeController());

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  late TabController _tabController;
  var currentIndex = 0;

  final tabs = [
    MyTabs(image: Assets.classical),
    MyTabs(image: Assets.folk),
    MyTabs(image: Assets.hiphop),
    MyTabs(image: Assets.indie),
    MyTabs(image: Assets.musical),
    MyTabs(image: Assets.pop),
    MyTabs(image: Assets.rock),
  ];

  bool _isSelected(int index) {
    return tabs[index].isSelected;
  }

  void _onTabSelected(int index) {
    setState(() {
      for (var tab in tabs) {
        tab.isSelected = false;
      }
      tabs[index].isSelected = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _onTabSelected(0);
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    _tabController.addListener(() {
      _onTabSelected(_tabController.index);
    });

    homeController.player.onReadyToPlay.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration?.duration ?? Duration.zero;
        });
      }
    });

    homeController.player.currentPosition.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
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
      child: Stack(
        children: [
          GlassmorphicContainer(
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
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  leading: const Icon(FeatherIcons.alignLeft),
                  title: Text(
                    'Genere',
                    style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.5)),
                  ),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        FeatherIcons.search,
                        size: 19,
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: TabBar(
                          controller: _tabController,
                          indicatorWeight: 1,
                          // indicatorColor: Colors.transparent,

                          indicator: const BoxDecoration(color: Colors.transparent),
                          isScrollable: true,
                          splashFactory: NoSplash.splashFactory,
                          onTap: _onTabSelected,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                          tabs: tabs
                              .map((tab) => CustomTab(
                                    tab: tab,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            SongListView(),
                            SongListView(),
                            SongListView(),
                            SongListView(),
                            SongListView(),
                            SongListView(),
                            SongListView(),
                          ],
                        ),
                      ),
                      GetBuilder(
                          init: HomeController(),
                          builder: (_) {
                            return Container(
                              height: 110,
                              width: double.infinity,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 5),
                                    ListTile(
                                      onTap: () {
                                        // Get.to(const PlayerView());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const PlayerView()),
                                        );
                                      },
                                      leading: homeController.player.getCurrentAudioextra['image'] != null
                                          ? Hero(
                                              tag: 'tag1',
                                              child: Opacity(
                                                opacity: 0.9,
                                                child: CircleAvatar(
                                                  radius: 22,
                                                  backgroundImage: MemoryImage(
                                                    homeController.player.getCurrentAudioextra['image'],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Hero(
                                              tag: 'tag2',
                                              child: CircleAvatar(
                                                radius: 22,
                                                backgroundColor: Colors.white.withOpacity(0.5),
                                                child: Icon(
                                                  Icons.music_note,
                                                  color: Colors.black.withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                      title: Text(
                                        homeController.player.getCurrentAudioAlbum,
                                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      trailing: CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.white,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () async {
                                              await homeController.player.playOrPause();
                                            },
                                            icon: homeController.isPlaying
                                                ? const Icon(
                                                    Icons.pause,
                                                    color: Colors.black,
                                                  )
                                                : const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.black,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Slider(
                                      activeColor: Colors.black.withOpacity(0.8),
                                      inactiveColor: Colors.white.withOpacity(0.5),
                                      value: position.inSeconds.toDouble(),
                                      min: 0,
                                      max: duration.inSeconds.toDouble(),
                                      onChanged: (value) async {
                                        await homeController.player.seek(
                                          Duration(
                                            seconds: value.toInt(),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

// model class //
class MyTabs {
  String image;
  bool isSelected;
  MyTabs({required this.image, this.isSelected = false});
}

// class //
class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.tab,
  });
  final MyTabs tab;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: SizedBox(
          height: tab.isSelected ? 100 : 60,
          child: Image.asset(
            tab.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
