enum QuickMenuPagesType { products, users, discounts, currencys }

extension QuickMenuPagesTypeTranslation on QuickMenuPagesType {
  String get title {
    switch (this) {
      case QuickMenuPagesType.products:
        return 'QuickMenuPagesType.addMenu';
      case QuickMenuPagesType.users:
        return 'QuickMenuPagesType.addUsers';
      case QuickMenuPagesType.discounts:
        return 'QuickMenuPagesType.addDiscounts';
      case QuickMenuPagesType.currencys:
        return 'QuickMenuPagesType.addCurrency';
    }
  }
}
