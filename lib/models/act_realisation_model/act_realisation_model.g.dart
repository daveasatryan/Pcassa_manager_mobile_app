// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_realisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActRealisationModel _$$_ActRealisationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ActRealisationModel(
      kod_tov: json['kod_tov'] as String?,
      barcode: json['barcode'] as String?,
      name: json['name'] as String?,
      ed_izm: json['ed_izm'] as String?,
      summa_o: json['summa_o'] as int?,
      summa_p: json['summa_p'] as int?,
      nacenka: json['nacenka'] as int?,
      nacenka_tokos: json['nacenka_tokos'] as int?,
      skl1name: json['skl1name'] as String?,
    );

Map<String, dynamic> _$$_ActRealisationModelToJson(
        _$_ActRealisationModel instance) =>
    <String, dynamic>{
      'kod_tov': instance.kod_tov,
      'barcode': instance.barcode,
      'name': instance.name,
      'ed_izm': instance.ed_izm,
      'summa_o': instance.summa_o,
      'summa_p': instance.summa_p,
      'nacenka': instance.nacenka,
      'nacenka_tokos': instance.nacenka_tokos,
      'skl1name': instance.skl1name,
    };
