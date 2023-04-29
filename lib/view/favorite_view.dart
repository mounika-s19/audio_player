import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Color(0xFF302549),
          Color(0xFF8B6D95),
          Color(0xFFA96079),
          Color(0x0021233e),
          Color(0x00242643),
          Color(0x001e1e37),
        ], stops: [
          0.1,
          1,
          1,
          1,
          0.1,
          0.1,
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Favorite',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FeatherIcons.heart),
            ),
          ],
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Center(
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
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'asdlkjhgmxnbcvnhgledhkjhj;KHJVZS.NVJKLLHGKSJVB',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
