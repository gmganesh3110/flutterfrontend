// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productfilter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get soryBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFilterModelCopyWith<ProductFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterModelCopyWith<$Res> {
  factory $ProductFilterModelCopyWith(
          ProductFilterModel value, $Res Function(ProductFilterModel) then) =
      _$ProductFilterModelCopyWithImpl<$Res, ProductFilterModel>;
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? categoryId, String? soryBy});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$ProductFilterModelCopyWithImpl<$Res, $Val extends ProductFilterModel>
    implements $ProductFilterModelCopyWith<$Res> {
  _$ProductFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? soryBy = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      soryBy: freezed == soryBy
          ? _value.soryBy
          : soryBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get paginationModel {
    return $PaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductFilterModelImplCopyWith<$Res>
    implements $ProductFilterModelCopyWith<$Res> {
  factory _$$ProductFilterModelImplCopyWith(_$ProductFilterModelImpl value,
          $Res Function(_$ProductFilterModelImpl) then) =
      __$$ProductFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? categoryId, String? soryBy});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$ProductFilterModelImplCopyWithImpl<$Res>
    extends _$ProductFilterModelCopyWithImpl<$Res, _$ProductFilterModelImpl>
    implements _$$ProductFilterModelImplCopyWith<$Res> {
  __$$ProductFilterModelImplCopyWithImpl(_$ProductFilterModelImpl _value,
      $Res Function(_$ProductFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? soryBy = freezed,
  }) {
    return _then(_$ProductFilterModelImpl(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      soryBy: freezed == soryBy
          ? _value.soryBy
          : soryBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProductFilterModelImpl implements _ProductFilterModel {
  _$ProductFilterModelImpl(
      {required this.paginationModel, this.categoryId, this.soryBy});

  @override
  final PaginationModel paginationModel;
  @override
  final String? categoryId;
  @override
  final String? soryBy;

  @override
  String toString() {
    return 'ProductFilterModel(paginationModel: $paginationModel, categoryId: $categoryId, soryBy: $soryBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterModelImpl &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.soryBy, soryBy) || other.soryBy == soryBy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paginationModel, categoryId, soryBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterModelImplCopyWith<_$ProductFilterModelImpl> get copyWith =>
      __$$ProductFilterModelImplCopyWithImpl<_$ProductFilterModelImpl>(
          this, _$identity);
}

abstract class _ProductFilterModel implements ProductFilterModel {
  factory _ProductFilterModel(
      {required final PaginationModel paginationModel,
      final String? categoryId,
      final String? soryBy}) = _$ProductFilterModelImpl;

  @override
  PaginationModel get paginationModel;
  @override
  String? get categoryId;
  @override
  String? get soryBy;
  @override
  @JsonKey(ignore: true)
  _$$ProductFilterModelImplCopyWith<_$ProductFilterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
