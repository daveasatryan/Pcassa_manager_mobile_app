// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viruchka_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViruchkaState on ViruchkaStateBase, Store {
  late final _$listOfViruchkaAtom =
      Atom(name: 'ViruchkaStateBase.listOfViruchka', context: context);

  @override
  ObservableList<ViruchkaModel> get listOfViruchka {
    _$listOfViruchkaAtom.reportRead();
    return super.listOfViruchka;
  }

  @override
  set listOfViruchka(ObservableList<ViruchkaModel> value) {
    _$listOfViruchkaAtom.reportWrite(value, super.listOfViruchka, () {
      super.listOfViruchka = value;
    });
  }

  late final _$debtAtom =
      Atom(name: 'ViruchkaStateBase.debt', context: context);

  @override
  int get debt {
    _$debtAtom.reportRead();
    return super.debt;
  }

  @override
  set debt(int value) {
    _$debtAtom.reportWrite(value, super.debt, () {
      super.debt = value;
    });
  }

  late final _$cashAtom =
      Atom(name: 'ViruchkaStateBase.cash', context: context);

  @override
  int get cash {
    _$cashAtom.reportRead();
    return super.cash;
  }

  @override
  set cash(int value) {
    _$cashAtom.reportWrite(value, super.cash, () {
      super.cash = value;
    });
  }

  late final _$noCashAtom =
      Atom(name: 'ViruchkaStateBase.noCash', context: context);

  @override
  int get noCash {
    _$noCashAtom.reportRead();
    return super.noCash;
  }

  @override
  set noCash(int value) {
    _$noCashAtom.reportWrite(value, super.noCash, () {
      super.noCash = value;
    });
  }

  late final _$summaryAtom =
      Atom(name: 'ViruchkaStateBase.summary', context: context);

  @override
  int get summary {
    _$summaryAtom.reportRead();
    return super.summary;
  }

  @override
  set summary(int value) {
    _$summaryAtom.reportWrite(value, super.summary, () {
      super.summary = value;
    });
  }

  late final _$getViruchkaAsyncAction =
      AsyncAction('ViruchkaStateBase.getViruchka', context: context);

  @override
  Future getViruchka(
      {required String chequenumber,
      required String data_e,
      required String order_by,
      required String n_smena,
      required String data_s,
      required String waiter_name}) {
    return _$getViruchkaAsyncAction.run(() => super.getViruchka(
        chequenumber: chequenumber,
        data_e: data_e,
        order_by: order_by,
        n_smena: n_smena,
        data_s: data_s,
        waiter_name: waiter_name));
  }

  late final _$ViruchkaStateBaseActionController =
      ActionController(name: 'ViruchkaStateBase', context: context);

  @override
  dynamic makeSummary() {
    final _$actionInfo = _$ViruchkaStateBaseActionController.startAction(
        name: 'ViruchkaStateBase.makeSummary');
    try {
      return super.makeSummary();
    } finally {
      _$ViruchkaStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOfViruchka: ${listOfViruchka},
debt: ${debt},
cash: ${cash},
noCash: ${noCash},
summary: ${summary}
    ''';
  }
}
