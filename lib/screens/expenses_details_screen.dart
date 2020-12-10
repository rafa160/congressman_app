import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_congressman_app/mobx_stores/expenses_store.dart';
import 'package:new_congressman_app/screens/background/background_one.dart';
import 'package:new_congressman_app/service/expenses_repository.dart';
import 'package:mobx/mobx.dart';

import '../widgets/expenses_details_card.dart';

class ExpensesDetailsScreen extends StatefulWidget {
  final int id;

  const ExpensesDetailsScreen({Key key, this.id}) : super(key: key);

  @override
  _ExpensesDetailsScreenState createState() => _ExpensesDetailsScreenState();
}

class _ExpensesDetailsScreenState extends State<ExpensesDetailsScreen> {
  ExpensesStore _expensesStore;

  @override
  void initState() {
    super.initState();
    _expensesStore = ExpensesStore(new ExpensesRepository());
    _expensesStore.getExpensesById(widget.id);
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundOne(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: Text('despesas'),
            ),
            Expanded(
                child:
                    Observer(
                      builder: (_) {
                        final expenses = _expensesStore.results?.value?.data;
                        if(_expensesStore.results?.status == FutureStatus.rejected){
                          return Text('error');
                        } else if (_expensesStore.results.status == FutureStatus.pending){
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
                              ),
                            ),
                          );
                        }else if(_expensesStore.results.value.data.isEmpty == true){
                          return Text('nenhuma despesa encontrada');
                        }
                        return ListView.builder(
                          itemCount: expenses.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = expenses[index];
                            return ExpensesDetailsCard(
                              docType: item.docType,
                              expenseType: item.expensesType,
                              providerName: item.providerName,
                              date: item.docDate,
                              value: item.docValue,
                              docUrl: item.docUrl,
                            );
                          }
                        );
                      },
                )
            ),
          ],
        ),
      ),
    );
  }
}
