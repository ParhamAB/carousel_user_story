import 'package:bloc/bloc.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/domain/use_case/home_items_use_case.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeItemEvent>((event, emit) async {
      emit(HomeLoading());
      final state = await HomeItemsUseCase().call();
      if (state is DataSuccess) {
        emit(HomeSuccess(items: state.data ?? []));
      }
      if (state is DataError) {
        emit(HomeError(message: state.error ?? ""));
      }
    });
  }
}
