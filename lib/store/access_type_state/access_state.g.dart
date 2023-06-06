// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccessState on AccessStateBase, Store {
  late final _$accessTypesListAtom =
      Atom(name: 'AccessStateBase.accessTypesList', context: context);

  @override
  ObservableList<AccessTypeModel> get accessTypesList {
    _$accessTypesListAtom.reportRead();
    return super.accessTypesList;
  }

  @override
  set accessTypesList(ObservableList<AccessTypeModel> value) {
    _$accessTypesListAtom.reportWrite(value, super.accessTypesList, () {
      super.accessTypesList = value;
    });
  }

  late final _$configCategotyAtom =
      Atom(name: 'AccessStateBase.configCategoty', context: context);

  @override
  AccessModel? get configCategoty {
    _$configCategotyAtom.reportRead();
    return super.configCategoty;
  }

  @override
  set configCategoty(AccessModel? value) {
    _$configCategotyAtom.reportWrite(value, super.configCategoty, () {
      super.configCategoty = value;
    });
  }

  @override
  String toString() {
    return '''
accessTypesList: ${accessTypesList},
configCategoty: ${configCategoty}
    ''';
  }
}
