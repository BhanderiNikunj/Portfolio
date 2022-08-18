import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/view/intro/introMobile.dart';
import 'package:portfolio/view/intro/introWeb.dart';

import 'introTab.dart';

class IntroContent extends StatefulWidget {
  const IntroContent({Key? key}) : super(key: key);

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: IntroTab(),
      mobileView: IntroMobile(),
      webView: IntroWeb(),
    );
  }
}
