// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_realisation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActRealisationState on ActRealisationStateBase, Store {
  late final _$actRealisationListAtom = Atom(
      name: 'ActRealisationStateBase.actRealisationList', context: context);

  @override
  List<ActRealisationModel> get actRealisationList {
    _$actRealisationListAtom.reportRead();
    return super.actRealisationList;
  }

  @override
  set actRealisationList(List<ActRealisationModel> value) {
    _$actRealisationListAtom.reportWrite(value, super.actRealisationList, () {
      super.actRealisationList = value;
    });
  }

  @override
  String toString() {
    return '''
actRealisationList: ${actRealisationList}
    ''';
  }
}
