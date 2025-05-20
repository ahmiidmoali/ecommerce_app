import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int? usersId;
  final String? usersName;
  final String? usersEmail;
  final String? usersPhone;
  final int? usersVerifycode;
  final String? usersPassword;
  final int? usersApprove;
  final String? usersCreate;

  UserModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifycode,
      this.usersPassword,
      this.usersApprove,
      this.usersCreate})
      : super(
            usersId: usersId,
            usersName: usersName,
            usersEmail: usersEmail,
            usersPhone: usersPhone,
            usersVerifycode: usersVerifycode,
            usersPassword: usersPassword,
            usersApprove: usersApprove,
            usersCreate: usersCreate);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usersId: json['users_id'],
      usersName: json['users_name'],
      usersEmail: json['users_email'],
      usersPhone: json['users_phone'],
      usersVerifycode: json['users_verifycode'],
      usersPassword: json['users_password'],
      usersApprove: json['users_approve'],
      usersCreate: json['users_create'],
    );
  }
  // Map<String, dynamic> toJsonStatic(UserModel user) {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['users_id'] = user.usersId;
  //   data['users_name'] = user.usersName;
  //   data['users_email'] = user.usersEmail;
  //   data['users_phone'] = user.usersPhone;
  //   data['users_verifycode'] = user.usersVerifycode;
  //   data['users_password'] = user.usersPassword;
  //   data['users_approve'] = user.usersApprove;
  //   data['users_create'] = user.usersCreate;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verifycode'] = usersVerifycode;
    data['users_password'] = usersPassword;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    return data;
  }
}
