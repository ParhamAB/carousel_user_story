import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:carousel_user_story/core/utils/extentions.dart';
import 'package:carousel_user_story/core/utils/is_test_environment.dart';
import 'package:carousel_user_story/core/utils/my_navigator.dart';
import 'package:carousel_user_story/core/utils/storage.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/presentation/screens/item_details_screen.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final HomeItemModel model;
  const HomeCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Widget card = InkWell(
      onTap: () {
        Storage.setId(model.id ?? "");
        MyNavigator.push(context, ItemDetailsScreen(model: model));
      },
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ColorPalette.secondary,
            border: Border.all(
              color: const HSLColor.fromAHSL(1, 0, 1, 1).toColor(),
              width: 20,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  20.hsb(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 20),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: !TestEnvironment.isTestMode()
                          ? Image.network(
                              model.image ?? "",
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                    ),
                  ),
                  50.hsb(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.title ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 110,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: ColorPalette.primary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomLeft: Radius.circular(3))),
                    child: Center(
                      child: Text(
                        "${model.price ?? ""}\$",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );

    return card;
  }
}
