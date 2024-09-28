import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:carousel_user_story/configs/gen/assets.gen.dart';
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
  bool fadeOut = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        fadeOut = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorPalette.gradientColorTwo,
            ColorPalette.gradientColorOne,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Animate(
          effects: [
            fadeOut
                ? const FadeEffect(
                    begin: 1, end: 0, duration: Duration(milliseconds: 800))
                : const FadeEffect(
                    begin: 0, end: 1, duration: Duration(milliseconds: 300)),
          ],
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
      ),
    );
  }
}
