
// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';
import 'package:carousel_user_story/features/home/data/source/home_data_source.dart';

void disableOverflowErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final exception = details.exception;
    final isOverflowError = exception is FlutterError &&
        !exception.diagnostics.any(
            (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));

    if (isOverflowError) {
      null;
    } else {
      FlutterError.presentError(details);
    }
  };
}

@GenerateMocks([
  Dio,
  IHomeRepository,
  IHomeDataSource
])
void main() {}
