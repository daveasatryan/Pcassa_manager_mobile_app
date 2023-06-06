// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchState on SearchStateBase, Store {
  late final _$searchResultAtom =
      Atom(name: 'SearchStateBase.searchResult', context: context);

  @override
  ObservableList<SearchByNameModel> get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(ObservableList<SearchByNameModel> value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  late final _$searchResultByScanAtom =
      Atom(name: 'SearchStateBase.searchResultByScan', context: context);

  @override
  SearchByNameModel? get searchResultByScan {
    _$searchResultByScanAtom.reportRead();
    return super.searchResultByScan;
  }

  @override
  set searchResultByScan(SearchByNameModel? value) {
    _$searchResultByScanAtom.reportWrite(value, super.searchResultByScan, () {
      super.searchResultByScan = value;
    });
  }

  @override
  String toString() {
    return '''
searchResult: ${searchResult},
searchResultByScan: ${searchResultByScan}
    ''';
  }
}
