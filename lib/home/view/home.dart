import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happyminds/call/view/call.dart';
import 'package:happyminds/chat/chat.dart';
import 'package:happyminds/home/bloc/home_bloc.dart';
import 'package:happyminds/info/view/info.dart';
import 'package:happyminds/video_call/view/video_call.dart';

import '../widgets/menubutton.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final showMenu = context.select(
      (HomeBloc bloc) => bloc.state.showMenu,
    );
    final ps = context.select(
      (HomeBloc bloc) => bloc.state.ps,
    );
    final cType = context.select(
      (HomeBloc bloc) => bloc.state.communicationType,
    );

    log(cType.toString());
    log(ps.name!);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
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
            AnimatedPositioned(
              bottom: 112,
              curve: Curves.bounceOut,
              left: cType != CommunicationType.none
                  ? cType != CommunicationType.call
                      ? -120
                      : (size.width / 2) - 108
                  : showMenu
                      ? (size.width / 2) - 108
                      : (size.width / 2) - 30,
              child: MenuButton.call(
                fun: () {
                  if (cType == CommunicationType.call && ps.name!.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CallView(),
                      ),
                    );
                  } else {
                    context.read<HomeBloc>().add(
                          const FindPsychiatrist('call'),
                        );
                  }
                },
              ),
              duration: const Duration(milliseconds: 370),
            ),
            AnimatedPositioned(
              bottom: 112,
              curve: Curves.bounceOut,
              left: cType != CommunicationType.none
                  ? cType != CommunicationType.chat
                      ? size.width + 60
                      : (size.width / 2) + 48
                  : showMenu
                      ? (size.width / 2) + 48
                      : (size.width / 2) - 30,
              child: MenuButton.chat(
                fun: () {
                  if (cType == CommunicationType.chat && ps.name!.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatView(
                          ps: ps,
                        ),
                      ),
                    );
                  } else {
                    context.read<HomeBloc>().add(
                          const FindPsychiatrist('chat'),
                        );
                  }
                },
              ),
              duration: const Duration(milliseconds: 370),
            ),
            AnimatedPositioned(
              bottom: cType != CommunicationType.none
                  ? cType != CommunicationType.videoCall
                      ? size.height + 60
                      : 192
                  : showMenu
                      ? 192
                      : 108,
              left: (size.width / 2) - 30,
              curve: Curves.bounceOut,
              child: MenuButton.video(
                fun: () {
                  if (cType == CommunicationType.videoCall &&
                      ps.name!.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const VideoCall(),
                      ),
                    );
                  } else {
                    context.read<HomeBloc>().add(
                          const FindPsychiatrist('videoCall'),
                        );
                  }
                },
              ),
              duration: const Duration(milliseconds: 370),
            ),
            AnimatedPositioned(
              bottom: cType != CommunicationType.none
                  ? -120
                  : showMenu
                      ? 38
                      : 108,
              left: (size.width / 2) - 30,
              curve: Curves.bounceOut,
              child: MenuButton.info(
                fun: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InfoView(),
                    ),
                  );
                },
              ),
              duration: const Duration(milliseconds: 370),
            ),
            Positioned(
              bottom: 108,
              left: (size.width / 2) - 36,
              child: cType == CommunicationType.none
                  ? MenuButton.menu(
                      fun: () {
                        context.read<HomeBloc>().add(MenuTapped());
                      },
                    )
                  : AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: ps.name!.isEmpty ? 0.4 : 1,
                      child: MenuButton.cancel(
                        fun: () {
                          context.read<HomeBloc>().add(MenuTapped());
                        },
                      ),
                    ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.searching) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Text(
                        'Searching for a Psychiatrist🔍',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                } else {
                  if (state.ps.name!.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Let us make you happy😊',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Find a psychiatrist on one tap',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 24)
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Card(
                            elevation: 4,
                            shape: CircleBorder(),
                            child: CircleAvatar(radius: 48)),
                        const SizedBox(height: 8),
                        Text(
                          ps.name!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
