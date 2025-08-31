import 'package:e_commerce_clot/features/product/domain/entities/product_color_entity.dart';

class ProductColorModel {
  final String title;
  final String hexcode;

  ProductColorModel({required this.title, required this.hexcode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'hexcode': hexcode};
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
  return ProductColorModel(
    title: map['title']?.toString() ?? 'Unknown',
    hexcode: map['hexcode']?.toString() ?? '#000000',
  );
}

}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(title: title, hexcode: hexcode);
  }
}
