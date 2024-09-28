import 'package:carousel_user_story/core/utils/extentions.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final HomeItem model;
  const HomeCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Widget card = AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const HSLColor.fromAHSL(1, 0, 1, 1).toColor(),
            width: 20,
          ),
        ),
        child: Column(
          children: [
            20.hsb(),
            Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                model.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            50.hsb(),
            Text(model.title ?? ""),
            Text("${model.price ?? ""}\$"),
          ],
        ),
      ),
    );

    return card;
  }
}
