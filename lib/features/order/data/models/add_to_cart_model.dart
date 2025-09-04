// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddToCartModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  AddToCartModel({required this.productId, required this.productTitle, required this.productQuantity, required this.productColor, required this.productSize, required this.productPrice, required this.totalPrice, required this.productImage, required this.createdDate});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddToCartModel.fromJson(String source) => AddToCartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
