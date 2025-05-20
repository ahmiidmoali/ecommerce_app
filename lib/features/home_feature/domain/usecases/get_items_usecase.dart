import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class GetItemsUsecase {
  final HomeReqository reqository;

  GetItemsUsecase({required this.reqository});
  Future<List<ItemsEntity>> call(String uid, ItemsEntity item) async {
    return await reqository.getItems(uid, item);
  }
}
