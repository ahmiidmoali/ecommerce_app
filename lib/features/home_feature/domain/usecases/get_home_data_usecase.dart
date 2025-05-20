import 'package:enhanced_ecommerce_app/features/home_feature/domain/repository/home_reqository.dart';

class GetHomeDataUsecase {
  final HomeReqository reqository;

  GetHomeDataUsecase({required this.reqository});
  Future<Map> call(String uid) async {
    return await reqository.getHomeData(uid);
  }
}
