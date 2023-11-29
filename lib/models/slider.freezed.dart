// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlideModel _$SlideModelFromJson(Map<String, dynamic> json) {
  return _Slider.fromJson(json);
}

/// @nodoc
mixin _$SlideModel {
  String get sliderName => throw _privateConstructorUsedError;
  String get sliderId => throw _privateConstructorUsedError;
  String get sliderImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideModelCopyWith<SlideModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideModelCopyWith<$Res> {
  factory $SlideModelCopyWith(
          SlideModel value, $Res Function(SlideModel) then) =
      _$SlideModelCopyWithImpl<$Res, SlideModel>;
  @useResult
  $Res call({String sliderName, String sliderId, String sliderImage});
}

/// @nodoc
class _$SlideModelCopyWithImpl<$Res, $Val extends SlideModel>
    implements $SlideModelCopyWith<$Res> {
  _$SlideModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sliderName = null,
    Object? sliderId = null,
    Object? sliderImage = null,
  }) {
    return _then(_value.copyWith(
      sliderName: null == sliderName
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderId: null == sliderId
          ? _value.sliderId
          : sliderId // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: null == sliderImage
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SliderImplCopyWith<$Res>
    implements $SlideModelCopyWith<$Res> {
  factory _$$SliderImplCopyWith(
          _$SliderImpl value, $Res Function(_$SliderImpl) then) =
      __$$SliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sliderName, String sliderId, String sliderImage});
}

/// @nodoc
class __$$SliderImplCopyWithImpl<$Res>
    extends _$SlideModelCopyWithImpl<$Res, _$SliderImpl>
    implements _$$SliderImplCopyWith<$Res> {
  __$$SliderImplCopyWithImpl(
      _$SliderImpl _value, $Res Function(_$SliderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sliderName = null,
    Object? sliderId = null,
    Object? sliderImage = null,
  }) {
    return _then(_$SliderImpl(
      sliderName: null == sliderName
          ? _value.sliderName
          : sliderName // ignore: cast_nullable_to_non_nullable
              as String,
      sliderId: null == sliderId
          ? _value.sliderId
          : sliderId // ignore: cast_nullable_to_non_nullable
              as String,
      sliderImage: null == sliderImage
          ? _value.sliderImage
          : sliderImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SliderImpl implements _Slider {
  _$SliderImpl(
      {required this.sliderName,
      required this.sliderId,
      required this.sliderImage});

  factory _$SliderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SliderImplFromJson(json);

  @override
  final String sliderName;
  @override
  final String sliderId;
  @override
  final String sliderImage;

  @override
  String toString() {
    return 'SlideModel(sliderName: $sliderName, sliderId: $sliderId, sliderImage: $sliderImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderImpl &&
            (identical(other.sliderName, sliderName) ||
                other.sliderName == sliderName) &&
            (identical(other.sliderId, sliderId) ||
                other.sliderId == sliderId) &&
            (identical(other.sliderImage, sliderImage) ||
                other.sliderImage == sliderImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sliderName, sliderId, sliderImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      __$$SliderImplCopyWithImpl<_$SliderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SliderImplToJson(
      this,
    );
  }
}

abstract class _Slider implements SlideModel {
  factory _Slider(
      {required final String sliderName,
      required final String sliderId,
      required final String sliderImage}) = _$SliderImpl;

  factory _Slider.fromJson(Map<String, dynamic> json) = _$SliderImpl.fromJson;

  @override
  String get sliderName;
  @override
  String get sliderId;
  @override
  String get sliderImage;
  @override
  @JsonKey(ignore: true)
  _$$SliderImplCopyWith<_$SliderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
