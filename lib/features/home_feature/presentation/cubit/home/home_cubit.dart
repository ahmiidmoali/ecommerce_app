import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/models/ads_model.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/models/categories_model.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/data/models/items_model.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/ads_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/categories_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_home_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUsecase getHomeDataUsercase;
  HomeCubit({required this.getHomeDataUsercase}) : super(HomeInitial());

  Future<void> getHomeData(String uid) async {
    try {
      emit(HomeLoading());
      await getHomeDataUsercase.call(uid).then(
        (data) {
          List<CategoriesEntity> categories = [];
          List categoriesJson = data["categories"];
          categories
              .addAll(categoriesJson.map((e) => CategoriesModel.fromJson(e)));
          //------items------------
          List<ItemsEntity> items = [];
          List itemsJson = data["topselling"];
          items.addAll(itemsJson.map((e) => ItemsModel.fromJson(e)));
          //-------ads----------
          List<AdsEntity> ads = [];
          List adsJson = data["ads"];
          ads.addAll(adsJson.map((e) => AdsModel.fromJson(e)));

          emit(HomeLoaded(categories: categories, items: items, ads: ads));
        },
      );
    } catch (e) {
      emit(HomeFailed());
    }
  }
}
