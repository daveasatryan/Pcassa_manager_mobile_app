import 'package:freezed_annotation/freezed_annotation.dart';

part 'nakladnoy_view_model.freezed.dart';
part 'nakladnoy_view_model.g.dart';

@freezed
class NaklViewModel with _$NaklViewModel {
  factory NaklViewModel({
    int? id,
    int? typ_d,
    String? tip_name,
    String? n_dok,
    int? kodpost,
    String? kontname,
    String? data_d,
    int? skl1,
    String? skl1name,
    int? skl2,
    String? skl2name,
    int? aktiv,
  }) = _naklViewModel;

  factory NaklViewModel.fromJson(Map<String, dynamic> json) =>
      _$NaklViewModelFromJson(json);
}
