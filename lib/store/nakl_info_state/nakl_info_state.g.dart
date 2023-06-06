// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nakl_info_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NaklInfoState on NaklInfoStateBase, Store {
  late final _$savedDocumentAtom =
      Atom(name: 'NaklInfoStateBase.savedDocument', context: context);

  @override
  bool get savedDocument {
    _$savedDocumentAtom.reportRead();
    return super.savedDocument;
  }

  @override
  set savedDocument(bool value) {
    _$savedDocumentAtom.reportWrite(value, super.savedDocument, () {
      super.savedDocument = value;
    });
  }

  late final _$naklInfoItemsAtom =
      Atom(name: 'NaklInfoStateBase.naklInfoItems', context: context);

  @override
  NaklInfoItemsModel? get naklInfoItems {
    _$naklInfoItemsAtom.reportRead();
    return super.naklInfoItems;
  }

  @override
  set naklInfoItems(NaklInfoItemsModel? value) {
    _$naklInfoItemsAtom.reportWrite(value, super.naklInfoItems, () {
      super.naklInfoItems = value;
    });
  }

  late final _$naklInfoTovarsAtom =
      Atom(name: 'NaklInfoStateBase.naklInfoTovars', context: context);

  @override
  ObservableList<TovarArrayItems> get naklInfoTovars {
    _$naklInfoTovarsAtom.reportRead();
    return super.naklInfoTovars;
  }

  @override
  set naklInfoTovars(ObservableList<TovarArrayItems> value) {
    _$naklInfoTovarsAtom.reportWrite(value, super.naklInfoTovars, () {
      super.naklInfoTovars = value;
    });
  }

  late final _$saveDocumentAsyncAction =
      AsyncAction('NaklInfoStateBase.saveDocument', context: context);

  @override
  Future saveDocument(
      {required NaklInfoItemsModel naklinfo_items_model,
      required TovarArrayItems tovarArrayItems,
      required BuildContext context}) {
    return _$saveDocumentAsyncAction.run(() => super.saveDocument(
        naklinfo_items_model: naklinfo_items_model,
        tovarArrayItems: tovarArrayItems,
        context: context));
  }

  late final _$deleteProductAsyncAction =
      AsyncAction('NaklInfoStateBase.deleteProduct', context: context);

  @override
  Future deleteProduct({required int id, required int id_d}) {
    return _$deleteProductAsyncAction
        .run(() => super.deleteProduct(id: id, id_d: id_d));
  }

  late final _$createDocumentAsyncAction =
      AsyncAction('NaklInfoStateBase.createDocument', context: context);

  @override
  Future createDocument(
      {required NaklInfoItemsModel naklinfo_items_model,
      required BuildContext context}) {
    return _$createDocumentAsyncAction.run(() => super.createDocument(
        naklinfo_items_model: naklinfo_items_model, context: context));
  }

  @override
  String toString() {
    return '''
savedDocument: ${savedDocument},
naklInfoItems: ${naklInfoItems},
naklInfoTovars: ${naklInfoTovars}
    ''';
  }
}
