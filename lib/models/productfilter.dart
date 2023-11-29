import 'package:client/models/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'productfilter.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel({
    required PaginationModel paginationModel,
    String? categoryId,
    String? soryBy,
  }) = _ProductFilterModel;
}
