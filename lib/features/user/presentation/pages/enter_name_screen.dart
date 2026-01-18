import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_bloc.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_event.dart';
import 'package:expense_tracker/features/user/presentation/bloc/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _error;

  void _submit() {
    final name = _controller.text.trim();

    if (name.isEmpty) {
      setState(() {
        _error = 'Name cannot be empty';
      });
      return;
    }

    context.read<UserBloc>().add(UserSaveRequested(name: name));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserAuthenticated) {
          context.go('/dashboard');
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Please enter your name to continue',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _controller,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                decoration: InputDecoration(
                  labelText: 'Your name',
                  errorText: _error,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
