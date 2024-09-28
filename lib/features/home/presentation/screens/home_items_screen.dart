import 'package:carousel_user_story/configs/gen/assets.gen.dart';
import 'package:carousel_user_story/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:carousel_user_story/features/home/presentation/widgets/card_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:lottie/lottie.dart';

class HomeItemsScreen extends StatefulWidget {
  const HomeItemsScreen({Key? key}) : super(key: key);

  @override
  _HomeItemsScreenState createState() => _HomeItemsScreenState();
}

class _HomeItemsScreenState extends State<HomeItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeItemEvent()),
      child: Expanded(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: CustomCarousel(
                        physics:
                            const CustomCarouselScrollPhysics(sticky: true),
                        effectsBuilder:
                            CustomCarousel.effectsBuilderFromAnimate(
                          effects: EffectList()
                              .untint(
                                duration: 100.ms,
                                color: Colors.black45,
                              )
                              .shimmer(
                                delay: 100.ms,
                                color: Colors.white70,
                                angle: 3.1,
                              )
                              .boxShadow(
                                begin: const BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 0,
                                  spreadRadius: -4,
                                  offset: Offset(0, 0),
                                ),
                                end: BoxShadow(
                                  color: Colors.black.withOpacity(0),
                                  blurRadius: 24,
                                  offset: const Offset(-48, 0),
                                ),
                                borderRadius: BorderRadius.circular(24),
                              )
                              .rotate(
                                delay: 0.ms,
                                curve: Curves.easeIn,
                                begin: 0.02,
                              )
                              .flipH(
                                delay: 100.ms,
                                end: -0.15,
                                alignment: Alignment.center,
                                perspective: 2,
                              )
                              .slideX(end: 1.5),
                        ),
                        children: List.generate(state.items.length,
                            (i) => HomeCard(model: state.items[i]))),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10))
                ],
              );
            } else if (state is HomeLoading) {
              return Lottie.asset(Assets.resources.loading, width: 100);
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
