import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:carousel_user_story/core/utils/custom_modals.dart';
import 'package:carousel_user_story/core/utils/extentions.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/presentation/widgets/key_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItemDetailsScreen extends StatefulWidget {
  final HomeItem model;
  const ItemDetailsScreen({super.key, required this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final int delay = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animate(
        effects: const [
          FadeEffect(begin: 0, end: 1, duration: Duration(milliseconds: 300)),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Center(
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorPalette.background),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        150.hsb(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.model.title ?? "",
                                        style: const TextStyle(
                                            color: ColorPalette.font1,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Image.network(
                                            widget.model.image ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        20.hsb(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            5,
                                            (index) {
                                              final temp = int.parse(
                                                          widget.model.rate ??
                                                              "0") /
                                                      2 -
                                                  (index + 1);
                                              if (temp + 1 < 1 &&
                                                  temp + 1 > 0) {
                                                return const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3),
                                                    child: Icon(
                                                        Icons
                                                            .star_half_outlined,
                                                        color:
                                                            ColorPalette.yellow,
                                                        size: 17));
                                              } else {
                                                return index + 1 <=
                                                        (int.parse(widget.model
                                                                    .rate ??
                                                                "0") /
                                                            2)
                                                    ? const Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 3),
                                                        child: Icon(Icons.star,
                                                            color: ColorPalette
                                                                .yellow,
                                                            size: 17))
                                                    : const Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 3),
                                                        child: Icon(
                                                            Icons.star_border,
                                                            color: ColorPalette
                                                                .yellow,
                                                            size: 17));
                                              }
                                            },
                                          ).toList(),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        20.hsb(),
                        Animate(
                          delay: Duration(milliseconds: delay),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay)),
                            const SlideEffect()
                          ],
                          child: KeyValueWidget(
                              name: "Type", value: widget.model.type ?? ""),
                        ),
                        Animate(
                          delay: Duration(milliseconds: delay * 2),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay * 2)),
                            const SlideEffect()
                          ],
                          child: KeyValueWidget(
                              name: "Presenter",
                              value: widget.model.presenter ?? ""),
                        ),
                        Animate(
                          delay: Duration(milliseconds: delay * 3),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay * 3)),
                            const SlideEffect()
                          ],
                          child: KeyValueWidget(
                              name: "City", value: widget.model.city ?? ""),
                        ),
                        Animate(
                          delay: Duration(milliseconds: delay * 4),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay * 4)),
                            const SlideEffect()
                          ],
                          child: KeyValueWidget(
                              name: "Url",
                              value: widget.model.url ?? "",
                              isLink: true),
                        ),
                        Animate(
                          delay: Duration(milliseconds: delay * 5),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay * 5)),
                            const SlideEffect()
                          ],
                          child: KeyValueWidget(
                              name: "Runtime",
                              value: widget.model.runtime ?? ""),
                        ),
                        30.hsb(),
                        Animate(
                          delay: Duration(milliseconds: delay * 6),
                          effects: [
                            FadeEffect(
                                begin: 0,
                                end: 1,
                                duration: Duration(milliseconds: delay * 6)),
                            const SlideEffect()
                          ],
                          child: 150.wsb(
                              child: ElevatedButton(
                                  onPressed: () {
                                    CustomModal.showSuccess(
                                        context, "Nothing to do for now 😒");
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.shopping_cart_rounded,
                                        color: ColorPalette.background,
                                      ),
                                      10.wsb(),
                                      Text("${widget.model.price}\$")
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorPalette.secondary),
                    child: const Icon(Icons.document_scanner_outlined,
                        color: ColorPalette.background),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
