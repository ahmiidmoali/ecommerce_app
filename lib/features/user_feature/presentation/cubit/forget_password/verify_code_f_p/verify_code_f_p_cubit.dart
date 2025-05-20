import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/resend_code_sign_up_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/verify_code_f_p_usercase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../app_feature/global/functions/fetch_remote_data.dart';

part 'verify_code_f_p_state.dart';

class VerifyCodeFPCubit extends Cubit<VerifyCodeFPState> {
  final VerifyCodeFPUsercase verifyCodeFPUsercase;
  final ResendCodeSignUpUsercase resendCodeSignUpUsercase;
  VerifyCodeFPCubit(
      {required this.verifyCodeFPUsercase,
      required this.resendCodeSignUpUsercase})
      : super(VerifyCodeFPInitial());
  Future<void> verifyCodeFP(String email, String verifyCode) async {
    try {
      await verifyCodeFPUsercase.call(email, verifyCode).then(
        (result) {
          if (result == RequestResult.success) {
            emit(VerifyCodeFPSuccess());
          } else {
            emit(VerifyCodeFPFailed());
          }
        },
      );
    } catch (e) {
      emit(VerifyCodeFPFailed());
    }
  }

  Future<void> resendCode(String email) async {
    try {
      await resendCodeSignUpUsercase.call(email).then(
        (result) {
          if (result == RequestResult.success) {
            emit(VerifyCodeFPResendsuccess());
          } else {
            emit(VerifyCodeFPResendFailed());
          }
        },
      );
    } catch (e) {
      emit(VerifyCodeFPResendFailed());
    }
  }
}
