import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? usersId;
  final String? usersName;
  final String? usersEmail;
  final String? usersPhone;
  final int? usersVerifycode;
  final String? usersPassword;
  final int? usersApprove;
  final String? usersCreate;

  UserEntity(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifycode,
      this.usersPassword,
      this.usersApprove,
      this.usersCreate});

  @override
  List<Object?> get props => [
        usersId,
        usersName,
        usersEmail,
        usersPhone,
        usersVerifycode,
        usersPassword,
        usersApprove,
        usersCreate
      ];
}
