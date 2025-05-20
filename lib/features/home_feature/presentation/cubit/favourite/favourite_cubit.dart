import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_add_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_remove_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/favourite_view_usecase.dart';
import 'package:equatable/equatable.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteViewUsecase favouriteViewUsecase;
  final FavouriteAddUsecase favouriteAddUsecase;
  final FavouriteRemoveUsecase favouriteRemoveUsecase;
  FavouriteCubit(
      {required this.favouriteViewUsecase,
      required this.favouriteAddUsecase,
      required this.favouriteRemoveUsecase})
      : super(FavouriteInitial());
  int currentstate = 0;
  List<ItemsEntity> savedItems = [];

  fetchRemoving(String itemsId) {
    savedItems.removeWhere(
      (e) => e.itemsId.toString() == itemsId,
    );
  }

  Future<void> addToFavourite(String usersId, String itemsId) async {
    try {
      await favouriteAddUsecase.call(usersId, itemsId).then(
        (data) {
          if (data == RequestResult.success) {
            currentstate++;
            emit(FavouriteSwitchSuccess(currentState: currentstate));
          } else {
            emit(FavouriteSwitchFailed());
          }
        },
      );
    } catch (e) {
      emit(FavouriteSwitchFailed());
    }
  }

  Future<void> removeFromFavourite(String usersId, String itemsId) async {
    try {
      await favouriteRemoveUsecase.call(usersId, itemsId).then(
        (data) {
          if (data == RequestResult.success) {
            currentstate++;
            emit(FavouriteSwitchSuccess(currentState: currentstate));
          } else {
            emit(FavouriteSwitchFailed());
          }
        },
      );
    } catch (e) {
      emit(FavouriteSwitchFailed());
    }
  }

  Future<void> viewFavourite(String usersId) async {
    try {
      emit(FavouriteViewLoading());
      await favouriteViewUsecase.call(usersId).then(
        (data) {
          savedItems = data;
          emit(FavouriteViewLoaded(items: data));
        },
      );
    } catch (e) {
      emit(FavouriteViewFailed());
    }
  }

  Future<void> removeFromFavouriteList(String usersId, String itemsId) async {
    try {
      emit(FavouriteViewLoading());
      await favouriteRemoveUsecase.call(usersId, itemsId).then(
        (data) {
          if (data == RequestResult.success) {
            fetchRemoving(itemsId);
            emit(FavouriteViewLoaded(items: savedItems));
          } else {
            emit(FavouriteRemoveFromViewFailed(items: savedItems));
          }
        },
      );
    } catch (e) {
      emit(FavouriteRemoveFromViewFailed(items: savedItems));
    }
  }
}
