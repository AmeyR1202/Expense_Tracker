lib/
├── main.dart
│
├── core/
│ ├── router/
│ │ └── app_router.dart
│ │
│ ├── theme/
│ │ └── app_theme.dart
│ │
│ ├── utils/
│ │ ├── responsive_wrapper.dart
│ │ └── constants.dart
│ │
│ └── errors/
│ └── failures.dart
│
├── features/
│ ├── splash/
│ │ └── presentation/
│ │ └── pages/
│ │ └── splash_page.dart
│ │
│ └── expense/
│ ├── domain/
│ │ ├── entities/
│ │ │ └── expense_entity.dart
│ │ ├── repositories/
│ │ │ └── expense_repository.dart
│ │ └── usecases/
│ │ ├── get_expenses.dart
│ │ ├── add_expense.dart
│ │ └── delete_expense.dart
│ │
│ ├── data/
│ │ ├── models/
│ │ │ └── expense_model.dart
│ │ ├── datasources/
│ │ │ └── expense_local_datasource.dart
│ │ └── repositories/
│ │ └── expense_repository_impl.dart
│ │
│ └── presentation/
│ ├── bloc/
│ │ ├── expense_bloc.dart
│ │ ├── expense_event.dart
│ │ └── expense_state.dart
│ │
│ ├── pages/
│ │ ├── expense_list_page.dart
│ │ └── add_expense_page.dart
│ │
│ └── widgets/
│ ├── wallet_summary_card.dart
│ ├── expense_tile.dart
│ └── filter_row.dart
│
└── injection_container.dart   (optional, later)
