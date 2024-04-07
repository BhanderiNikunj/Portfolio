// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:portfolio/resource/appClass.dart';

class ResponsiveScreen extends StatefulWidget {
  var mobileView, webView, tabView;

  ResponsiveScreen({Key? key, this.mobileView, this.tabView, this.webView})
      : super(key: key);

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenType scrType = AppClass().getScreenType(context);
    switch (scrType) {
      case ScreenType.mobile:
        return widget.mobileView;
      case ScreenType.tab:
        return widget.tabView;
      case ScreenType.web:
        return widget.webView;
    }
  }
}
