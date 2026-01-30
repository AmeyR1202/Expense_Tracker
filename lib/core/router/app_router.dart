import 'package:expense_tracker/feature/expense/presentation/dashboard/dashboard_screen.dart';
import 'package:expense_tracker/feature/expense/presentation/enter_name/enter_name_screen.dart';
import 'package:expense_tracker/feature/expense/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) =>
          DashboardScreen(), // change to dashboard page later
    ),
    GoRoute(
      path: '/enter-name',
      builder: (context, state) => const EnterNameScreen(),
    ),
  ],
);
