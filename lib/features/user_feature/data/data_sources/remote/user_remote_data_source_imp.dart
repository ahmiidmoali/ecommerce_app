import 'package:enhanced_ecommerce_app/features/app_feature/global/services/network_services.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';
import '../../../../app_feature/global/functions/fetch_remote_data.dart';

class UserRemoteDataSourceImp extends UserRemoteDataSource {
  final NetworkServices networkServices;

  UserRemoteDataSourceImp({required this.networkServices});
  @override
  Future<RequestResult> signUp(UserEntity user) async {
    Map data = {
      "username": user.usersName,
      "email": user.usersEmail,
      "phone": user.usersPhone,
      "password": user.usersPassword
    };
    return await networkServices.postCheckSuccess(
        link: AppLink.signup, body: data);
  }

  @override
  Future<RequestResult> verifyCodeSignUp(
      String email, String verifyCode) async {
    return await networkServices.postCheckSuccess(
        link: AppLink.verifycode,
        body: {"email": email, "verifycode": verifyCode});
  }

  //----------------------

  @override
  Future<UserModel> logIn(String email, String password) async {
    try {
      Map<String, dynamic> response = await networkServices.postGetData(
          link: AppLink.login, body: {"email": email, "password": password});
      print(response);

      return UserModel.fromJson(response);
    } catch (e) {
      return UserModel();
    }
  }

  @override
  Future<RequestResult> resendCodeSignUp(String email) async {
    return await networkServices
        .postCheckSuccess(link: AppLink.resend, body: {"email": email});
  }

  //----------------------
  @override
  Future<RequestResult> checkMail(String email) async {
    return await networkServices
        .postCheckSuccess(link: AppLink.checkemailF, body: {"email": email});
  }

  @override
  Future<RequestResult> verifyCodeFP(String email, String verifyCode) async {
    return await networkServices.postCheckSuccess(
        link: AppLink.verifycodeF,
        body: {"email": email, "verifycode": verifyCode});
  }

  @override
  Future<RequestResult> resetPassword(String email, String password) async {
    return await networkServices.postCheckSuccess(
        link: AppLink.resetpasswordF,
        body: {"email": email, "password": password});
  }
}
