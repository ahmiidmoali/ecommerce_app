import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/resend_code_sign_up_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/verify_code_sign_up_usercase.dart';
import 'package:equatable/equatable.dart';

part 'verify_sign_up_state.dart';

class VerifySignUpCubit extends Cubit<VerifySignUpState> {
  final VerifyCodeSignUpUsercase verifyCodeSignUpUsercase;
  final ResendCodeSignUpUsercase resendCodeSignUpUsercase;
  VerifySignUpCubit({
    required this.verifyCodeSignUpUsercase,
    required this.resendCodeSignUpUsercase,
  }) : super(VerifySignUpInitial());

  Future<void> verify(String email, String verifyCode) async {
    try {
      await verifyCodeSignUpUsercase.call(email, verifyCode).then(
        (result) {
          if (result == RequestResult.success) {
            emit(VerifySignSuccess());
          } else {
            emit(VerifySignFailed());
          }
        },
      );
    } catch (e) {
      emit(VerifySignFailed());
    }
  }

  Future<void> resendCode(String email) async {
    try {
      await resendCodeSignUpUsercase.call(email).then(
        (result) {
          if (result == RequestResult.success) {
            emit(VerifyResendsuccess());
          } else {
            emit(VerifyResendFailed());
          }
        },
      );
    } catch (e) {
      emit(VerifyResendFailed());
    }
  }
}
