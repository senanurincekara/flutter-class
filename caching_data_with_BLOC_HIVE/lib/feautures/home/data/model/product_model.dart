import 'package:cache/feautures/home/data/model/hive_helper/fields/product_fields.dart';
import 'package:hive/hive.dart';
import 'package:cache/feautures/home/data/model/hive_helper/hive_types.dart';
import 'package:cache/feautures/home/data/model/hive_helper/fields/product_model_fields.dart';

part 'product_model.g.dart';

@HiveType(typeId: HiveTypes.productModel)
class ProductModel extends HiveObject {
  @HiveField(ProductModelFields.success)
  final bool success;
  @HiveField(ProductModelFields.totalProducts)
  final int totalProducts;
  @HiveField(ProductModelFields.message)
  final String message;
  @HiveField(ProductModelFields.offset)
  final int offset;
  @HiveField(ProductModelFields.limit)
  final int limit;
  @HiveField(ProductModelFields.products)
  final List<Product> products;

  ProductModel({
    required this.success,
    required this.totalProducts,
    required this.message,
    required this.offset,
    required this.limit,
    required this.products,
  });

  // fromJson metodu
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json["success"] ?? false,
      totalProducts: json["total_products"] ?? 0,
      message: json["message"] ?? "",
      offset: json["offset"] ?? 0,
      limit: json["limit"] ?? 0,
      products: (json["products"] as List<dynamic>?)
              ?.map((item) => Product.fromJson(item))
              .toList() ??
          [],
    );
  }
}

@HiveType(typeId: HiveTypes.product)
class Product extends HiveObject {
  @HiveField(ProductFields.id)
  final int id;
  @HiveField(ProductFields.price)
  final double price;
  @HiveField(ProductFields.category)
  final String category;
  @HiveField(ProductFields.updatedAt)
  final DateTime updatedAt;
  @HiveField(ProductFields.photoUrl)
  final String photoUrl;
  @HiveField(ProductFields.name)
  final String name;
  @HiveField(ProductFields.description)
  final String description;
  @HiveField(ProductFields.createdAt)
  final DateTime createdAt;

  Product({
    required this.id,
    required this.price,
    required this.category,
    required this.updatedAt,
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      category: json["category"] ?? "",
      updatedAt:
          DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime(1970, 1, 1),
      photoUrl: json["photo_url"] ?? "",
      description: json["description"] ?? "",
      createdAt:
          DateTime.tryParse(json["created_at"] ?? "") ?? DateTime(1970, 1, 1),
    );
  }
}
