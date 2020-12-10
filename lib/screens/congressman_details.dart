import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:new_congressman_app/mobx_stores/congressman_store.dart';
import 'package:new_congressman_app/screens/background/background_one.dart';
import 'package:new_congressman_app/screens/expenses_details_screen.dart';
import 'package:new_congressman_app/service/congressman_repository.dart';
import 'package:new_congressman_app/widgets/congressman_details_card.dart';

class CongressmanDetails extends StatefulWidget {

  final int id;

  const CongressmanDetails({Key key, this.id}) : super(key: key);

  @override
  _CongressmanDetailsState createState() => _CongressmanDetailsState();
}

class _CongressmanDetailsState extends State<CongressmanDetails> {

  CongressmanStore _congressmanStore;

  @override
  void initState() {
    super.initState();
    _congressmanStore = CongressmanStore(new CongressmanRepository());
    _congressmanStore.getCongressmanById(widget.id);
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
              title: Text('detalhes'),

            ),
            Expanded(
              child: Column(
                children: [
                  Observer(
                        builder: (_){
                          if(_congressmanStore.results?.status == FutureStatus.rejected) {
                            return Text('error');
                          } else if (_congressmanStore.results.status == FutureStatus.pending) {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
                                ),
                              ),
                            );
                          }
                          var congressman = _congressmanStore.results.value.data;
                          var item = congressman.first;
                          return CongressmanDetailsCard(
                            image: item.urlPhoto,
                            name: item.name,
                            email: item.email,
                            state: item.stateAcronym,
                            partyAcronym: item.partyAcronym,
                            voidCallbackExpenses: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ExpensesDetailsScreen(id: item.id,)));
                            },
                          );
                        },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
