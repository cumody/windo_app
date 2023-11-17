// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:windo_app/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'Other',
    this.rate,
  });
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.listItemImage[0],
    category: 'Clothes',
    discountValue: 12,
  ),
  Product(
    id: '1',
    title: 'Jacket',
    price: 300,
    imgUrl: AppAssets.listItemImage[1],
    category: 'Clothes',
    discountValue: 17,
  ),
  Product(
    id: '1',
    title: 'Socks',
    price: 300,
    imgUrl: AppAssets.listItemImage[2],
    category: 'Clothes',
    discountValue: 16,
  ),
  Product(
    id: '1',
    title: 'Hoodies',
    price: 300,
    imgUrl: AppAssets.listItemImage[3],
    category: 'Clothes',
    discountValue: 32,
  ),
  Product(
    id: '1',
    title: 'Underwears',
    price: 300,
    imgUrl: AppAssets.listItemImage[4],
    category: 'Clothes',
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: AppAssets.listItemImage[5],
    category: 'Clothes',
    discountValue: 21,
  ),
];
