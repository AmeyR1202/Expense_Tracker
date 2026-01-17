abstract class UserEvent {}

class UserCheckRequested extends UserEvent {}

class UserSaveRequested extends UserEvent {
  final String name;
  UserSaveRequested({required this.name});
}

class UserLogoutRequested extends UserEvent {}
