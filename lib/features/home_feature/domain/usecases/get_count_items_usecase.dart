import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class GetCountItemsUsecase {
  final HomeReqository reqository;

  GetCountItemsUsecase({required this.reqository});
  Future<int> call(String usersId, String itemsId) async {
    return await reqository.getCountItems(usersId, itemsId);
  }
}
