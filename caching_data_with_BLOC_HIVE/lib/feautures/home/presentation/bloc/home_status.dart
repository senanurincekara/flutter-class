import 'package:cache/feautures/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeProductsStatus {}

class HomeProductsStatusInit extends HomeProductsStatus {}

class HomeProductsStatusLoading extends HomeProductsStatus {}

class HomeProductsStatusError extends HomeProductsStatus {
  final String errorMsg;
  HomeProductsStatusError(this.errorMsg);
}

class HomeProductsStatusCompleted extends HomeProductsStatus {
  final ProductModel products;
  HomeProductsStatusCompleted(this.products);
}
