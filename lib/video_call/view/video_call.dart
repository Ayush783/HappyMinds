import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happyminds/home/model/psychiatrist.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({Key? key, this.ps}) : super(key: key);

  final Psychiatrist? ps;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0,
          title: Text(
            ps!.name!,
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
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
