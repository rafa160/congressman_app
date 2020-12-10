// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congressman_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CongressmanStore on _CongressmanStore, Store {
  final _$resultsAtom = Atom(name: '_CongressmanStore.results');

  @override
  ObservableFuture<Congressman> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<Congressman> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$queryAtom = Atom(name: '_CongressmanStore.query');

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$_CongressmanStoreActionController =
      ActionController(name: '_CongressmanStore');

  @override
  void setQuery(String name) {
    final _$actionInfo = _$_CongressmanStoreActionController.startAction(
        name: '_CongressmanStore.setQuery');
    try {
      return super.setQuery(name);
    } finally {
      _$_CongressmanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllCongressmen() {
    final _$actionInfo = _$_CongressmanStoreActionController.startAction(
        name: '_CongressmanStore.getAllCongressmen');
    try {
      return super.getAllCongressmen();
    } finally {
      _$_CongressmanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCongressmanByUrl(String url) {
    final _$actionInfo = _$_CongressmanStoreActionController.startAction(
        name: '_CongressmanStore.getCongressmanByUrl');
    try {
      return super.getCongressmanByUrl(url);
    } finally {
      _$_CongressmanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCongressmanById(int id) {
    final _$actionInfo = _$_CongressmanStoreActionController.startAction(
        name: '_CongressmanStore.getCongressmanById');
    try {
      return super.getCongressmanById(id);
    } finally {
      _$_CongressmanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results},
query: ${query}
    ''';
  }
}
