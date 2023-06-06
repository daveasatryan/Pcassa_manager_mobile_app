// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatedCurrencys on CreatedCurrencysBase, Store {
  late final _$currencyInfoAtom =
      Atom(name: 'CreatedCurrencysBase.currencyInfo', context: context);

  @override
  ObservableList<CurrencyModel> get currencyInfo {
    _$currencyInfoAtom.reportRead();
    return super.currencyInfo;
  }

  @override
  set currencyInfo(ObservableList<CurrencyModel> value) {
    _$currencyInfoAtom.reportWrite(value, super.currencyInfo, () {
      super.currencyInfo = value;
    });
  }

  late final _$currencyShortNamesAtom =
      Atom(name: 'CreatedCurrencysBase.currencyShortNames', context: context);

  @override
  ObservableList<String> get currencyShortNames {
    _$currencyShortNamesAtom.reportRead();
    return super.currencyShortNames;
  }

  @override
  set currencyShortNames(ObservableList<String> value) {
    _$currencyShortNamesAtom.reportWrite(value, super.currencyShortNames, () {
      super.currencyShortNames = value;
    });
  }

  late final _$getCreatedCurencysAsyncAction =
      AsyncAction('CreatedCurrencysBase.getCreatedCurencys', context: context);

  @override
  Future<void> getCreatedCurencys() {
    return _$getCreatedCurencysAsyncAction
        .run(() => super.getCreatedCurencys());
  }

  late final _$updateCurencysAsyncAction =
      AsyncAction('CreatedCurrencysBase.updateCurencys', context: context);

  @override
  Future<void> updateCurencys(
      {required dynamic cod,
      required dynamic gguid,
      required dynamic name,
      required dynamic short_name,
      required dynamic tip,
      required dynamic tip_oplati,
      required dynamic b_valyuta,
      required dynamic status,
      required dynamic spisanie,
      required dynamic method_round}) {
    return _$updateCurencysAsyncAction.run(() => super.updateCurencys(
        cod: cod,
        gguid: gguid,
        name: name,
        short_name: short_name,
        tip: tip,
        tip_oplati: tip_oplati,
        b_valyuta: b_valyuta,
        status: status,
        spisanie: spisanie,
        method_round: method_round));
  }

  late final _$deleteCurrencyAsyncAction =
      AsyncAction('CreatedCurrencysBase.deleteCurrency', context: context);

  @override
  Future<void> deleteCurrency({required dynamic cod}) {
    return _$deleteCurrencyAsyncAction
        .run(() => super.deleteCurrency(cod: cod));
  }

  late final _$CreatedCurrencysBaseActionController =
      ActionController(name: 'CreatedCurrencysBase', context: context);

  @override
  dynamic getShortNames() {
    final _$actionInfo = _$CreatedCurrencysBaseActionController.startAction(
        name: 'CreatedCurrencysBase.getShortNames');
    try {
      return super.getShortNames();
    } finally {
      _$CreatedCurrencysBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currencyInfo: ${currencyInfo},
currencyShortNames: ${currencyShortNames}
    ''';
  }
}
