import 'package:carousel_user_story/configs/gen/assets.gen.dart';
import 'package:carousel_user_story/core/utils/storage.dart';
import 'package:carousel_user_story/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:carousel_user_story/features/home/presentation/widgets/card_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:lottie/lottie.dart';

class HomeItemsScreen extends StatefulWidget {
  const HomeItemsScreen({super.key});

  @override
  _HomeItemsScreenState createState() => _HomeItemsScreenState();
}

class _HomeItemsScreenState extends State<HomeItemsScreen> {
  late CustomCarouselScrollController _controller;
  String id = "";
  bool isFirst = true;

  @override
  void initState() {
    _controller = CustomCarouselScrollController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final temp = await Storage.getId();
        setState(() {
          id = temp ?? "";
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeItemEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return Animate(
                effects: const [
                  FadeEffect(
                      begin: 0, end: 1, duration: Duration(milliseconds: 300)),
                ],
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                    Expanded(
                      child: CustomCarousel(
                          physics:
                              const CustomCarouselScrollPhysics(sticky: true),
                          itemCountBefore: 3,
                          itemCountAfter: 0,
                          alignment: Alignment.center,
                          scrollDirection: Axis.horizontal,
                          scrollSpeed: 0.5,
                          tapToSelect: false,
                          controller: _controller,
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
                          children: state.items.map(
                            (e) {
                              return HomeCard(model: e);
                            },
                          ).toList()
                            ..sort(
                              (a, b) {
                                if (id.isNotEmpty && isFirst) {
                                  if (a.model.id == id) return -1;
                                  if (b.model.id == id) return 1;
                                }
                                return 0;
                              },
                            )),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 100))
                  ],
                ),
              );
            } else if (state is HomeLoading) {
              return Center(
                  child: Lottie.asset(Assets.resources.loading, width: 100));
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
