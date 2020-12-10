// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesStore on _ExpensesStore, Store {
  final _$resultsAtom = Atom(name: '_ExpensesStore.results');

  @override
  ObservableFuture<Expenses> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<Expenses> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_ExpensesStoreActionController =
      ActionController(name: '_ExpensesStore');

  @override
  void getExpensesById(int id) {
    final _$actionInfo = _$_ExpensesStoreActionController.startAction(
        name: '_ExpensesStore.getExpensesById');
    try {
      return super.getExpensesById(id);
    } finally {
      _$_ExpensesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results}
    ''';
  }
}
