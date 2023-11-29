import 'package:client/config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'slider.freezed.dart';
part 'slider.g.dart';

List<SlideModel> slidersFromJson(dynamic str) =>
    List<SlideModel>.from((str).map((e) => SlideModel.fromJson(e)));

@freezed
abstract class SlideModel with _$SlideModel {
  factory SlideModel({
    required String sliderName,
    required String sliderId,
    required String sliderImage,
  }) = _Slider;
  factory SlideModel.fromJson(Map<String, dynamic> json) =>
      _$SlideModelFromJson(json);
}

extension SliderModelExt on SlideModel {
  String get fullImagePath => Config.appUrl + sliderImage;
}
