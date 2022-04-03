import 'dart:convert';

import 'package:get/get.dart';

class PostDecoder {
  PostDecoder({
    required this.posts,
  });

  List<Post> posts;

  factory PostDecoder.fromJson(String str) => PostDecoder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDecoder.fromMap(Map<String, dynamic> json) => PostDecoder(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toMap())),
  };
}

class Post {
  Post({
    required this.id,
    required this.parent1,
    required this.parent2,
    required this.parent3,
    required this.parent4,
    required this.parent5,
    required this.postTypeId,
    required this.publish,
    required this.search,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.sku,
    required this.slug,
    required this.price,
    required this.regularPrice,
    required this.likes,
    required this.description,
    required this.availability,
    required this.companyId,
    required this.wishlist,
    required this.favorite
  });

  int id;
  int? parent1;
  int? parent2;
  int? parent3;
  int? parent4;
  int? parent5;
  int postTypeId;
  int? publish;
  String? search;
  String? title;
  String? subTitle;
  String? image;
  String? sku;
  String? slug;
  double? price;
  double? regularPrice;
  int? likes;
  Description? description;
  int? availability;
  int companyId;
  int wishlist;
  Rx<bool> favorite;

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    parent1: json["parent_1"],
    parent2: json["parent_2"],
    parent3: json["parent_3"],
    parent4: json["parent_4"],
    parent5: json["parent_5"],
    postTypeId: json["post_type_id"],
    publish: json["publish"],
    search: json["search"],
    title: json["title"],
    subTitle: json["sub_title"],
    image: json["image"],
    sku: json["sku"],
    slug: json["slug"],
    price:json["price"]==null?null: double.parse(json["price"].toString()),
    regularPrice: json["regular_price"]==null?null:double.parse(json["regular_price"].toString()),
    likes: json["likes"],
    description:json["description"]==null?null: Description.fromMap(json["description"]),
    availability: json["availability"],
    companyId: json["company_id"],
    wishlist:json["wishlist"]==null?0: json["wishlist"],
    favorite:json["wishlist"]==null?false.obs: json["wishlist"]==0?false.obs:true.obs,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "parent_1": parent1,
    "parent_2": parent2,
    "parent_3": parent3,
    "parent_4": parent4,
    "parent_5": parent5,
    "post_type_id": postTypeId,
    "publish": publish,
    "search": search,
    "title": title,
    "sub_title": subTitle,
    "image": image,
    "sku": sku,
    "slug": slug,
    "price": price,
    "regular_price": regularPrice,
    "likes": likes,
    "description": description!.toMap(),
    "availability": availability,
    "company_id": companyId,
    "wishlist":wishlist,
  };
}

class Description {
  Description({
    required this.type,
    required this.data,
  });

  String type;
  List<dynamic> data;

  factory Description.fromJson(String str) => Description.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Description.fromMap(Map<String, dynamic> json) => Description(
    type: json["type"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
