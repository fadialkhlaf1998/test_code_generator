import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_code_generator/app_localization.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/app.dart';
import 'package:test_code_generator/helper/global.dart';
import 'package:test_code_generator/model/post.dart';

class WishListController extends GetxController{
  RxList<Post> wishlist = <Post>[].obs;

  wishlistFunction(Post post,BuildContext context){
    if(API.customer_id!=-1){
      if(post.favorite.value){
        deleteFromWishlist(post);
      }else{
        addToWishlist(post);
      }
    }else{
      App.error_msg(context, App_Localization.of(context).translate("login_first"));
    }

  }

  addToWishlist(Post post){
    post.favorite.value = true;
    wishlist.add(post);
    API.addToWishlist(post.id);
  }

  deleteFromWishlist(Post post){
    post.favorite.value = false;
    wishlist.removeAt(getWishlistIndex(post));
    API.deleteFromWishlist(post.id);
  }
  int getWishlistIndex(Post post){
    for(int i=0;i<wishlist.length;i++){
      if(wishlist[i].id==post.id){
        return i;
      }
    }
    return -1;
  }
}