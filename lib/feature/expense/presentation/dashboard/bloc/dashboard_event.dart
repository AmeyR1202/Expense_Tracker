abstract class DashboardEvent {
  const DashboardEvent();
}

class DashboardStarted extends DashboardEvent {
  final DateTime month;

  const DashboardStarted(this.month);
}
