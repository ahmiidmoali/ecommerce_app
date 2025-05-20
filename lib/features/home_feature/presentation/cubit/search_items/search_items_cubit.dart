import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/usecases/search_items_usecase.dart';
import 'package:equatable/equatable.dart';

part 'search_items_state.dart';

class SearchItemsCubit extends Cubit<SearchItemsState> {
  final SearchItemsUsecase searchItemsUsecase;
  SearchItemsCubit({required this.searchItemsUsecase})
      : super(SearchItemsInitial());

  Future<void> searchItems(String search) async {
    try {
      emit(SearchItemsLoading());
      searchItemsUsecase.call(search).then(
        (items) {
          if (items.isNotEmpty) {
            emit(SearchItemsLoaded(items: items));
          } else {
            emit(SearchItemsFailed());
          }
        },
      );
    } catch (e) {
      emit(SearchItemsFailed());
    }
  }

  releaseSearch(String value) {
    if (value.isEmpty) {
      emit(SearchItemsInitial());
    }
  }
}
