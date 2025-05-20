import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/sign_up_usercase.dart';
import 'package:equatable/equatable.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsercase signUpUsercase;
  SignUpCubit({required this.signUpUsercase}) : super(SignUpInitial());
  Future<void> signUp(UserEntity user) async {
    try {
      emit(SignUpILoading());
      await signUpUsercase.call(user).then(
        (result) {
          if (result == RequestResult.success) {
            emit(SignUpSuccess());
          } else {
            emit(SignUpFailed());
          }
        },
      );
    } catch (e) {
      emit(SignUpFailed());
    }
  }
}
