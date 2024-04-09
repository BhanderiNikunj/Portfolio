import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/common_widget.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/globals.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/resource/colors.dart';


class LeftPane extends ConsumerStatefulWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  ConsumerState<LeftPane> createState() => _LeftPaneState();
}

class _LeftPaneState extends ConsumerState<LeftPane> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  child: Consumer(builder: (context, ref, child) {
                    String val = ref.watch(hoverProvider);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: AppClass().getMqHeight(context) * 0.07,
                            child: InkWell(
                              onTap: () async {
                                await launchWeb(url: AppClass.gitLink);
                              },
                              onHover: (bol) {
                                if (bol) {
                                  ref.read(hoverProvider.notifier).state =
                                      "git";
                                } else {
                                  ref.read(hoverProvider.notifier).state = "";
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: val == "git" ? 5.0 : 0,
                                ),
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommonWidget.imageBuilder(
                                  imageUrl: 'assets/svg/github.svg',
                                  color: val == "git"
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: AppClass().getMqHeight(context) * 0.07,
                            child: InkWell(
                              onTap: () async {
                                await launchWeb(url: AppClass.instaLink);
                              },
                              onHover: (bool) {
                                if (bool) {
                                  ref.read(hoverProvider.notifier).state =
                                      "insta";
                                } else {
                                  ref.read(hoverProvider.notifier).state = "";
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: val == "insta" ? 5.0 : 0,
                                ),
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommonWidget.imageBuilder(
                                  imageUrl: 'assets/svg/instagram.svg',
                                  color: val == "insta"
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: AppClass().getMqHeight(context) * 0.07,
                            child: InkWell(
                              onTap: () async {
                                await launchWeb(url: AppClass.linkedinLink);
                              },
                              onHover: (bol) {
                                if (bol) {
                                  ref.read(hoverProvider.notifier).state =
                                      "linkedIn";
                                } else {
                                  ref.read(hoverProvider.notifier).state = "";
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: val == "linkedIn" ? 5.0 : 0,
                                ),
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommonWidget.imageBuilder(
                                  imageUrl: 'assets/svg/linkedIn.svg',
                                  color: val == "linkedIn"
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: AppClass().getMqHeight(context) * 0.07,
                            child: InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Common Soon"),
                                    backgroundColor: AppColors().neonColor,
                                  ),
                                );
                              },
                              onHover: (bol) {
                                if (bol) {
                                  ref.read(hoverProvider.notifier).state =
                                      "twitter";
                                } else {
                                  ref.read(hoverProvider.notifier).state = "";
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: val == "twitter" ? 5.0 : 0,
                                ),
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommonWidget.imageBuilder(
                                  imageUrl: 'assets/svg/twitter.svg',
                                  color: val == "twitter"
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: AppClass().getMqHeight(context) * 0.07,
                            child: InkWell(
                              onTap: () async {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Common Soon"),
                                    backgroundColor: AppColors().neonColor,
                                  ),
                                );
                              },
                              onHover: (bol) {
                                if (bol) {
                                  ref.read(hoverProvider.notifier).state =
                                      "stackoverflow";
                                } else {
                                  ref.read(hoverProvider.notifier).state = "";
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: val == "stackoverflow" ? 5.0 : 0),
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommonWidget.imageBuilder(
                                  imageUrl: 'assets/svg/stackoverflow.svg',
                                  color: val == "stackoverflow"
                                      ? AppColors().neonColor
                                      : AppColors().textColor,
                                  width: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )),
            Expanded(
                child: Container(
              width: 1,
              color: AppColors().textColor,
            ))
          ],
        ));
  }
}
