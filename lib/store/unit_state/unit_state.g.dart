// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UnitState on UnitStateBase, Store {
  late final _$unitListAtom =
      Atom(name: 'UnitStateBase.unitList', context: context);

  @override
  ObservableList<UnitModel> get unitList {
    _$unitListAtom.reportRead();
    return super.unitList;
  }

  @override
  set unitList(ObservableList<UnitModel> value) {
    _$unitListAtom.reportWrite(value, super.unitList, () {
      super.unitList = value;
    });
  }

  late final _$getUnitAsyncAction =
      AsyncAction('UnitStateBase.getUnit', context: context);

  @override
  Future getUnit() {
    return _$getUnitAsyncAction.run(() => super.getUnit());
  }

  late final _$postUnitAsyncAction =
      AsyncAction('UnitStateBase.postUnit', context: context);

  @override
  Future postUnit({required dynamic guid, required dynamic name}) {
    return _$postUnitAsyncAction
        .run(() => super.postUnit(guid: guid, name: name));
  }

  late final _$deleteUnitAsyncAction =
      AsyncAction('UnitStateBase.deleteUnit', context: context);

  @override
  Future deleteUnit({required dynamic guid}) {
    return _$deleteUnitAsyncAction.run(() => super.deleteUnit(guid: guid));
  }

  @override
  String toString() {
    return '''
unitList: ${unitList}
    ''';
  }
}
