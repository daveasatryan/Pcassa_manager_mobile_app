// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WarehouseState on WarehouseStateBase, Store {
  late final _$warehouseListAtom =
      Atom(name: 'WarehouseStateBase.warehouseList', context: context);

  @override
  ObservableList<WarehouseModel> get warehouseList {
    _$warehouseListAtom.reportRead();
    return super.warehouseList;
  }

  @override
  set warehouseList(ObservableList<WarehouseModel> value) {
    _$warehouseListAtom.reportWrite(value, super.warehouseList, () {
      super.warehouseList = value;
    });
  }

  late final _$warehouseNamesAtom =
      Atom(name: 'WarehouseStateBase.warehouseNames', context: context);

  @override
  ObservableList<String> get warehouseNames {
    _$warehouseNamesAtom.reportRead();
    return super.warehouseNames;
  }

  @override
  set warehouseNames(ObservableList<String> value) {
    _$warehouseNamesAtom.reportWrite(value, super.warehouseNames, () {
      super.warehouseNames = value;
    });
  }

  late final _$getWarehouseAsyncAction =
      AsyncAction('WarehouseStateBase.getWarehouse', context: context);

  @override
  Future getWarehouse() {
    return _$getWarehouseAsyncAction.run(() => super.getWarehouse());
  }

  late final _$postWarehouseAsyncAction =
      AsyncAction('WarehouseStateBase.postWarehouse', context: context);

  @override
  Future postWarehouse({required int cod, required String name}) {
    return _$postWarehouseAsyncAction
        .run(() => super.postWarehouse(cod: cod, name: name));
  }

  late final _$delWarehouseAsyncAction =
      AsyncAction('WarehouseStateBase.delWarehouse', context: context);

  @override
  Future delWarehouse({required int cod}) {
    return _$delWarehouseAsyncAction.run(() => super.delWarehouse(cod: cod));
  }

  late final _$WarehouseStateBaseActionController =
      ActionController(name: 'WarehouseStateBase', context: context);

  @override
  dynamic getWarehouseNames() {
    final _$actionInfo = _$WarehouseStateBaseActionController.startAction(
        name: 'WarehouseStateBase.getWarehouseNames');
    try {
      return super.getWarehouseNames();
    } finally {
      _$WarehouseStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
warehouseList: ${warehouseList},
warehouseNames: ${warehouseNames}
    ''';
  }
}
