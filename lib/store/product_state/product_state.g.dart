// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatedProducts on CreatedProductsBase, Store {
  late final _$productsCategoryListAtom =
      Atom(name: 'CreatedProductsBase.productsCategoryList', context: context);

  @override
  ObservableList<ProductCategoryModel> get productsCategoryList {
    _$productsCategoryListAtom.reportRead();
    return super.productsCategoryList;
  }

  @override
  set productsCategoryList(ObservableList<ProductCategoryModel> value) {
    _$productsCategoryListAtom.reportWrite(value, super.productsCategoryList,
        () {
      super.productsCategoryList = value;
    });
  }

  late final _$productsElementsAtom =
      Atom(name: 'CreatedProductsBase.productsElements', context: context);

  @override
  ObservableList<ProductElementModel> get productsElements {
    _$productsElementsAtom.reportRead();
    return super.productsElements;
  }

  @override
  set productsElements(ObservableList<ProductElementModel> value) {
    _$productsElementsAtom.reportWrite(value, super.productsElements, () {
      super.productsElements = value;
    });
  }

  late final _$categoriesFirstLevelAtom =
      Atom(name: 'CreatedProductsBase.categoriesFirstLevel', context: context);

  @override
  ObservableList<ProductCategoryModel> get categoriesFirstLevel {
    _$categoriesFirstLevelAtom.reportRead();
    return super.categoriesFirstLevel;
  }

  @override
  set categoriesFirstLevel(ObservableList<ProductCategoryModel> value) {
    _$categoriesFirstLevelAtom.reportWrite(value, super.categoriesFirstLevel,
        () {
      super.categoriesFirstLevel = value;
    });
  }

  late final _$groupElementAtom =
      Atom(name: 'CreatedProductsBase.groupElement', context: context);

  @override
  ObservableList<ProductElementModel> get groupElement {
    _$groupElementAtom.reportRead();
    return super.groupElement;
  }

  @override
  set groupElement(ObservableList<ProductElementModel> value) {
    _$groupElementAtom.reportWrite(value, super.groupElement, () {
      super.groupElement = value;
    });
  }

  late final _$groupElementNamesAtom =
      Atom(name: 'CreatedProductsBase.groupElementNames', context: context);

  @override
  ObservableList<String> get groupElementNames {
    _$groupElementNamesAtom.reportRead();
    return super.groupElementNames;
  }

  @override
  set groupElementNames(ObservableList<String> value) {
    _$groupElementNamesAtom.reportWrite(value, super.groupElementNames, () {
      super.groupElementNames = value;
    });
  }

  late final _$searchNameAtom =
      Atom(name: 'CreatedProductsBase.searchName', context: context);

  @override
  String get searchName {
    _$searchNameAtom.reportRead();
    return super.searchName;
  }

  @override
  set searchName(String value) {
    _$searchNameAtom.reportWrite(value, super.searchName, () {
      super.searchName = value;
    });
  }

  late final _$nameSearchContrallerAtom =
      Atom(name: 'CreatedProductsBase.nameSearchContraller', context: context);

  @override
  TextEditingController get nameSearchContraller {
    _$nameSearchContrallerAtom.reportRead();
    return super.nameSearchContraller;
  }

  @override
  set nameSearchContraller(TextEditingController value) {
    _$nameSearchContrallerAtom.reportWrite(value, super.nameSearchContraller,
        () {
      super.nameSearchContraller = value;
    });
  }

  late final _$getProductsAsyncAction =
      AsyncAction('CreatedProductsBase.getProducts', context: context);

  @override
  Future getProducts({required BuildContext context}) {
    return _$getProductsAsyncAction
        .run(() => super.getProducts(context: context));
  }

  late final _$postProductsAsyncAction =
      AsyncAction('CreatedProductsBase.postProducts', context: context);

  @override
  Future postProducts(
      {required ProductElementModel productElementModel,
      required BuildContext context}) {
    return _$postProductsAsyncAction.run(() => super.postProducts(
        productElementModel: productElementModel, context: context));
  }

  late final _$addGroupAsyncAction =
      AsyncAction('CreatedProductsBase.addGroup', context: context);

  @override
  Future addGroup(
      {required dynamic guid,
      required dynamic parentGuid,
      required dynamic caption,
      required dynamic isRoot,
      required BuildContext context}) {
    return _$addGroupAsyncAction.run(() => super.addGroup(
        guid: guid,
        parentGuid: parentGuid,
        caption: caption,
        isRoot: isRoot,
        context: context));
  }

  late final _$delGroupAsyncAction =
      AsyncAction('CreatedProductsBase.delGroup', context: context);

  @override
  Future delGroup({required BuildContext context, required dynamic guid}) {
    return _$delGroupAsyncAction
        .run(() => super.delGroup(context: context, guid: guid));
  }

  late final _$changeGroupeAsyncAction =
      AsyncAction('CreatedProductsBase.changeGroupe', context: context);

  @override
  Future<void> changeGroupe(
      {required BuildContext context,
      required dynamic guid,
      required dynamic newguid,
      required dynamic oldguid,
      required dynamic isRoot}) {
    return _$changeGroupeAsyncAction.run(() => super.changeGroupe(
        context: context,
        guid: guid,
        newguid: newguid,
        oldguid: oldguid,
        isRoot: isRoot));
  }

  late final _$CreatedProductsBaseActionController =
      ActionController(name: 'CreatedProductsBase', context: context);

  @override
  dynamic categoryFirstMade() {
    final _$actionInfo = _$CreatedProductsBaseActionController.startAction(
        name: 'CreatedProductsBase.categoryFirstMade');
    try {
      return super.categoryFirstMade();
    } finally {
      _$CreatedProductsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearGroupState() {
    final _$actionInfo = _$CreatedProductsBaseActionController.startAction(
        name: 'CreatedProductsBase.clearGroupState');
    try {
      return super.clearGroupState();
    } finally {
      _$CreatedProductsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsCategoryList: ${productsCategoryList},
productsElements: ${productsElements},
categoriesFirstLevel: ${categoriesFirstLevel},
groupElement: ${groupElement},
groupElementNames: ${groupElementNames},
searchName: ${searchName},
nameSearchContraller: ${nameSearchContraller}
    ''';
  }
}
