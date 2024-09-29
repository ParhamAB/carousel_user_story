import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItemDetailsScreen extends StatefulWidget {
  final HomeItem model;
  const ItemDetailsScreen({super.key, required this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Animate(
        effects: const [
          FadeEffect(begin: 0, end: 1, duration: Duration(milliseconds: 300)),
        ],
        child: const Center(
          child: Text("details"),
        ),
      ),
    );
  }
}
