// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatedDiscounts on CreatedDiscountsBase, Store {
  late final _$discountInfoAtom =
      Atom(name: 'CreatedDiscountsBase.discountInfo', context: context);

  @override
  ObservableList<GetDiscountsModel> get discountInfo {
    _$discountInfoAtom.reportRead();
    return super.discountInfo;
  }

  @override
  set discountInfo(ObservableList<GetDiscountsModel> value) {
    _$discountInfoAtom.reportWrite(value, super.discountInfo, () {
      super.discountInfo = value;
    });
  }

  late final _$getCreatedDiscountsAsyncAction =
      AsyncAction('CreatedDiscountsBase.getCreatedDiscounts', context: context);

  @override
  Future getCreatedDiscounts() {
    return _$getCreatedDiscountsAsyncAction
        .run(() => super.getCreatedDiscounts());
  }

  late final _$saveDiscountsAsyncAction =
      AsyncAction('CreatedDiscountsBase.saveDiscounts', context: context);

  @override
  Future saveDiscounts(
      {required dynamic id,
      required dynamic id_d,
      required dynamic name,
      required dynamic tip,
      required dynamic val,
      required dynamic status,
      required dynamic rejim}) {
    return _$saveDiscountsAsyncAction.run(() => super.saveDiscounts(
        id: id,
        id_d: id_d,
        name: name,
        tip: tip,
        val: val,
        status: status,
        rejim: rejim));
  }

  late final _$deleteDiscountAsyncAction =
      AsyncAction('CreatedDiscountsBase.deleteDiscount', context: context);

  @override
  Future deleteDiscount({required dynamic id}) {
    return _$deleteDiscountAsyncAction.run(() => super.deleteDiscount(id: id));
  }

  @override
  String toString() {
    return '''
discountInfo: ${discountInfo}
    ''';
  }
}
