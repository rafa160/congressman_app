import 'package:mobx/mobx.dart';
import 'package:new_congressman_app/models/congressman.dart';
import 'package:new_congressman_app/service/congressman_repository.dart';

part 'congressman_store.g.dart';

class CongressmanStore = _CongressmanStore with _$CongressmanStore;

abstract class _CongressmanStore with Store {

  final CongressmanRepository congressmanRepository;

  _CongressmanStore(this.congressmanRepository);

  @observable
  ObservableFuture<Congressman> results = ObservableFuture.value(new Congressman(data: []));

  @observable
  String query = '';


  @action
  void setQuery(String name) {
    query = name;
  }

  @action
  void getAllCongressmen(){
    results = congressmanRepository.getCongressmen().asObservable();
  }

  @action
  void getCongressmanByUrl(String url){
    results = congressmanRepository.getCongressmanByUrl(url).asObservable();
  }

  @action
  void getCongressmanById(int id){
    results = congressmanRepository.getCongressmanById('$id').asObservable();
  }
}