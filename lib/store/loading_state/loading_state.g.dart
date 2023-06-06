// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoadingState on LoadingStateBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoadingStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$afterFirstLayoutAsyncAction =
      AsyncAction('LoadingStateBase.afterFirstLayout', context: context);

  @override
  Future<void> afterFirstLayout({required BuildContext context}) {
    return _$afterFirstLayoutAsyncAction
        .run(() => super.afterFirstLayout(context: context));
  }

  late final _$LoadingStateBaseActionController =
      ActionController(name: 'LoadingStateBase', context: context);

  @override
  void startLoading() {
    final _$actionInfo = _$LoadingStateBaseActionController.startAction(
        name: 'LoadingStateBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$LoadingStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$LoadingStateBaseActionController.startAction(
        name: 'LoadingStateBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$LoadingStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
