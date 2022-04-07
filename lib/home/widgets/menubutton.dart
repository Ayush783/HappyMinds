// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happyminds/home/bloc/home_bloc.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    this.size,
    this.iconPath,
    this.onTap,
  }) : super(key: key);

  const MenuButton.menu({Function? fun})
      : size = 72,
        iconPath = 'menu',
        onTap = fun;
  const MenuButton.video({Function? fun})
      : size = 60,
        iconPath = 'video',
        onTap = fun;
  const MenuButton.call({Function? fun})
      : size = 60,
        iconPath = 'call',
        onTap = fun;
  const MenuButton.chat({Function? fun})
      : size = 60,
        iconPath = 'chat',
        onTap = fun;
  const MenuButton.info({Function? fun})
      : size = 60,
        iconPath = 'info',
        onTap = fun;

  const MenuButton.cancel({Function? fun})
      : size = 72,
        iconPath = 'cancel',
        onTap = fun;

  final Function? onTap;
  final double? size;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xfff1f1f1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 7),
              blurRadius: 29,
              spreadRadius: 0,
              color: Color.fromRGBO(100, 100, 111, 0.2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          'assets/icons/$iconPath.svg',
        ),
      ),
    );
  }
}
