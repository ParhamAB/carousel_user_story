import 'package:carousel_user_story/configs/di.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/data/source/home_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:carousel_user_story/core/utils/extentions.dart';

abstract class IHomeRepository {
  Future<DataState<List<HomeItemModel>>> items();
}

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  @override
  Future<DataState<List<HomeItemModel>>> items() async {
    try {
      final result = await getIt<IHomeDataSource>().items();
      if (result != null) {
        return DataSuccess((result as List)
            .map(
              (item) => HomeItemModel.fromJson(item),
            )
            .toList());
      }
      return DataError(null.getErrorMessage);
    } catch (e) {
      return DataError(null.getErrorMessage);
    }
  }
}
