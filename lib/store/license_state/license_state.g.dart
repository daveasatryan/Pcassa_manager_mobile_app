// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LicenseState on LicenseStateBase, Store {
  late final _$licenseInfoAtom =
      Atom(name: 'LicenseStateBase.licenseInfo', context: context);

  @override
  AddLicenseModel? get licenseInfo {
    _$licenseInfoAtom.reportRead();
    return super.licenseInfo;
  }

  @override
  set licenseInfo(AddLicenseModel? value) {
    _$licenseInfoAtom.reportWrite(value, super.licenseInfo, () {
      super.licenseInfo = value;
    });
  }

  late final _$addLicenseAsyncAction =
      AsyncAction('LicenseStateBase.addLicense', context: context);

  @override
  Future addLicense(
      {required String device_code,
      required int product_id,
      required int unique_code}) {
    return _$addLicenseAsyncAction.run(() => super.addLicense(
        device_code: device_code,
        product_id: product_id,
        unique_code: unique_code));
  }

  late final _$setLicenseAsyncAction =
      AsyncAction('LicenseStateBase.setLicense', context: context);

  @override
  Future setLicense() {
    return _$setLicenseAsyncAction.run(() => super.setLicense());
  }

  @override
  String toString() {
    return '''
licenseInfo: ${licenseInfo}
    ''';
  }
}
