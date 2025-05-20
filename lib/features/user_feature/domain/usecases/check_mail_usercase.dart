import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

class CheckMailUsercase {
  final UserRepository repository;

  CheckMailUsercase({required this.repository});

  Future<RequestResult> call(String email) async {
    return await repository.checkMail(email);
  }
}
