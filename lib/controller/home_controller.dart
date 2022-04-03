import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_code_generator/app_localization.dart';
import 'package:test_code_generator/controller/posts_list_controller.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/app.dart';
import 'package:test_code_generator/model/post.dart';
import 'package:test_code_generator/view/filter_list.dart';
import 'package:test_code_generator/view/no_internet.dart';
import 'package:test_code_generator/view/posts_list.dart';
import 'package:test_code_generator/view/product_list.dart';

class HomeController extends GetxController{
  PostListController postListController = Get.put(PostListController());
  List<List<Post>> main_posts = [<Post>[]];
  Rx<bool> loading = false.obs;
  Rx<int> btmNavBarIndex = 0.obs;
  RxList<Post> products = <Post>[].obs;
  Rx<Post>? productInfo ;

  doFunction(int op,int id,BuildContext context){
    switch (op) {
      case 0:
      getPostInfo(id);
        break;
      case 1:
      getByParent1(id,context);
        break;
      case 2:
        getByParent2(id,context);
        break;
      case 3:
        getByParent3(id,context);
        break;
      case 4:
        getByParent4(id,context);
        break;
      case 5:
        getByParent5(id,context);
        break;
      case 6:
        getPostByPostType(id,context);
        break;
    }
  }

  getPostInfo(int postId){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        //todo change page
        API.getPostInfo(postId).then((product_result) {
          productInfo = product_result!.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getPostInfo(postId);
        });
      }
    });
  }
  getByParent1(int parentId,BuildContext context){
    Get.to(()=>PostList(1));
    postListController.loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getByParent1(parentId).then((products_result) {
          postListController.posts.value = products_result;
          postListController.loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getByParent1(parentId,context);
        });
      }
    });
  }
  getByParent2(int parentId,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getByParent2(parentId).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
            products = products_result.obs;
            loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getByParent2(parentId,context);
        });
      }
    });
  }
  getByParent3(int parentId,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getByParent3(parentId).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
          products = products_result.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getByParent3(parentId,context);
        });
      }
    });
  }
  getByParent4(int parentId,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getByParent4(parentId).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
          products = products_result.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getByParent4(parentId,context);
        });
      }
    });
  }
  getByParent5(int parentId,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getByParent5(parentId).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
          products = products_result.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getByParent5(parentId,context);
        });
      }
    });
  }
  getPostByPostType(int postTypeId,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.getPostByPostType(postTypeId).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
          products = products_result.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          getPostByPostType(postTypeId,context);
        });
      }
    });
  }
  search(String query,BuildContext context){
    loading.value=true;
    API.checkInternet().then((internet) {
      if(internet){
        API.search(query).then((products_result) {
          if(products_result.isNotEmpty){
            if(products_result.first.postTypeId==API.product){
              Get.to(()=>ProductList(products_result));
            }else{
              Get.to(()=>FilterList(products_result));
            }
          }else{
            App.error_msg(context, App_Localization.of(context).translate("no_elements"));
          }
          products = products_result.obs;
          loading.value=false;
        });
      }else{
        Get.to(()=>NoInternet())!.then((value){
          search(query,context);
        });
      }
    });
  }
}