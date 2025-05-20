import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class SearchItemsUsecase {
  final HomeReqository reqository;

  SearchItemsUsecase({required this.reqository});
  Future<List<ItemsEntity>> call(String search) async {
    return await reqository.searchItems(search);
  }
}
