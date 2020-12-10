import 'package:mobx/mobx.dart';
import 'package:new_congressman_app/models/expenses.dart';
import 'package:new_congressman_app/service/expenses_repository.dart';

part 'expenses_store.g.dart';

class ExpensesStore =_ExpensesStore with _$ExpensesStore;

abstract class _ExpensesStore with Store {

  final ExpensesRepository expensesRepository;

  _ExpensesStore(this.expensesRepository);

  @observable
  ObservableFuture<Expenses> results = ObservableFuture.value(new Expenses(data: []));

  @action
  void getExpensesById(int id) {
    results = expensesRepository.getExpensesById('$id').asObservable();
  }
}