// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatedUsers on CreatedUsersBase, Store {
  late final _$usersInfoAtom =
      Atom(name: 'CreatedUsersBase.usersInfo', context: context);

  @override
  ObservableList<CreateUserModel> get usersInfo {
    _$usersInfoAtom.reportRead();
    return super.usersInfo;
  }

  @override
  set usersInfo(ObservableList<CreateUserModel> value) {
    _$usersInfoAtom.reportWrite(value, super.usersInfo, () {
      super.usersInfo = value;
    });
  }

  late final _$usersFioAtom =
      Atom(name: 'CreatedUsersBase.usersFio', context: context);

  @override
  ObservableList<String> get usersFio {
    _$usersFioAtom.reportRead();
    return super.usersFio;
  }

  @override
  set usersFio(ObservableList<String> value) {
    _$usersFioAtom.reportWrite(value, super.usersFio, () {
      super.usersFio = value;
    });
  }

  late final _$getCreatedUsersAsyncAction =
      AsyncAction('CreatedUsersBase.getCreatedUsers', context: context);

  @override
  Future<void> getCreatedUsers() {
    return _$getCreatedUsersAsyncAction.run(() => super.getCreatedUsers());
  }

  late final _$deleteUsersAsyncAction =
      AsyncAction('CreatedUsersBase.deleteUsers', context: context);

  @override
  Future<void> deleteUsers({required dynamic userId}) {
    return _$deleteUsersAsyncAction
        .run(() => super.deleteUsers(userId: userId));
  }

  late final _$saveCreatedUserAsyncAction =
      AsyncAction('CreatedUsersBase.saveCreatedUser', context: context);

  @override
  Future<void> saveCreatedUser(
      {required String cod,
      required String fio,
      required String paswword,
      required String login,
      required int tip,
      required String tipdostupa,
      required String language,
      required int id,
      required int pin,
      required String shtrix}) {
    return _$saveCreatedUserAsyncAction.run(() => super.saveCreatedUser(
        cod: cod,
        fio: fio,
        paswword: paswword,
        login: login,
        tip: tip,
        tipdostupa: tipdostupa,
        language: language,
        id: id,
        pin: pin,
        shtrix: shtrix));
  }

  late final _$CreatedUsersBaseActionController =
      ActionController(name: 'CreatedUsersBase', context: context);

  @override
  dynamic getFio() {
    final _$actionInfo = _$CreatedUsersBaseActionController.startAction(
        name: 'CreatedUsersBase.getFio');
    try {
      return super.getFio();
    } finally {
      _$CreatedUsersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usersInfo: ${usersInfo},
usersFio: ${usersFio}
    ''';
  }
}
