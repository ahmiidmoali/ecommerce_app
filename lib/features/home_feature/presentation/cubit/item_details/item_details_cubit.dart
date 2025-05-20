import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/decrease_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/get_count_items_usecase.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/increase_items_usecase.dart';

import 'package:equatable/equatable.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  final GetCountItemsUsecase getCountItemsUsecase;
  final IncreaseItemsUsecase increaseItemsUsecase;
  final DecreaseItemsUsecase decreaseItemsUsecase;
  ItemDetailsCubit({
    required this.getCountItemsUsecase,
    required this.increaseItemsUsecase,
    required this.decreaseItemsUsecase,
  }) : super(ItemDetailsInitial(itemCount: 0));

  Future<void> increase(String usersId, String itemsId) async {
    try {
      emit(ItemDetailsGetCountLoading(itemCount: state.itemCount));
      await increaseItemsUsecase.call(usersId, itemsId).then(
        (data) {
          if (data == RequestResult.success) {
            emit(ItemDetailsIncrease(itemCount: state.itemCount + 1));
          } else {
            emit(ItemDetailsGetCountfailed(itemCount: state.itemCount));
          }
        },
      );
    } catch (e) {
      emit(ItemDetailsGetCountfailed(itemCount: state.itemCount));
    }
  }

  Future<void> decrease(String usersId, String itemsId) async {
    try {
      emit(ItemDetailsGetCountLoading(itemCount: state.itemCount));
      await decreaseItemsUsecase.call(usersId, itemsId).then(
        (data) {
          if (data == RequestResult.success) {
            emit(ItemDetailsDecrease(itemCount: state.itemCount - 1));
          } else {
            emit(ItemDetailsGetCountfailed(itemCount: state.itemCount));
          }
        },
      );
    } catch (e) {
      emit(ItemDetailsGetCountfailed(itemCount: state.itemCount));
    }
  }

  Future<void> getCountData(String usersId, String itemsId) async {
    try {
      emit(ItemDetailsGetCountLoading(itemCount: state.itemCount));
      await getCountItemsUsecase.call(usersId, itemsId).then(
        (data) {
          emit(ItemDetailsGetCountLoaded(itemCount: data));
        },
      );
    } catch (e) {
      emit(ItemDetailsGetCountfailed(itemCount: state.itemCount));
    }
  }
}
