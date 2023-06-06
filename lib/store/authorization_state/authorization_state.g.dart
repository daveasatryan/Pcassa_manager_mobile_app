// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthorizationState on AuthorizationStateBase, Store {
  late final _$infoAtom =
      Atom(name: 'AuthorizationStateBase.info', context: context);

  @override
  InfoModel? get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(InfoModel? value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: 'AuthorizationStateBase.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$languageAtom =
      Atom(name: 'AuthorizationStateBase.language', context: context);

  @override
  UserModel? get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(UserModel? value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  late final _$AuthorizationStateBaseActionController =
      ActionController(name: 'AuthorizationStateBase', context: context);

  @override
  void logOut() {
    final _$actionInfo = _$AuthorizationStateBaseActionController.startAction(
        name: 'AuthorizationStateBase.logOut');
    try {
      return super.logOut();
    } finally {
      _$AuthorizationStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
info: ${info},
currentUser: ${currentUser},
language: ${language}
    ''';
  }
}
