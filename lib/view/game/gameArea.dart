// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portfolio/resource/responsive.dart';
import 'package:portfolio/view/game/gameAreaWeb.dart';
import 'gameAreaMob.dart';
import 'gameAreaTab.dart';


class GameArea extends StatefulWidget {
  var mScrollController;
  GameArea(this.mScrollController, {Key? key}) : super(key: key);

  @override
  State<GameArea> createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreen(
      webView: GameAreaWeb(widget.mScrollController),
      tabView: GameAreaTab(),
      mobileView: GameAreaMob(),
    );
  }
}
