import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

class VerifyCodeSignUpUsercase {
  final UserRepository repository;

  VerifyCodeSignUpUsercase({required this.repository});

  Future<RequestResult> call(String email, String verifyCode) async {
    return await repository.verifyCodeSignUp(email, verifyCode);
  }
}
