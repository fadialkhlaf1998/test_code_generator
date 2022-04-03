import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/global.dart';
import 'package:test_code_generator/main.dart';
import 'package:test_code_generator/model/line_item.dart';
import 'package:test_code_generator/model/login_info.dart';
import 'package:test_code_generator/model/post.dart';
import 'package:test_code_generator/view/login.dart';

class Store{
  static saveLanguage(String lang){
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("language", lang);
    });
  }

  static changeLanguage(BuildContext context,String lang){
    Global.language=lang;
    Locale locale =Locale(lang);
    MyApp.set_locale(context, locale);
    saveLanguage(lang);
  }

  static Future<String> loadLanguage()async{
    var prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("language")??"en";
    Global.language = lang;
    return lang;
  }

  static saveLogInInfo(String email,String password){
    SharedPreferences.getInstance().then((prefs) {
      LogInInfo loginInfo = LogInInfo(email: email, password: password);
      prefs.setString("loginInfo", loginInfo.toJson());
    });
  }

  static Future<LogInInfo?> loadLogInInfo()async{
    var prefs = await SharedPreferences.getInstance();
    LogInInfo? loginInfo = prefs.getString("loginInfo")==null?null:LogInInfo.fromJson(prefs.getString("loginInfo")!);
    if(loginInfo!=null){
      API.email= loginInfo.email;
      API.password= loginInfo.password;
    }
    return loginInfo;
  }

  static Future<bool> isActive()async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool("active")??false;
  }

  static saveActive(bool val)async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.setBool("active",val);
  }

  static saveCart(List<LineItem> cart){
    SharedPreferences.getInstance().then((prefs) {
      LineItemDecoder lineItemDecoder = LineItemDecoder(cart: cart);
      prefs.setString("cart", lineItemDecoder.toJson());
    });
  }

  static Future <List<LineItem>> loadCart()async{
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("cart")??"non";
    if(data!="non"){
      List<LineItem> cart = LineItemDecoder.fromJson(data).cart;
      List<int> ids = <int>[];
      for(int i=0;i<cart.length;i++){
        ids.add(cart[i].post.id);
      }

      List<Post> posts = await API.restoreCart(ids);
      for(int i=0;i<cart.length;i++){
        for(int j=0;j<posts.length;j++){
          if(posts[j].id==cart[i].post.id){
            cart[i].post=posts[j];
          }
        }
      }
      return cart;
    }else{
      return <LineItem>[];
    }
  }

  static logout()async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("active");
    prefs.remove("loginInfo");
    API.is_active =false;
    API.email="";
    API.password="";
    API.customer_id=-1;
    Get.to(()=>LogIn());
  }
}