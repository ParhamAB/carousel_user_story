import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension NumberParsing on num {
  double w(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.width / 100;

  double h(BuildContext context) =>
      this * MediaQueryData.fromView(View.of(context)).size.height / 100;

  Widget wsb({Widget? child}) => SizedBox(
        width: toDouble(),
        child: child,
      );

  Widget hsb({Widget? child}) => SizedBox(
        height: toDouble(),
        child: child,
      );
  Widget whsb({Widget? child}) => SizedBox(
        width: toDouble(),
        height: toDouble(),
        child: child,
      );
}

extension HttpResponseValidator on Response {
  dynamic get validate {
    if ((statusCode == 200 || statusCode == 400 || statusCode == 404) &&
        data != null) {
      return data;
    }
    return null;
  }
}

extension ErrorMessage on dynamic {
  String get getErrorMessage => 'خطا در برقراری ارتباط با سرور';
}
