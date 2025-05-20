import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

class VerifyCodeFPUsercase {
  final UserRepository repository;

  VerifyCodeFPUsercase({required this.repository});

  Future<RequestResult> call(String email, String verifyCode) async {
    return await repository.verifyCodeFP(email, verifyCode);
  }
}
