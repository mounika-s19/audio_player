import 'dart:typed_data';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerController extends GetxController {
  List<Audio> audioList = [];

  final _audioquery = OnAudioQuery();

  requestPermission() async {
    bool permissionStatus = await _audioquery.permissionsStatus();

    if (!permissionStatus) {
      await _audioquery.permissionsStatus();
    }
  }

  getMusicFromLibrary() async {
    requestPermission();
    List<SongModel> songModel = await _audioquery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    // List<GenreModel> genreModel = await _audioquery.queryGenres(
    //   sortType: null,
    //   orderType: OrderType.ASC_OR_SMALLER,
    //   uriType: UriType.EXTERNAL,
    // );
    Uint8List? image;
    for (var element in songModel) {
      image = await _audioquery.queryArtwork(
        element.id,
        ArtworkType.AUDIO,
        format: ArtworkFormat.JPEG,
      );
      // print(genreModel.toString());

      audioList.add(
        Audio.file(
          element.uri.toString(),
          metas: Metas(
            title: element.title,
            artist: element.artist,
            album: element.album,
            extra: {
              "image": image,
              // if(genreModel.isNotEmpty)
              // "genre": genreModel.firstWhere((element2) => element2.id == element.genreId).genre,
            },
          ),
        ),
      );
    }

    update();
  }

  @override
  void onInit() {
    getMusicFromLibrary();
    super.onInit();
  }
}
