// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spent_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpentState on SpentStateBase, Store {
  late final _$spentListAtom =
      Atom(name: 'SpentStateBase.spentList', context: context);

  @override
  ObservableList<SpentModel> get spentList {
    _$spentListAtom.reportRead();
    return super.spentList;
  }

  @override
  set spentList(ObservableList<SpentModel> value) {
    _$spentListAtom.reportWrite(value, super.spentList, () {
      super.spentList = value;
    });
  }

  late final _$spentListNamesAtom =
      Atom(name: 'SpentStateBase.spentListNames', context: context);

  @override
  ObservableList<String> get spentListNames {
    _$spentListNamesAtom.reportRead();
    return super.spentListNames;
  }

  @override
  set spentListNames(ObservableList<String> value) {
    _$spentListNamesAtom.reportWrite(value, super.spentListNames, () {
      super.spentListNames = value;
    });
  }

  late final _$getSpentAsyncAction =
      AsyncAction('SpentStateBase.getSpent', context: context);

  @override
  Future getSpent() {
    return _$getSpentAsyncAction.run(() => super.getSpent());
  }

  late final _$postSpentAsyncAction =
      AsyncAction('SpentStateBase.postSpent', context: context);

  @override
  Future postSpent({required int id, required String name}) {
    return _$postSpentAsyncAction
        .run(() => super.postSpent(id: id, name: name));
  }

  late final _$delSpentAsyncAction =
      AsyncAction('SpentStateBase.delSpent', context: context);

  @override
  Future delSpent({required dynamic id}) {
    return _$delSpentAsyncAction.run(() => super.delSpent(id: id));
  }

  late final _$SpentStateBaseActionController =
      ActionController(name: 'SpentStateBase', context: context);

  @override
  dynamic getSpentNames() {
    final _$actionInfo = _$SpentStateBaseActionController.startAction(
        name: 'SpentStateBase.getSpentNames');
    try {
      return super.getSpentNames();
    } finally {
      _$SpentStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
spentList: ${spentList},
spentListNames: ${spentListNames}
    ''';
  }
}
