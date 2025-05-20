import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

class LogInUsercase {
  final UserRepository repository;

  LogInUsercase({required this.repository});

  Future<UserModel> call(String email, String password) async {
    return await repository.logIn(email, password);
  }
}
