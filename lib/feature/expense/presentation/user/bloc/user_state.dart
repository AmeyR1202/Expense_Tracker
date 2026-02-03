import 'package:expense_tracker/core/state/status.dart';
import 'package:expense_tracker/feature/expense/domain/entities/user_entity.dart';

class UserState {
  final Status status;
  final UserEntity? user;

  UserState({required this.status, this.user});

  factory UserState.initial() {
    return UserState(status: Status.initial);
  }

  UserState copyWith({Status? status, UserEntity? user}) {
    return UserState(status: status ?? this.status, user: user ?? this.user);
  }
}
