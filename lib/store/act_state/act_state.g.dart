// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActState on ActStateBase, Store {
  late final _$actInfoForCreateAtom =
      Atom(name: 'ActStateBase.actInfoForCreate', context: context);

  @override
  ActModel? get actInfoForCreate {
    _$actInfoForCreateAtom.reportRead();
    return super.actInfoForCreate;
  }

  @override
  set actInfoForCreate(ActModel? value) {
    _$actInfoForCreateAtom.reportWrite(value, super.actInfoForCreate, () {
      super.actInfoForCreate = value;
    });
  }

  @override
  String toString() {
    return '''
actInfoForCreate: ${actInfoForCreate}
    ''';
  }
}
