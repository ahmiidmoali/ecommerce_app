import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/repository/cart_repository.dart';

class ViewCartItemsUsecase {
  final CartRepository repository;

  ViewCartItemsUsecase({required this.repository});
  Future<List<CartEntity>> call(String usersId) async {
    return await repository.viewCartItems(usersId);
  }
}
