import 'package:client/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'productstate.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState(
      {@Default(<Product>[]) List<Product> products,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _ProductState;
}
