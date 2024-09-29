import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.white;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ColorPalette.primary));
    return FadeTransition(
      opacity: animation,
      child: Directionality(textDirection: TextDirection.ltr, child: child),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class CustomPageRoute2 extends MaterialPageRoute {
  CustomPageRoute2({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: 700);
}
