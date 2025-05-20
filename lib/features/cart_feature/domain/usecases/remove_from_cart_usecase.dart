import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/repository/cart_repository.dart';

class RemoveFromCartUsecase {
  final CartRepository repository;

  RemoveFromCartUsecase({required this.repository});
  Future<RequestResult> call(String usersId, String itemsId) async {
    return await repository.removeFromCart(usersId, itemsId);
  }
}
