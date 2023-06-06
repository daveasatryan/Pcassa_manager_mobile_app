import 'package:freezed_annotation/freezed_annotation.dart';

part 'act_view_model.freezed.dart';
part 'act_view_model.g.dart';

@freezed
class ActViewModel with _$ActViewModel {
  factory ActViewModel(
      {int? id,
      int? typ_d,
      String? n_dok,
      String? data_d,
      int? kodpost,
      String? kontname,
      String? srok_oplati,
      int? kod_zat,
      String? name,
      String? prim}) = _ActViewModel;

  factory ActViewModel.fromJson(Map<String, dynamic> json) =>
      _$ActViewModelFromJson(json);
}
