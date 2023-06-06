import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail/models/tovar_array_items/tovar_array_items.dart';

part 'tovar_arrays.freezed.dart';

part 'tovar_arrays.g.dart';

@freezed
class TovarArray with _$TovarArray {
  factory TovarArray({
    @Default([]) List<TovarArrayItems> tovarArrays,
   
  }) = _TovarArray;

  factory TovarArray.fromJson(Map<String, dynamic> json) =>
      _$TovarArrayFromJson(json);
}
