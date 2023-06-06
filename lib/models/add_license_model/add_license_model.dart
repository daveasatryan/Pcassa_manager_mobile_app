import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_license_model.freezed.dart';
part 'add_license_model.g.dart';

@freezed
class AddLicenseModel with _$AddLicenseModel {
  factory AddLicenseModel(
      {int? port,
      String? ip,
      String? license_key,
     }) = _AddLicenseModel;

  factory AddLicenseModel.fromJson(Map<String, dynamic> json) =>
      _$AddLicenseModelFromJson(json);
}
