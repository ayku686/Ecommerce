import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product{
  final int id;
  final double price;
  final String title;
  final String description;
  final List<String> images;
  final Category category;
  Product(this.id,this.price,this.title,this.category,this.description,this.images);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Category{
  int id;
  String name;
  String image;
  Category(this.name,this.id,this.image);
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}