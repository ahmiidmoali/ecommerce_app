import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserModel> logIn(String email, String password);
  Future<RequestResult> resendCodeSignUp(String email);
  //signup
  Future<RequestResult> signUp(UserEntity user);
  Future<RequestResult> verifyCodeSignUp(String email, String verifyCode);

  //forget password
  Future<RequestResult> checkMail(String email);
  Future<RequestResult> verifyCodeFP(String email, String verifyCode);
  Future<RequestResult> resetPassword(String email, String password);
}
