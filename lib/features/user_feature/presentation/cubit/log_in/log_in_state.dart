part of 'log_in_cubit.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInLoaded extends LogInState {
  final UserModel user;

  LogInLoaded({required this.user});
  @override
  List<Object> get props => [user];
}

class LogInEmailNotVerified extends LogInState {
  final String email;

  LogInEmailNotVerified({required this.email});
  @override
  List<Object> get props => [email];
}

class LogInFailure extends LogInState {}
