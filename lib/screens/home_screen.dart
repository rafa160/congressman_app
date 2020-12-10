import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_congressman_app/mobx_stores/congressman_store.dart';
import 'package:new_congressman_app/models/congressman.dart';
import 'package:mobx/mobx.dart';
import 'package:new_congressman_app/screens/background/background_one.dart';
import 'package:new_congressman_app/screens/congressman_details.dart';
import 'package:new_congressman_app/service/congressman_repository.dart';
import 'package:new_congressman_app/widgets/congressman_card.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CongressmanStore _congressmanStore;

  @override
  void initState() {
    _congressmanStore = CongressmanStore(new CongressmanRepository());
    _congressmanStore.getAllCongressmen();
    super.initState();
  }

  Future refresh() async {
    await Future.delayed(Duration(seconds: 4));
    _congressmanStore.getAllCongressmen();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh:  refresh,
        child: BackgroundOne(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:10),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                  centerTitle: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12,top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: _congressmanStore.setQuery,
                    onSubmitted:(s) => (){},
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        hintText: 'nome',
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
          Expanded(
                  child: Observer(
                    builder: (_) {
                      final dados = _congressmanStore.results?.value?.data;
                      if (dados == null) {
                        return Container();
                      }
                      if (_congressmanStore.results.status == FutureStatus.rejected) {
                        return Text('error');
                      } else if (_congressmanStore.results.value.data == null) {
                        return Center(child: CircularProgressIndicator());
                      } else if (_congressmanStore.results.status ==
                          FutureStatus.pending) {
                        return Center(child: CircularProgressIndicator());
                      } else if (_congressmanStore.results?.value ==  null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: GridView.builder(
                          shrinkWrap: true,
                            itemCount: dados?.length,
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 1.0),
                            itemBuilder: (BuildContext context, int index) {
                              var item = dados[index];
                              return CongressmanCard(
                                image: item.urlPhoto,
                                name: item.name,
                                state: item.stateAcronym,
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => CongressmanDetails(id: item.id,)));
                                },
                              );
                            }),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

}
