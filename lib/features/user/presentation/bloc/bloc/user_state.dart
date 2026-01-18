abstract class UserState {}

class UserLoading extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {
  final String name;
  UserAuthenticated(this.name);
}

class UserNameError extends UserState {
  final String message;
  UserNameError(this.message);
}
