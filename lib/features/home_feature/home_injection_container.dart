import 'package:enhanced_ecommerce_app/features/home_feature/data/data_sources/home_data_source.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/data_sources/home_data_source_imp.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/repository/home_repository_imp.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/decrease_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_add_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_remove_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_view_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_count_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_home_data_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/increase_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/search_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/favourite/favourite_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/home/home_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/item_details/item_details_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/items/items_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/search_items/search_items_cubit.dart';
import 'package:enhanced_ecommerce_app/main_injection_container.dart';

Future<void> homeInjectionContainer() async {
//cubit
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(getHomeDataUsercase: sl.call()),
  );
  sl.registerFactory<ItemsCubit>(
    () => ItemsCubit(getItemsUsercase: sl.call()),
  );
  sl.registerFactory<ItemDetailsCubit>(
    () => ItemDetailsCubit(
        getCountItemsUsecase: sl.call(),
        decreaseItemsUsecase: sl.call(),
        increaseItemsUsecase: sl.call()),
  );
  sl.registerFactory<SearchItemsCubit>(
    () => SearchItemsCubit(searchItemsUsecase: sl.call()),
  );
  sl.registerFactory<FavouriteCubit>(
    () => FavouriteCubit(
        favouriteViewUsecase: sl.call(),
        favouriteAddUsecase: sl.call(),
        favouriteRemoveUsecase: sl.call()),
  );
//usecases
  sl.registerLazySingleton<GetHomeDataUsecase>(
    () => GetHomeDataUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<GetItemsUsecase>(
    () => GetItemsUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<GetCountItemsUsecase>(
    () => GetCountItemsUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<DecreaseItemsUsecase>(
    () => DecreaseItemsUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<IncreaseItemsUsecase>(
    () => IncreaseItemsUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<SearchItemsUsecase>(
    () => SearchItemsUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<FavouriteViewUsecase>(
    () => FavouriteViewUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<FavouriteAddUsecase>(
    () => FavouriteAddUsecase(reqository: sl.call()),
  );
  sl.registerLazySingleton<FavouriteRemoveUsecase>(
    () => FavouriteRemoveUsecase(reqository: sl.call()),
  );
//repo&data
  sl.registerLazySingleton<HomeReqository>(
    () => HomeRepositoryImp(dataSource: sl.call()),
  );
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImp(networkServices: sl.call()),
  );
}
