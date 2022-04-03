import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_code_generator/app_localization.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/app.dart';
import 'package:test_code_generator/view/no_internet.dart';

class ProfileController extends GetxController{
  Rx<bool> fake = false.obs;
  Rx<bool> loading = false.obs;

  pickImage()async{
    final ImagePicker _picker = ImagePicker();
    // todo check functionlity
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      loading.value = true;
      API.checkInternet().then((value) async{
        if(value){
          API.upload_customer_photo(image.path).then((value) {
            API.login().then((value) {
              loading.value = false;
            });
          });
        }else{
          Get.to(()=>NoInternet())!;
        }
      }).catchError((err){
        loading.value = false;
        err.printError();
      });
    }
  }

  deleteAccount(BuildContext context){
    loading.value = true;
    API.checkInternet().then((value) async{
      if(value){
        API.delete_account().then((value) {
          loading.value=false;
          if(!value){
            App.error_msg(context, App_Localization.of(context).translate("oops"));
          }
        });
      }else{
        Get.to(()=>NoInternet())!;
      }
    }).catchError((err){
      loading.value = false;
      err.printError();
    });
  }

}