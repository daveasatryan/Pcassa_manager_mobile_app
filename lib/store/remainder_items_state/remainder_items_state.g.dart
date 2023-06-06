// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_items_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RemainderItemsState on RemainderItemsStateBase, Store {
  late final _$remainderListAtom =
      Atom(name: 'RemainderItemsStateBase.remainderList', context: context);

  @override
  List<RemainderItemsModel> get remainderList {
    _$remainderListAtom.reportRead();
    return super.remainderList;
  }

  @override
  set remainderList(List<RemainderItemsModel> value) {
    _$remainderListAtom.reportWrite(value, super.remainderList, () {
      super.remainderList = value;
    });
  }

  @override
  String toString() {
    return '''
remainderList: ${remainderList}
    ''';
  }
}
