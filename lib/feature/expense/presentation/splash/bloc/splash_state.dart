import 'package:spend_wise/core/state/status.dart';

class SplashState {
  final Status status;
  final bool isUserPresent;
  final String? errorMessage;

  const SplashState({
    required this.status,
    required this.isUserPresent,
    this.errorMessage,
  });

  factory SplashState.initial() {
    return const SplashState(status: Status.initial, isUserPresent: false);
  }

  SplashState copyWith({
    Status? status,
    bool? isUserPresent,
    String? errorMessage,
  }) {
    return SplashState(
      status: status ?? this.status,
      isUserPresent: isUserPresent ?? this.isUserPresent,
      errorMessage: errorMessage,
    );
  }
}
