// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActViewState on ActViewStateBase, Store {
  late final _$actViewInfoAtom =
      Atom(name: 'ActViewStateBase.actViewInfo', context: context);

  @override
  List<ActViewModel> get actViewInfo {
    _$actViewInfoAtom.reportRead();
    return super.actViewInfo;
  }

  @override
  set actViewInfo(List<ActViewModel> value) {
    _$actViewInfoAtom.reportWrite(value, super.actViewInfo, () {
      super.actViewInfo = value;
    });
  }

  late final _$getActListAsyncAction =
      AsyncAction('ActViewStateBase.getActList', context: context);

  @override
  Future getActList(
      {String? n_dok = "",
      String? data_s = "",
      String? data_e = "",
      String? kontname = "",
      String? zatratname = ""}) {
    return _$getActListAsyncAction.run(() => super.getActList(
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        kontname: kontname,
        zatratname: zatratname));
  }

  late final _$delActFromListAsyncAction =
      AsyncAction('ActViewStateBase.delActFromList', context: context);

  @override
  Future delActFromList(
      {required int id,
      String n_dok = "",
      String data_s = "",
      String data_e = "",
      String kontname = "",
      String zatratname = ""}) {
    return _$delActFromListAsyncAction.run(() => super.delActFromList(
        id: id,
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        kontname: kontname,
        zatratname: zatratname));
  }

  late final _$searchActForViewAsyncAction =
      AsyncAction('ActViewStateBase.searchActForView', context: context);

  @override
  Future searchActForView({required int id}) {
    return _$searchActForViewAsyncAction
        .run(() => super.searchActForView(id: id));
  }

  @override
  String toString() {
    return '''
actViewInfo: ${actViewInfo}
    ''';
  }
}
