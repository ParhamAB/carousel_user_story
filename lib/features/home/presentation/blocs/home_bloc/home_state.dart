part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<HomeItemModel> items;

  HomeSuccess({required this.items});
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
