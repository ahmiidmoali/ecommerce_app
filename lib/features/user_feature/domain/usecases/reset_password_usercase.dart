import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

class ResetPasswordUsercase {
  final UserRepository repository;

  ResetPasswordUsercase({required this.repository});

  Future<RequestResult> call(String email, String password) async {
    return await repository.resetPassword(email, password);
  }
}
