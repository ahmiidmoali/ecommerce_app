part of 'verify_sign_up_cubit.dart';

sealed class VerifySignUpState extends Equatable {
  const VerifySignUpState();

  @override
  List<Object> get props => [];
}

final class VerifySignUpInitial extends VerifySignUpState {}

final class VerifySignUploading extends VerifySignUpState {}

final class VerifySignSuccess extends VerifySignUpState {}

final class VerifySignFailed extends VerifySignUpState {}

final class VerifyResendsuccess extends VerifySignUpState {}

final class VerifyResendFailed extends VerifySignUpState {}
