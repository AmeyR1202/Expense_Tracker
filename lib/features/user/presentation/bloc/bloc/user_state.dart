abstract class UserState {}

class UserLoading extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {
  final String name;
  UserAuthenticated(this.name);
}
