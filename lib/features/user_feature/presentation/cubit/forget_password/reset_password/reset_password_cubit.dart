import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/reset_password_usercase.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsercase resetPasswordUsercase;
  ResetPasswordCubit({required this.resetPasswordUsercase})
      : super(ResetPasswordInitial());

  Future<void> resetPassword(String email, String password) async {
    try {
      emit(ResetPasswordLoading());
      await resetPasswordUsercase.call(email, password).then(
        (result) {
          if (result == RequestResult.success) {
            emit(ResetPasswordSuccess());
          } else {
            emit(ResetPasswordFailed());
          }
        },
      );
    } catch (e) {
      emit(ResetPasswordFailed());
    }
  }
}
