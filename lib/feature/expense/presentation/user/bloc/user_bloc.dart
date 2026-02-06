import 'package:spend_wise/core/state/status.dart';
import 'package:spend_wise/feature/expense/domain/usecases/get_user_usecase.dart';
import 'package:spend_wise/feature/expense/presentation/user/bloc/user_event.dart';
import 'package:spend_wise/feature/expense/presentation/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;

  UserBloc({required this.getUserUseCase}) : super(UserState.initial()) {
    on<LoadUser>(_onLoadUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final user = await getUserUseCase();

    emit(state.copyWith(status: Status.success, user: user));
  }
}
