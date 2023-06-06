// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DocumentViewState on DocumentViewStateBase, Store {
  late final _$naklViewInfoAtom =
      Atom(name: 'DocumentViewStateBase.naklViewInfo', context: context);

  @override
  ObservableList<NaklViewModel> get naklViewInfo {
    _$naklViewInfoAtom.reportRead();
    return super.naklViewInfo;
  }

  @override
  set naklViewInfo(ObservableList<NaklViewModel> value) {
    _$naklViewInfoAtom.reportWrite(value, super.naklViewInfo, () {
      super.naklViewInfo = value;
    });
  }

  late final _$getDocumentAsyncAction =
      AsyncAction('DocumentViewStateBase.getDocument', context: context);

  @override
  Future getDocument(
      {String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) {
    return _$getDocumentAsyncAction.run(() => super.getDocument(
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        tip_name: tip_name,
        kontname: kontname,
        skl1name: skl1name,
        skl2name: skl2name,
        aktiv: aktiv));
  }

  late final _$openDocumentAsyncAction =
      AsyncAction('DocumentViewStateBase.openDocument', context: context);

  @override
  Future openDocument({required int id}) {
    return _$openDocumentAsyncAction.run(() => super.openDocument(id: id));
  }

  late final _$deleteDocumentAsyncAction =
      AsyncAction('DocumentViewStateBase.deleteDocument', context: context);

  @override
  Future deleteDocument(
      {int? id,
      String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) {
    return _$deleteDocumentAsyncAction.run(() => super.deleteDocument(
        id: id,
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        tip_name: tip_name,
        kontname: kontname,
        skl1name: skl1name,
        skl2name: skl2name,
        aktiv: aktiv));
  }

  @override
  String toString() {
    return '''
naklViewInfo: ${naklViewInfo}
    ''';
  }
}
