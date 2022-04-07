import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happyminds/home/bloc/home_bloc.dart';
import 'package:happyminds/info/view/info.dart';

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
    final showMenu = context.select((HomeBloc bloc) => bloc.state.showMenu);
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
            left: showMenu ? (size.width / 2) - 108 : (size.width / 2) - 30,
            child: MenuButton.call(
              fun: () {},
            ),
            duration: const Duration(milliseconds: 370),
          ),
          AnimatedPositioned(
            bottom: 112,
            curve: Curves.bounceOut,
            left: showMenu ? (size.width / 2) + 48 : (size.width / 2) - 30,
            child: MenuButton.chat(
              fun: () {},
            ),
            duration: const Duration(milliseconds: 370),
          ),
          AnimatedPositioned(
            bottom: showMenu ? 192 : 108,
            left: (size.width / 2) - 30,
            curve: Curves.bounceOut,
            child: MenuButton.video(
              fun: () {},
            ),
            duration: const Duration(milliseconds: 370),
          ),
          AnimatedPositioned(
            bottom: showMenu ? 38 : 108,
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
            child: MenuButton.menu(
              fun: () {
                context.read<HomeBloc>().add(MenuTapped());
              },
            ),
          ),
          Text(
            'Let us make you happy😊',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ));
  }
}
