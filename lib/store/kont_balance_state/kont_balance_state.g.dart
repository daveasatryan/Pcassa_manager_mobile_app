// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kont_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KontBalanceState on KontBalanceStateBase, Store {
  late final _$kontDocsListAtom =
      Atom(name: 'KontBalanceStateBase.kontDocsList', context: context);

  @override
  ObservableList<KontBalanceItemModel> get kontDocsList {
    _$kontDocsListAtom.reportRead();
    return super.kontDocsList;
  }

  @override
  set kontDocsList(ObservableList<KontBalanceItemModel> value) {
    _$kontDocsListAtom.reportWrite(value, super.kontDocsList, () {
      super.kontDocsList = value;
    });
  }

  late final _$endostatokAtom =
      Atom(name: 'KontBalanceStateBase.endostatok', context: context);

  @override
  int? get endostatok {
    _$endostatokAtom.reportRead();
    return super.endostatok;
  }

  @override
  set endostatok(int? value) {
    _$endostatokAtom.reportWrite(value, super.endostatok, () {
      super.endostatok = value;
    });
  }

  late final _$nachostatokAtom =
      Atom(name: 'KontBalanceStateBase.nachostatok', context: context);

  @override
  int? get nachostatok {
    _$nachostatokAtom.reportRead();
    return super.nachostatok;
  }

  @override
  set nachostatok(int? value) {
    _$nachostatokAtom.reportWrite(value, super.nachostatok, () {
      super.nachostatok = value;
    });
  }

  late final _$summaitemsAtom =
      Atom(name: 'KontBalanceStateBase.summaitems', context: context);

  @override
  int? get summaitems {
    _$summaitemsAtom.reportRead();
    return super.summaitems;
  }

  @override
  set summaitems(int? value) {
    _$summaitemsAtom.reportWrite(value, super.summaitems, () {
      super.summaitems = value;
    });
  }

  late final _$getContragentReportsAsyncAction = AsyncAction(
      'KontBalanceStateBase.getContragentReports',
      context: context);

  @override
  Future getContragentReports(
      {required String name, required String data_s, required String data_e}) {
    return _$getContragentReportsAsyncAction.run(() =>
        super.getContragentReports(name: name, data_s: data_s, data_e: data_e));
  }

  @override
  String toString() {
    return '''
kontDocsList: ${kontDocsList},
endostatok: ${endostatok},
nachostatok: ${nachostatok},
summaitems: ${summaitems}
    ''';
  }
}
