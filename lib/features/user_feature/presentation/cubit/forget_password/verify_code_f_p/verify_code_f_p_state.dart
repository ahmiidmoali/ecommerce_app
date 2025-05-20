part of 'verify_code_f_p_cubit.dart';

sealed class VerifyCodeFPState extends Equatable {
  const VerifyCodeFPState();

  @override
  List<Object> get props => [];
}

final class VerifyCodeFPInitial extends VerifyCodeFPState {}

// final class VerifyCodeFPLoading extends VerifyCodeFPState {}

final class VerifyCodeFPSuccess extends VerifyCodeFPState {
  @override
  List<Object> get props => [];
}

final class VerifyCodeFPFailed extends VerifyCodeFPState {
  @override
  List<Object> get props => [];
}

final class VerifyCodeFPResendsuccess extends VerifyCodeFPState {
  @override
  List<Object> get props => [];
}

final class VerifyCodeFPResendFailed extends VerifyCodeFPState {
  @override
  List<Object> get props => [];
}
