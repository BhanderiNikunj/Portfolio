import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/root.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(ProviderScope(child: const AppTheme()));
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PORTFOLIO',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors().primaryColor,
      ),
      home: const RootScreen(),
    );
  }
}

Widget imageBuilder({
  required String imageUrl,
  double? height,
  double? width,
  double? borderRadius,
  int? cacheWidth,
  BoxFit? fit,
  Color? color,
  bool? isBorderOnlySide,
  Radius? bottomLeft,
  Radius? bottomRight,
  Radius? topLeft,
  Radius? topRight,
  EdgeInsets? padding,
  double? horizontalPadding,
  double? verticalPadding,
}) {
  if (imageUrl.isEmpty) {
    return Center(child: warningIcon(color: color));
  } else if (imageUrl.startsWith('https')) {
    if (imageUrl.endsWith('svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: fit ?? BoxFit.fitWidth,
        width: width,
        height: height,
        // colorFilter:
        //     color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        placeholderBuilder: (context) => sizedBox(
          height: height,
          width: width,
          child: sizedBox(
            height: height,
            width: width,
            child: loadingIos(),
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: isBorderOnlySide == true
            ? BorderRadius.only(
                bottomLeft: bottomLeft ?? Radius.zero,
                bottomRight: bottomRight ?? Radius.zero,
                topLeft: topLeft ?? Radius.zero,
                topRight: topRight ?? Radius.zero,
              )
            : BorderRadius.circular(borderRadius ?? 0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit ?? BoxFit.cover,
          memCacheWidth: cacheWidth,
          color: color,
          height: height,
          width: width,
          placeholder: (context, url) => sizedBox(
            height: height,
            width: width,
            child: loadingIos(),
          ),
          errorListener: (value) => sizedBox(
            height: height,
            width: width,
            child: loadingIos(),
          ),
          errorWidget: (context, error, stackTrace) => warningIcon(
            color: color,
            bgColor: Colors.grey.withOpacity(0.15),
          ),
        ),
      );
    }
  } else if (imageUrl.startsWith('assets') && imageUrl.endsWith('.svg')) {
    return SvgPicture.asset(
      imageUrl,
      fit: fit ?? BoxFit.fitWidth,
      width: width,
      height: height,
      // colorFilter:
      //     color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  } else if (imageUrl.startsWith('assets')) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Image.asset(
        imageUrl,
        fit: fit ?? BoxFit.fitWidth,
        width: width,
        height: height,
        color: color,
        cacheWidth: cacheWidth,
        errorBuilder: (context, error, stackTrace) => warningIcon(color: color),
      ),
    );
  }
  return sizedBox(isShrink: true);
}

Widget loadingIos({bool isShowListLoader = false}) {
  return Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: sizedBox(
        height: isShowListLoader ? 100 : 300,
        width: isShowListLoader ? 100 : 300,
        child: Center(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 2,
              backgroundColor: Colors.amber,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget warningIcon({
  double? width,
  double? height,
  Color? color,
  Alignment? alignment,
  Color? bgColor,
}) {
  return Container(
    color: bgColor,
    child: Center(
      child: SvgPicture.asset(
        "assets/images/svg/common/warning.svg",
        width: width ?? 32,
        height: height ?? 32,
        // colorFilter: ColorFilter.mode(
        //     color ?? AppColor.default1Color, BlendMode.srcIn),
        alignment: alignment ?? Alignment.center,
      ),
    ),
  );
}

Widget sizedBox({
  double? height,
  double? width,
  Widget? child,
  bool isShrink = false,
  bool isExpand = false,
}) {
  if (isShrink) {
    return SizedBox.shrink(child: child);
  }
  if (isExpand) {
    return SizedBox.expand(child: child);
  }
  return SizedBox(height: height, width: width, child: child);
}
