import 'package:expense_tracker/feature/expense/presentation/add_transaction/bloc/add_transaction_event.dart';
import 'package:expense_tracker/feature/expense/presentation/add_transaction/bloc/add_transaction_state.dart';
import 'package:expense_tracker/feature/expense/presentation/add_transaction/flow/add_transaction_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  AddTransactionBloc() : super(AddTransactionState.initial()) {
    // my event-handlers
    on<FlowStarted>(_onFlowStarted);
    on<TransactionTypeSelected>(_onTransactionTypeSelected);
    on<AmountDigitPressed>(_onAmountDigitPressed);
    on<AmountConfirmation>(_onAmountConfirmation);
    on<CategorySelected>(_onCategorySelected);
    on<NotesEntered>(_onNotesEntered);
    on<TransactionSubmitted>(_onTransactionSubmitted);
  }

  // Flow Lifecyle start
  void _onFlowStarted(FlowStarted event, Emitter<AddTransactionState> emit) {
    emit(AddTransactionState.initial());
  }

  // TRANSACTION TYPE STEP

  void _onTransactionTypeSelected(
    TransactionTypeSelected event,
    Emitter<AddTransactionState> emit,
  ) {
    emit(
      state.copyWith(type: event.type, step: AddTransactionStep.enterAmount),
    );
  }

  // AMOUNT ENTRY

  void _onAmountDigitPressed(
    AmountDigitPressed event,
    Emitter<AddTransactionState> emit,
  ) {
    final double newAmount = (state.amount * 10 + event.digit).clamp(
      0,
      9999999,
    );

    emit(state.copyWith(amount: newAmount));
  }

  void _onAmountConfirmation(
    AmountConfirmation event,
    Emitter<AddTransactionState> emit,
  ) {
    if (state.amount <= 0) return;
    emit(state.copyWith(step: AddTransactionStep.selectCategory));
  }

  // CATEGORY SELECTION

  void _onCategorySelected(
    CategorySelected event,
    Emitter<AddTransactionState> emit,
  ) {
    emit(
      state.copyWith(
        category: event.category,
        step: AddTransactionStep.addDetails,
      ),
    );
  }

  // NOTES / TransactionPage

  void _onNotesEntered() {}
}
