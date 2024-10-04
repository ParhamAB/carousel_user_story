import 'package:carousel_user_story/configs/gen/assets.gen.dart';
import 'package:carousel_user_story/core/utils/my_navigator.dart';
import 'package:carousel_user_story/features/home/presentation/screens/home_items_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animate(
        effects: const [
          FadeEffect(begin: 0, end: 1, duration: Duration(milliseconds: 300)),
        ],
        onComplete: (controller) {
          Future.delayed(const Duration(seconds: 3), () {
            MyNavigator.pushReplacement(context, const HomeItemsScreen());
          });
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.resources.logo.image(width: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: AnimateList(
                      interval: 500.ms,
                      effects: [
                        FadeEffect(duration: 300.ms),
                        SlideEffect(duration: 300.ms)
                      ],
                      children: const [
                        Text("Carousel ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("User ",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Story",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Animate(
                    effects: [
                      FadeEffect(delay: 2.seconds),
                      const SlideEffect()
                    ],
                    child: Lottie.asset(Assets.resources.loading, width: 100),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
