import 'package:get/get.dart';
import 'package:test_code_generator/controller/cart_contoller.dart';
import 'package:test_code_generator/controller/home_controller.dart';
import 'package:test_code_generator/controller/wishlist_controller.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/store.dart';
import 'package:test_code_generator/model/login_info.dart';
import 'package:test_code_generator/model/post.dart';
import 'package:test_code_generator/view/home.dart';
import 'package:test_code_generator/view/login.dart';
import 'package:test_code_generator/view/no_internet.dart';
import 'package:test_code_generator/view/verification_code.dart';

class IntroController extends GetxController{

  List<List<Post>> main_posts = [<Post>[]];
  HomeController homeController = Get.put(HomeController());
  CartController cartController = Get.put(CartController());
  WishListController wishListController = Get.put(WishListController());

  @override
  void onInit() {
    super.onInit();
    get_data();
  }

  login()async{
    LogInInfo? logInInfo = await Store.loadLogInInfo();
    API.is_active = await Store.isActive();
    if(logInInfo!=null){
      await API.login();
    }
    return ;
  }

  get_data(){
    API.checkInternet().then((value) async{
        if(value){
          main_posts.clear();
            API.getCompanyId().then((value)async{
              await login();
              for(int i=0;i<API.main_parents.length;i++){
                var newList = await API.getPostByPostType(API.main_parents[i]);
                main_posts.add(newList);
              }
              cartController.cart.value = await Store.loadCart();
              cartController.saveCart();
              wishListController.wishlist.value = await API.getWishlist();
              get_nave();
            });
        }else{
          Get.to(()=>NoInternet())!.then((value) {
            get_data();
          });
        }
    }).catchError((err){
      err.printError();
    });
  }

  get_nave(){
    homeController.main_posts=main_posts;
    Get.to(()=>Home());
    if(API.email.isNotEmpty&&API.is_active==true){
      Get.offAll(()=>Home());
    }else if(API.email.isNotEmpty&&API.is_active==false){
      Get.to(()=>VerificationCode());
    }else{
      Get.offAll(()=>LogIn());
    }
  }
}