// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_order_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CashOrderState on CashOrderStateBase, Store {
  late final _$resultCashOrderModelAtom =
      Atom(name: 'CashOrderStateBase.resultCashOrderModel', context: context);

  @override
  CashOrderModel? get resultCashOrderModel {
    _$resultCashOrderModelAtom.reportRead();
    return super.resultCashOrderModel;
  }

  @override
  set resultCashOrderModel(CashOrderModel? value) {
    _$resultCashOrderModelAtom.reportWrite(value, super.resultCashOrderModel,
        () {
      super.resultCashOrderModel = value;
    });
  }

  late final _$resultCashOrderAtom =
      Atom(name: 'CashOrderStateBase.resultCashOrder', context: context);

  @override
  ObservableList<OpenCashOrderModel> get resultCashOrder {
    _$resultCashOrderAtom.reportRead();
    return super.resultCashOrder;
  }

  @override
  set resultCashOrder(ObservableList<OpenCashOrderModel> value) {
    _$resultCashOrderAtom.reportWrite(value, super.resultCashOrder, () {
      super.resultCashOrder = value;
    });
  }

  late final _$createCahsOrderDocumentAsyncAction = AsyncAction(
      'CashOrderStateBase.createCahsOrderDocument',
      context: context);

  @override
  Future<void> createCahsOrderDocument(
      {required CashOrderModel cashOrderModel}) {
    return _$createCahsOrderDocumentAsyncAction.run(
        () => super.createCahsOrderDocument(cashOrderModel: cashOrderModel));
  }

  late final _$getCashOrdersByFilterAsyncAction =
      AsyncAction('CashOrderStateBase.getCashOrdersByFilter', context: context);

  @override
  Future getCashOrdersByFilter(
      {String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? kassname}) {
    return _$getCashOrdersByFilterAsyncAction.run(() => super
        .getCashOrdersByFilter(
            n_dok: n_dok,
            data_s: data_s,
            data_e: data_e,
            tip_name: tip_name,
            kontname: kontname,
            kassname: kassname));
  }

  late final _$delteCashOrdersByFilterAsyncAction = AsyncAction(
      'CashOrderStateBase.delteCashOrdersByFilter',
      context: context);

  @override
  Future delteCashOrdersByFilter(
      {int? id,
      String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? kassname}) {
    return _$delteCashOrdersByFilterAsyncAction.run(() => super
        .delteCashOrdersByFilter(
            id: id,
            n_dok: n_dok,
            data_s: data_s,
            data_e: data_e,
            tip_name: tip_name,
            kontname: kontname,
            kassname: kassname));
  }

  late final _$openDocumentAsyncAction =
      AsyncAction('CashOrderStateBase.openDocument', context: context);

  @override
  Future openDocument({required int id}) {
    return _$openDocumentAsyncAction.run(() => super.openDocument(id: id));
  }

  @override
  String toString() {
    return '''
resultCashOrderModel: ${resultCashOrderModel},
resultCashOrder: ${resultCashOrder}
    ''';
  }
}
