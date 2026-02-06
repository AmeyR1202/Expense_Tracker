import 'package:spend_wise/feature/expense/presentation/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:spend_wise/feature/expense/presentation/add_transaction/bloc/add_transaction_event.dart';
import 'package:spend_wise/feature/expense/presentation/add_transaction/bloc/add_transaction_state.dart';
import 'package:spend_wise/feature/expense/presentation/add_transaction/flow/add_transaction_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  bool _typeSheetShown = false;

  @override
  void initState() {
    super.initState();

    context.read<AddTransactionBloc>().add(FlowStarted());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleStep(context, AddTransactionStep.chooseType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTransactionBloc, AddTransactionState>(
      listenWhen: (previous, current) => previous.step != current.step,
      listener: (context, state) {
        _handleStep(context, state.step);
      },
      child: const Scaffold(backgroundColor: Colors.white),
    );
  }

  void _handleStep(BuildContext context, AddTransactionStep step) {
    switch (step) {
      case AddTransactionStep.chooseType:
        if (!_typeSheetShown) {
          _typeSheetShown = true;
          _showTypeSheet(context);
        }
        break;

      case AddTransactionStep.enterAmount:
        _showAmountSheet(context);
        break;

      case AddTransactionStep.selectCategory:
        // TODO: show category sheet
        break;

      case AddTransactionStep.addDetails:
        // TODO: show details sheet
        break;

      case AddTransactionStep.completed:
        Navigator.of(context).pop();
        break;
    }
  }

  void _showTypeSheet(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isDismissible: true,
        builder: (_) => const SizedBox(
          height: 200,
          child: Center(child: Text('TYPE SHEET')),
        ),
      );
    });
  }

  void _showAmountSheet(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isDismissible: false,
        builder: (_) => const SizedBox(
          height: 300,
          child: Center(child: Text('AMOUNT SHEET')),
        ),
      );
    });
  }
}
