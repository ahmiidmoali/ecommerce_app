import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

class UserRepositoryImp extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImp({required this.remoteDataSource});
  @override
  Future<RequestResult> checkMail(String email) =>
      remoteDataSource.checkMail(email);

  @override
  Future<UserModel> logIn(String email, String password) =>
      remoteDataSource.logIn(email, password);

  @override
  Future<RequestResult> resendCodeSignUp(String email) =>
      remoteDataSource.resendCodeSignUp(email);

  @override
  Future<RequestResult> resetPassword(String email, String password) =>
      remoteDataSource.resetPassword(email, password);

  @override
  Future<RequestResult> signUp(UserEntity user) =>
      remoteDataSource.signUp(user);

  @override
  Future<RequestResult> verifyCodeFP(String email, String verifyCode) =>
      remoteDataSource.verifyCodeFP(email, verifyCode);

  @override
  Future<RequestResult> verifyCodeSignUp(String email, String verifyCode) =>
      remoteDataSource.verifyCodeSignUp(email, verifyCode);
}
