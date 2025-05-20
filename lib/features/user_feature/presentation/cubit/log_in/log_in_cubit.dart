import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/models/user_model.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/log_in_usercase.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:equatable/equatable.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInUsercase logInUsercase;

  LogInCubit({required this.logInUsercase}) : super(LogInInitial());

  Future login(String email, String password) async {
    emit(LogInLoading());

    await logInUsercase.call(email, password).then(
      (user) {
        if (user.usersName != null) {
          if (user.usersApprove == 1) {
            sharedPreferences.setString(
                AppSharedKeys.id, user.usersId.toString());
            emit(LogInLoaded(user: user));
          } else {
            emit(LogInEmailNotVerified(email: user.usersEmail!));
          }
        } else {
          emit(LogInFailure());
        }
      },
    );
  }
}
