import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

class SignUpUsercase {
  final UserRepository repository;

  SignUpUsercase({required this.repository});

  Future<RequestResult> call(UserEntity user) async {
    return await repository.signUp(user);
  }
}
