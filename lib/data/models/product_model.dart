import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String productId,
    required String productName,
    required String description,
    required String imageUrl,
    required double price,
    @Default(0) int quantity,
    @Default(false) bool isFavorite,
    @Default(false) bool inBasket,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
