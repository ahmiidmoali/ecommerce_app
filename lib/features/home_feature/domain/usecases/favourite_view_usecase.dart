import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class FavouriteViewUsecase {
  final HomeReqository reqository;

  FavouriteViewUsecase({required this.reqository});
  Future<List<ItemsEntity>> call(String usersId) async {
    return await reqository.favouriteView(usersId);
  }
}
