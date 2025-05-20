import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_items_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final GetItemsUsecase getItemsUsercase;
  ItemsCubit({required this.getItemsUsercase}) : super(ItemsInitial());
  Map favouriteMap = {};

  setFavourite(id, fav) {
    favouriteMap[id] = fav;
  }

  Future<void> getItems(String uid, ItemsEntity item) async {
    try {
      emit(ItemsLoading());
      getItemsUsercase.call(uid, item).then(
        (items) {
          emit(ItemsLoaded(items: items));
        },
      );
    } catch (e) {
      emit(ItemsFailure());
    }
  }
}
