import 'package:spend_wise/core/state/status.dart';
import 'package:spend_wise/feature/expense/domain/usecases/get_monthly_summary_usecase.dart';
import 'package:spend_wise/feature/expense/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:spend_wise/feature/expense/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetMonthlySummaryUsecase getMonthlySummaryUsecase;

  DashboardBloc({required this.getMonthlySummaryUsecase})
    : super(DashboardState.initial()) {
    on<DashboardStarted>(_onDashboardStarted);
  }

  Future<void> _onDashboardStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final summary = await getMonthlySummaryUsecase(event.month);

      emit(state.copyWith(status: Status.success, summary: summary));
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: 'Failed to load dashboard',
        ),
      );
    }
  }
}
