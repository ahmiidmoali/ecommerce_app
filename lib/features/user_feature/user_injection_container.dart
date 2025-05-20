import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/data_sources/remote/user_remote_data_source_imp.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/data/repository/user_repository_imp.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/repository/user_repository.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/check_mail_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/log_in_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/resend_code_sign_up_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/reset_password_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/sign_up_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/verify_code_f_p_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/usecases/verify_code_sign_up_usercase.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/forget_password/check_email/check_email_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/forget_password/reset_password/reset_password_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/forget_password/verify_code_f_p/verify_code_f_p_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/log_in/log_in_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/verify_sign/verify_sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/main_injection_container.dart';

Future<void> userInjectionContainer() async {
  //cubit-------------
  sl.registerFactory<LogInCubit>(
    () => LogInCubit(logInUsercase: sl.call()),
  );
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(signUpUsercase: sl.call()),
  );
  sl.registerFactory<VerifySignUpCubit>(
    () => VerifySignUpCubit(
        resendCodeSignUpUsercase: sl.call(),
        verifyCodeSignUpUsercase: sl.call()),
  );
  //forget password
  sl.registerFactory<CheckEmailCubit>(
    () => CheckEmailCubit(checkMailUsercase: sl.call()),
  );
  sl.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(resetPasswordUsercase: sl.call()),
  );
  sl.registerFactory<VerifyCodeFPCubit>(
    () => VerifyCodeFPCubit(
        resendCodeSignUpUsercase: sl.call(), verifyCodeFPUsercase: sl.call()),
  );

  //usercase-----------------------
  sl.registerLazySingleton<LogInUsercase>(
    () => LogInUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<SignUpUsercase>(
    () => SignUpUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<VerifyCodeSignUpUsercase>(
    () => VerifyCodeSignUpUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<ResendCodeSignUpUsercase>(
    () => ResendCodeSignUpUsercase(repository: sl.call()),
  );
  //----
  sl.registerLazySingleton<CheckMailUsercase>(
    () => CheckMailUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<ResetPasswordUsercase>(
    () => ResetPasswordUsercase(repository: sl.call()),
  );
  sl.registerLazySingleton<VerifyCodeFPUsercase>(
    () => VerifyCodeFPUsercase(repository: sl.call()),
  );

  //repository&dataremote----------------------
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImp(remoteDataSource: sl.call()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(networkServices: sl.call()));
}
