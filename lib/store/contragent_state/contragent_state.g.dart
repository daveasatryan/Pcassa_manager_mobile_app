// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contragent_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContragentState on ContragentStateBase, Store {
  late final _$contragentCategoryListAtom = Atom(
      name: 'ContragentStateBase.contragentCategoryList', context: context);

  @override
  ObservableList<ContragentGroupModel> get contragentCategoryList {
    _$contragentCategoryListAtom.reportRead();
    return super.contragentCategoryList;
  }

  @override
  set contragentCategoryList(ObservableList<ContragentGroupModel> value) {
    _$contragentCategoryListAtom
        .reportWrite(value, super.contragentCategoryList, () {
      super.contragentCategoryList = value;
    });
  }

  late final _$contragentNamesAtom =
      Atom(name: 'ContragentStateBase.contragentNames', context: context);

  @override
  ObservableList<String> get contragentNames {
    _$contragentNamesAtom.reportRead();
    return super.contragentNames;
  }

  @override
  set contragentNames(ObservableList<String> value) {
    _$contragentNamesAtom.reportWrite(value, super.contragentNames, () {
      super.contragentNames = value;
    });
  }

  late final _$contragentsElementsAtom =
      Atom(name: 'ContragentStateBase.contragentsElements', context: context);

  @override
  ObservableList<ContragentItemsModel> get contragentsElements {
    _$contragentsElementsAtom.reportRead();
    return super.contragentsElements;
  }

  @override
  set contragentsElements(ObservableList<ContragentItemsModel> value) {
    _$contragentsElementsAtom.reportWrite(value, super.contragentsElements, () {
      super.contragentsElements = value;
    });
  }

  late final _$contragentsFirstLevelAtom =
      Atom(name: 'ContragentStateBase.contragentsFirstLevel', context: context);

  @override
  ObservableList<ContragentGroupModel> get contragentsFirstLevel {
    _$contragentsFirstLevelAtom.reportRead();
    return super.contragentsFirstLevel;
  }

  @override
  set contragentsFirstLevel(ObservableList<ContragentGroupModel> value) {
    _$contragentsFirstLevelAtom.reportWrite(value, super.contragentsFirstLevel,
        () {
      super.contragentsFirstLevel = value;
    });
  }

  late final _$groupContragentsAtom =
      Atom(name: 'ContragentStateBase.groupContragents', context: context);

  @override
  ObservableList<ContragentItemsModel> get groupContragents {
    _$groupContragentsAtom.reportRead();
    return super.groupContragents;
  }

  @override
  set groupContragents(ObservableList<ContragentItemsModel> value) {
    _$groupContragentsAtom.reportWrite(value, super.groupContragents, () {
      super.groupContragents = value;
    });
  }

  late final _$getContragentsAsyncAction =
      AsyncAction('ContragentStateBase.getContragents', context: context);

  @override
  Future getContragents({required BuildContext context}) {
    return _$getContragentsAsyncAction
        .run(() => super.getContragents(context: context));
  }

  late final _$addContragentGroupAsyncAction =
      AsyncAction('ContragentStateBase.addContragentGroup', context: context);

  @override
  Future addContragentGroup(
      {required dynamic guid,
      required dynamic parentGuid,
      required dynamic caption,
      required dynamic isRoot,
      required BuildContext context}) {
    return _$addContragentGroupAsyncAction.run(() => super.addContragentGroup(
        guid: guid,
        parentGuid: parentGuid,
        caption: caption,
        isRoot: isRoot,
        context: context));
  }

  late final _$postContragentAsyncAction =
      AsyncAction('ContragentStateBase.postContragent', context: context);

  @override
  Future postContragent(
      {required ContragentItemsModel contragentItemModel,
      required BuildContext context}) {
    return _$postContragentAsyncAction.run(() => super.postContragent(
        contragentItemModel: contragentItemModel, context: context));
  }

  late final _$delGroupAsyncAction =
      AsyncAction('ContragentStateBase.delGroup', context: context);

  @override
  Future delGroup({required BuildContext context, required dynamic guid}) {
    return _$delGroupAsyncAction
        .run(() => super.delGroup(context: context, guid: guid));
  }

  late final _$changeGroupeAsyncAction =
      AsyncAction('ContragentStateBase.changeGroupe', context: context);

  @override
  Future<void> changeGroupe(
      {required BuildContext context,
      required dynamic guid,
      required dynamic newguid,
      required dynamic oldguid,
      required dynamic isRoot}) {
    return _$changeGroupeAsyncAction.run(() => super.changeGroupe(
        context: context,
        guid: guid,
        newguid: newguid,
        oldguid: oldguid,
        isRoot: isRoot));
  }

  late final _$ContragentStateBaseActionController =
      ActionController(name: 'ContragentStateBase', context: context);

  @override
  dynamic categoryFirstMade() {
    final _$actionInfo = _$ContragentStateBaseActionController.startAction(
        name: 'ContragentStateBase.categoryFirstMade');
    try {
      return super.categoryFirstMade();
    } finally {
      _$ContragentStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getContragentNames() {
    final _$actionInfo = _$ContragentStateBaseActionController.startAction(
        name: 'ContragentStateBase.getContragentNames');
    try {
      return super.getContragentNames();
    } finally {
      _$ContragentStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearGroupState() {
    final _$actionInfo = _$ContragentStateBaseActionController.startAction(
        name: 'ContragentStateBase.clearGroupState');
    try {
      return super.clearGroupState();
    } finally {
      _$ContragentStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contragentCategoryList: ${contragentCategoryList},
contragentNames: ${contragentNames},
contragentsElements: ${contragentsElements},
contragentsFirstLevel: ${contragentsFirstLevel},
groupContragents: ${groupContragents}
    ''';
  }
}
