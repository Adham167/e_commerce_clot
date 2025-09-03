// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_clot/features/product/data/models/product_color_model.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
  return ProductModel(
    categoryId: map['categoryId'] as String,
    colors: (map['colors'] as List<dynamic>)
        .map((e) => ProductColorModel.fromMap(e as Map<String, dynamic>))
        .toList(),
    createdDate: map['createdDate'] as Timestamp,
    discountedPrice: map['discountedPrice'] as num,
    gender: map['gender'] as int,
    images: (map['images'] as List<dynamic>).map((e) => e.toString()).toList(),
    price: map['price'] as num,
    sizes: (map['sizes'] as List<dynamic>).map((e) => e.toString()).toList(),
    productId: map['productId'] as String,
    salesNumber: map['salesNumber'] as int,
    title: map['title'] as String,
  );
}
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e)=>e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
