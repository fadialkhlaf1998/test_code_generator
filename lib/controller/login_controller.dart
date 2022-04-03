import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_code_generator/app_localization.dart';
import 'package:test_code_generator/helper/api.dart';
import 'package:test_code_generator/helper/app.dart';
import 'package:test_code_generator/helper/global.dart';
import 'package:test_code_generator/view/home.dart';
import 'package:test_code_generator/view/no_internet.dart';

class LoginController extends GetxController{

  Rx<bool> validate = false.obs;
  Rx<bool> fake = false.obs;
  Rx<bool> loading = false.obs;
  Rx<bool> hide = true.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context){
    validate.value = true;
    if(email.text.isNotEmpty&&password.text.isNotEmpty){
      loading.value = true;
      API.checkInternet().then((value) async{
        if(value){
          API.email = email.text;
          API.password = password.text;
          API.login().then((value) {
            loading.value = false;
            if(value != null){
              App.sucss_msg(context, App_Localization.of(context).translate("succ_login"));
              Get.offAll(()=>Home());
            }else{
              App.error_msg(context, App_Localization.of(context).translate("err_login"));
            }
          });
        }else{
          Get.to(()=>NoInternet())!.then((value) {
            login(context);
          });
        }
      }).catchError((err){
        loading.value = false;
        err.printError();
      });
    }
  }

}