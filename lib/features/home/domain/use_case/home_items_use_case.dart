import 'package:carousel_user_story/configs/di.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/core/utils/use_case.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';

class HomeItemsUseCase extends TUseCase<DataState<List<HomeItem>>> {
  @override
  Future<DataState<List<HomeItem>>> call() => getIt<IHomeRepository>().items();
}
