part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String error;

  @override
  List<Object> get props => [email, password, status, error];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    String? error,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error ?? this.error);
  }
}
