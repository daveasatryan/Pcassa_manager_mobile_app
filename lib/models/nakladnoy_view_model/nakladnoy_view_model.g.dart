// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nakladnoy_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_naklViewModel _$$_naklViewModelFromJson(Map<String, dynamic> json) =>
    _$_naklViewModel(
      id: json['id'] as int?,
      typ_d: json['typ_d'] as int?,
      tip_name: json['tip_name'] as String?,
      n_dok: json['n_dok'] as String?,
      kodpost: json['kodpost'] as int?,
      kontname: json['kontname'] as String?,
      data_d: json['data_d'] as String?,
      skl1: json['skl1'] as int?,
      skl1name: json['skl1name'] as String?,
      skl2: json['skl2'] as int?,
      skl2name: json['skl2name'] as String?,
      aktiv: json['aktiv'] as int?,
    );

Map<String, dynamic> _$$_naklViewModelToJson(_$_naklViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typ_d': instance.typ_d,
      'tip_name': instance.tip_name,
      'n_dok': instance.n_dok,
      'kodpost': instance.kodpost,
      'kontname': instance.kontname,
      'data_d': instance.data_d,
      'skl1': instance.skl1,
      'skl1name': instance.skl1name,
      'skl2': instance.skl2,
      'skl2name': instance.skl2name,
      'aktiv': instance.aktiv,
    };
