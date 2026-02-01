import 'package:expense_tracker/core/state/status.dart';
import 'package:expense_tracker/feature/expense/domain/entities/monthly_summary_entity.dart';

class DashboardState {
  final Status status;
  final MonthlySummaryEntity? summary;
  final String? errorMessage;

  const DashboardState({required this.status, this.summary, this.errorMessage});
  factory DashboardState.initial() {
    return const DashboardState(status: Status.initial);
  }

  DashboardState copyWith({
    Status? status,
    MonthlySummaryEntity? summary,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      summary: summary ?? this.summary,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
