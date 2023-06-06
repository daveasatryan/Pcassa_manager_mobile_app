// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryState on CategoryStateBase, Store {
  late final _$categoryTypeListAtom =
      Atom(name: 'CategoryStateBase.categoryTypeList', context: context);

  @override
  ObservableList<CategorytypeModel> get categoryTypeList {
    _$categoryTypeListAtom.reportRead();
    return super.categoryTypeList;
  }

  @override
  set categoryTypeList(ObservableList<CategorytypeModel> value) {
    _$categoryTypeListAtom.reportWrite(value, super.categoryTypeList, () {
      super.categoryTypeList = value;
    });
  }

  late final _$getCategoryAsyncAction =
      AsyncAction('CategoryStateBase.getCategory', context: context);

  @override
  Future getCategory() {
    return _$getCategoryAsyncAction.run(() => super.getCategory());
  }

  late final _$postCategoryAsyncAction =
      AsyncAction('CategoryStateBase.postCategory', context: context);

  @override
  Future postCategory({required dynamic guid, required dynamic name}) {
    return _$postCategoryAsyncAction
        .run(() => super.postCategory(guid: guid, name: name));
  }

  late final _$deleteCategoryAsyncAction =
      AsyncAction('CategoryStateBase.deleteCategory', context: context);

  @override
  Future deleteCategory({required dynamic guid}) {
    return _$deleteCategoryAsyncAction
        .run(() => super.deleteCategory(guid: guid));
  }

  @override
  String toString() {
    return '''
categoryTypeList: ${categoryTypeList}
    ''';
  }
}
