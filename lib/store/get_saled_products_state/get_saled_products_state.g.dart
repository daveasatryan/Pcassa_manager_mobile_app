// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_saled_products_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaledProductsState on SaledProductsStateBase, Store {
  late final _$saledItemsListAtom =
      Atom(name: 'SaledProductsStateBase.saledItemsList', context: context);

  @override
  ObservableList<SaledItemsModel> get saledItemsList {
    _$saledItemsListAtom.reportRead();
    return super.saledItemsList;
  }

  @override
  set saledItemsList(ObservableList<SaledItemsModel> value) {
    _$saledItemsListAtom.reportWrite(value, super.saledItemsList, () {
      super.saledItemsList = value;
    });
  }

  late final _$summaAtom =
      Atom(name: 'SaledProductsStateBase.summa', context: context);

  @override
  int? get summa {
    _$summaAtom.reportRead();
    return super.summa;
  }

  @override
  set summa(int? value) {
    _$summaAtom.reportWrite(value, super.summa, () {
      super.summa = value;
    });
  }

  late final _$getSaledProductsAsyncAction =
      AsyncAction('SaledProductsStateBase.getSaledProducts', context: context);

  @override
  Future getSaledProducts(
      {required String category_name,
      required String data_s,
      required String data_e,
      required String name,
      required String order_by}) {
    return _$getSaledProductsAsyncAction.run(() => super.getSaledProducts(
        category_name: category_name,
        data_s: data_s,
        data_e: data_e,
        name: name,
        order_by: order_by));
  }

  @override
  String toString() {
    return '''
saledItemsList: ${saledItemsList},
summa: ${summa}
    ''';
  }
}
