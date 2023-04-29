import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player_sample/view/home_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void main() {
  AssetsAudioPlayer.addNotificationOpenAction((notification) {
    return true;
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.rightToLeft,
      home: const HomeView(),
    );
  }
}
