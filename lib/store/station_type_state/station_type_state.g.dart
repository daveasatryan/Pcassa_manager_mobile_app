// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_type_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StationTypeState on StationTypeStateBase, Store {
  late final _$stationTypeListAtom =
      Atom(name: 'StationTypeStateBase.stationTypeList', context: context);

  @override
  ObservableList<StationTypeModel> get stationTypeList {
    _$stationTypeListAtom.reportRead();
    return super.stationTypeList;
  }

  @override
  set stationTypeList(ObservableList<StationTypeModel> value) {
    _$stationTypeListAtom.reportWrite(value, super.stationTypeList, () {
      super.stationTypeList = value;
    });
  }

  late final _$stationTypeNameListAtom =
      Atom(name: 'StationTypeStateBase.stationTypeNameList', context: context);

  @override
  ObservableList<String> get stationTypeNameList {
    _$stationTypeNameListAtom.reportRead();
    return super.stationTypeNameList;
  }

  @override
  set stationTypeNameList(ObservableList<String> value) {
    _$stationTypeNameListAtom.reportWrite(value, super.stationTypeNameList, () {
      super.stationTypeNameList = value;
    });
  }

  late final _$getStationTypeAsyncAction =
      AsyncAction('StationTypeStateBase.getStationType', context: context);

  @override
  Future getStationType() {
    return _$getStationTypeAsyncAction.run(() => super.getStationType());
  }

  late final _$postStationTypeAsyncAction =
      AsyncAction('StationTypeStateBase.postStationType', context: context);

  @override
  Future postStationType(
      {required int id,
      required String name,
      required String? prim,
      required String? rshet}) {
    return _$postStationTypeAsyncAction.run(() =>
        super.postStationType(id: id, name: name, prim: prim, rshet: rshet));
  }

  late final _$deleteStationTypeAsyncAction =
      AsyncAction('StationTypeStateBase.deleteStationType', context: context);

  @override
  Future deleteStationType({required int id}) {
    return _$deleteStationTypeAsyncAction
        .run(() => super.deleteStationType(id: id));
  }

  late final _$StationTypeStateBaseActionController =
      ActionController(name: 'StationTypeStateBase', context: context);

  @override
  dynamic getNames() {
    final _$actionInfo = _$StationTypeStateBaseActionController.startAction(
        name: 'StationTypeStateBase.getNames');
    try {
      return super.getNames();
    } finally {
      _$StationTypeStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stationTypeList: ${stationTypeList},
stationTypeNameList: ${stationTypeNameList}
    ''';
  }
}
