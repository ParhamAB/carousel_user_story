import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:carousel_user_story/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class KeyValueWidget extends StatelessWidget {
  final String name;
  final String value;
  bool? isLink;
  KeyValueWidget(
      {super.key,
      required this.name,
      required this.value,
      this.isLink = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 90,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ColorPalette.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(fontSize: 14, color: ColorPalette.font4),
              ),
            ),
          ),
          10.wsb(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: ColorPalette.primary),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    if (isLink ?? false) {
                      final Uri url = Uri.parse(value);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    }
                  },
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 14,
                        color: isLink ?? false
                            ? ColorPalette.gradientColorOne
                            : ColorPalette.font1,
                        decoration: isLink ?? false
                            ? TextDecoration.underline
                            : TextDecoration.none),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
