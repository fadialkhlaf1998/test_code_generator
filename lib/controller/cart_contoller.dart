import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_code_generator/app_localization.dart';
import 'package:test_code_generator/helper/app.dart';
import 'package:test_code_generator/helper/store.dart';
import 'package:test_code_generator/model/line_item.dart';
import 'package:test_code_generator/model/post.dart';

class CartController extends GetxController{

  RxList<LineItem> cart = <LineItem>[].obs;
  Rx<double> subTotal = 0.0.obs,total = 0.0.obs,shipping = 0.0.obs;
  Rx<bool> fake = false.obs;

  bool addToCart(Post post,int count,BuildContext context){
    int oldCount = checkInCart(post);
      if(oldCount>0){
        if(post.availability! >= (count + oldCount)){
          for(int i=0;i<cart.length;i++){
            if(cart[i].post.id==post.id){
              cart[i].count = count + oldCount;
              cart[i].price = post.price!.toString() + " X " + cart[i].count.toString();
              break;
            }
          }
          saveCart();
          App.sucss_msg(context, App_Localization.of(context).translate("add_to_cart_msg"));
          return true;
        }else{
          App.error_msg(context, App_Localization.of(context).translate("out_of_stock"));
          return false;
        }
      }else{
        if(post.availability! >= count){
          cart.add(LineItem(post: post, count: count, price: post.price!.toString() + " X " + count.toString()));
          saveCart();
          App.sucss_msg(context, App_Localization.of(context).translate("add_to_cart_msg"));
          return true;
        }else{
          App.error_msg(context, App_Localization.of(context).translate("out_of_stock"));
          return false;
        }
      }
  }

  removeFromCart(index){
    cart.removeAt(index);
    saveCart();
  }

  int checkInCart(Post post){
    for(int i=0;i<cart.length;i++){
      if(cart[i].post.id==post.id){
        return cart[i].count;
      }
    }
    return 0;
  }

  increase(Post post , int count,BuildContext context){
    int oldCount = checkInCart(post);
    if(post.availability! >= (count + oldCount)){
      for(int i=0;i<cart.length;i++){
        if(cart[i].post.id==post.id){
          cart[i].count = count + oldCount;
          cart[i].price = post.price!.toString() + " X " + cart[i].count.toString();
          print(cart[i].price);
          break;
        }
      }
      saveCart();
    }else{
      App.error_msg(context, App_Localization.of(context).translate("out_of_stock"));
    }
  }

  decrease(Post post , int count,BuildContext context){
    int oldCount = checkInCart(post);
    if(count+oldCount>0&&post.availability! >= (count + oldCount)){
      for(int i=0;i<cart.length;i++){
        if(cart[i].post.id==post.id){
          cart[i].count = count + oldCount;
          cart[i].price = post.price!.toString() + " X " + cart[i].count.toString();
          print(cart[i].price);
          break;
        }
      }
      saveCart();
    }
  }

  saveCart(){
    Store.saveCart(cart);
    double x = 0.0;
    for(int i=0;i<cart.length;i++){
      x += (cart[i].post.price! * cart[i].count);
    }
    subTotal.value = x;
    total.value = subTotal.value + shipping.value;
    fake.value = !fake.value;
  }
}