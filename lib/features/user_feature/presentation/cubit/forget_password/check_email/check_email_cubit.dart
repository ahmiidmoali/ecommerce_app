import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/check_mail_usercase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../app_feature/global/functions/fetch_remote_data.dart';

part 'check_email_state.dart';

class CheckEmailCubit extends Cubit<CheckEmailState> {
  final CheckMailUsercase checkMailUsercase;
  CheckEmailCubit({required this.checkMailUsercase})
      : super(CheckEmailInitial());
  Future<void> checkEmail(String email) async {
    try {
      emit(CheckEmailLoading());
      await checkMailUsercase.call(email).then(
        (result) {
          if (result == RequestResult.success) {
            emit(CheckEmailSuccess());
          } else {
            emit(CheckEmailFailed());
          }
        },
      );
    } catch (e) {
      emit(CheckEmailFailed());
    }
  }
}
