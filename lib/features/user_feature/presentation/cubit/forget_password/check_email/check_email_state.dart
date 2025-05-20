part of 'check_email_cubit.dart';

sealed class CheckEmailState extends Equatable {
  const CheckEmailState();

  @override
  List<Object> get props => [];
}

final class CheckEmailInitial extends CheckEmailState {}

final class CheckEmailLoading extends CheckEmailState {}

final class CheckEmailSuccess extends CheckEmailState {}

final class CheckEmailFailed extends CheckEmailState {}
