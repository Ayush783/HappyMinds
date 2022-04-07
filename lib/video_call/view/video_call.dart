import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfff2709c),
                    Color(0xffff9472),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.02, 0.8],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
