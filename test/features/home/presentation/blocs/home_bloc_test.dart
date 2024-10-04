import 'package:bloc_test/bloc_test.dart';
import 'package:carousel_user_story/configs/di.dart';
import 'package:carousel_user_story/core/utils/data_states.dart';
import 'package:carousel_user_story/features/home/data/models/home_item_model.dart';
import 'package:carousel_user_story/features/home/data/repository/home_repository.dart';
import 'package:carousel_user_story/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late HomeBloc bloc;
  late MockIHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockIHomeRepository();
    getIt.registerFactory<IHomeRepository>(() => mockRepository);
    bloc = HomeBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  blocTest<HomeBloc, HomeState>(
    'emits [isA<LoginLoading>(), isA<LoginSuccess>()] when LoginStart is added and call is successful',
    build: () {
      final mockResponse = DataSuccess<List<HomeItemModel>>([]);
      when(mockRepository.items()).thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(HomeItemEvent()),
    expect: () => [
      isA<HomeLoading>(),
      isA<HomeSuccess>(),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [isA<LoginLoading>(), isA<LoginError>()] when LoginStart is added and call fails',
    build: () {
      final mockResponse = DataError<List<HomeItemModel>>('error');
      when(mockRepository.items()).thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(HomeItemEvent()),
    expect: () => [
      isA<HomeLoading>(),
      isA<HomeError>(),
    ],
  );
}
