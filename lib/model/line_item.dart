import 'dart:convert';
import 'package:test_code_generator/model/post.dart';

class LineItemDecoder{
  List<LineItem> cart;

  LineItemDecoder({required this.cart});

  factory LineItemDecoder.fromJson(String str) => LineItemDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LineItemDecoder.fromMap(Map<String, dynamic> json) => LineItemDecoder(
    cart: List<LineItem>.from(json["cart"].map((x) => LineItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "cart": List<dynamic>.from(cart.map((x) => x.toMap())),
  };
}

class LineItem {
  Post post;
  int count;
  String price;

  LineItem({required this.post,required this.count,required this.price});

  factory LineItem.fromJson(String str) => LineItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LineItem.fromMap(Map<String, dynamic> json) => LineItem(
    post: Post.fromMap(json["post"]),
    count: json["count"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "post": post.toMap(),
    "count": count,
    "price": price,
  };
}