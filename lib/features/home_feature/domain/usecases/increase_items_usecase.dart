import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class IncreaseItemsUsecase {
  final HomeReqository reqository;

  IncreaseItemsUsecase({required this.reqository});
  Future<RequestResult> call(String usersId, String itemsId) async {
    return await reqository.addToCart(usersId, itemsId);
  }
}
