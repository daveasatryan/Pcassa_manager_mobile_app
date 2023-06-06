// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_page_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CashierPageAccessModel _$$_CashierPageAccessModelFromJson(
        Map<String, dynamic> json) =>
    _$_CashierPageAccessModel(
      TablesScreen: (json['TablesScreen'] as List<dynamic>?)
              ?.map((e) =>
                  AccessPageAccessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AccessPageAccessModel>[],
      quick_check: (json['quick_check'] as List<dynamic>?)
              ?.map((e) =>
                  AccessPageAccessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AccessPageAccessModel>[],
    );

Map<String, dynamic> _$$_CashierPageAccessModelToJson(
        _$_CashierPageAccessModel instance) =>
    <String, dynamic>{
      'TablesScreen': instance.TablesScreen,
      'quick_check': instance.quick_check,
    };
