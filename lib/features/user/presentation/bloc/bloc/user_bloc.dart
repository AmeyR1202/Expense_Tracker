import 'package:expense_tracker/features/user/domain/models/user.dart';
import 'package:expense_tracker/features/user/domain/repositories/user_repository.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_event.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserLoading()) {
    on<UserCheckRequested>(_onCheck);
    on<UserSaveRequested>(_onSave);
    on<UserLogoutRequested>(_userLogout);
  }

  Future<void> _onCheck(
    UserCheckRequested event,
    Emitter<UserState> emit,
  ) async {
    final user = await repository.getUser();
    if (user == null) {
      emit(UserUnauthenticated());
    } else {
      emit(UserAuthenticated(user.name));
    }
  }

  Future<void> _onSave(
    UserSaveRequested event,
    Emitter<UserState> emit,
  ) async {
    await repository.saveUser(User(name: event.name));
    emit(UserAuthenticated(event.name));
  }

  Future<void> _userLogout(
    UserLogoutRequested event,
    Emitter<UserState> emit,
  ) async {
    await repository.cleanUser();
    emit(UserUnauthenticated());
  }
}
