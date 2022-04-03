import 'dart:convert';
import 'dart:ffi';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:test_code_generator/helper/global.dart';
import 'package:test_code_generator/helper/store.dart';
import 'package:test_code_generator/model/customer.dart';
import 'package:test_code_generator/model/post.dart';
import 'package:test_code_generator/model/post_type.dart';


class API{
    static String url = "http://10.0.2.2:3000";
    static String media_url = url + "/uploads/" ;
    static List<int> main_parents = [13,15];
    static int product = 12;
    static int customer_id = -1;
    static String email="";
    static String password="";
    static bool is_active=false;
    static String cookie="";
    static Customer? customer;
    static String public_key="HolybTiE3Hh3rJqcDt8nzcDoxLegXaOYpx5jOosmrQxG1KUH26";


    static Future<int> getCompanyId()async{
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(url+'/api/app-key'));
      request.body = json.encode({
        "public_key": public_key
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        cookie=response.headers["set-cookie"].toString();
      var data = await response.stream.bytesToString();
        var jsondata = json.decode(data);
        return jsondata["company_id"];
      }
      else {
      print(response.reasonPhrase);
      return -1;
      }

    }
    static Future<List<PostType>> postType()async{
      var headers = {
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-type-mobile'));
      request.body = json.encode({
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostTypeDecoder.fromMap(json.decode(data)).postTypes;
      }
      else {
        print(response.reasonPhrase);
        return <PostType>[];
      }

    }
    static Future<List<Post>> getPostByPostType(int post_type_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-post-type'));
      request.body = json.encode({
        "id": post_type_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        print(response.reasonPhrase);
        return <Post>[];
      }
    }
    static Future<List<Post>> getByParent1(int parent_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-parent-1'));
      request.body = json.encode({
        "parent_id": parent_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<List<Post>> getByParent2(int parent_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-parent-2'));
      request.body = json.encode({
        "parent_id": parent_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<List<Post>> getByParent3(int parent_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-parent-3'));
      request.body = json.encode({
        "parent_id": parent_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<List<Post>> getByParent4(int parent_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-parent-4'));
      request.body = json.encode({
        "parent_id": parent_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<List<Post>> getByParent5(int parent_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-parent-5'));
      request.body = json.encode({
        "parent_id": parent_id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<List<Post>> search(String query)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-search'));
      request.body = json.encode({
        "query": query,
        "post_type_id": product,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }
    }
    static Future<Post?> getPostInfo(int id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/post-by-id'));
      request.body = json.encode({
        "id": id,
        "customer_id":customer_id,
        "locale":Global.language
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        List<Post> posts = PostDecoder.fromMap(json.decode(data)).posts;
        return posts.isEmpty?null:posts.first;
      }
      else {
        var data = await response.stream.bytesToString();
        return null;
      }
    }

    static Future<List<Post>> getWishlist()async{
      if(customer_id!=-1){
        var headers = {
          'Content-Type': 'application/json',
          'cookie': cookie
        };
        var request = http.Request('POST', Uri.parse(url+'/api/wishlist'));
        request.body = json.encode({
          "customer_id": customer_id
        });
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          var data = await response.stream.bytesToString();
          return PostDecoder.fromMap(json.decode(data)).posts;
        }
        else {
          var data = await response.stream.bytesToString();
          return <Post>[];
        }
      }else {
        return <Post>[];
      }

    }
    static Future<bool> addToWishlist(int post_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/add-wishlist'));
      request.body = json.encode({
        "customer_id": customer_id,
        "post_id": post_id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }

    }
    static Future<bool> deleteFromWishlist(int post_id)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('DELETE', Uri.parse(url+'/api/delete-wishlist'));
      request.body = json.encode({
        "customer_id": customer_id,
        "post_id": post_id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<List<Post>> restoreCart(List<int> cart)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/cart'));
      request.body = json.encode({
        "array": cart
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return PostDecoder.fromMap(json.decode(data)).posts;
      }
      else {
        var data = await response.stream.bytesToString();
        return <Post>[];
      }

    }

    static Future<int> discountCode(String code)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/check-discount-code'));
      request.body = json.encode({
        "code": code
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return json.decode(data)["amount"];
      }
      else {
        print(response.reasonPhrase);
        return 0;
      }
    }

    static Future<Customer?> login()async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/customer-login'));
      request.body = json.encode({
        "email": email.toLowerCase().replaceAll(" ", ""),
        "password": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        Customer customer = Customer.fromMap(jsonDecode(data));
        customer_id=customer.id;
        Store.saveLogInInfo(email.toLowerCase().replaceAll(" ", ""), password);
        Store.saveActive(true);
        API.customer = customer;
        return customer;
      }
      else {
        print(response.reasonPhrase);
        return null;
      }

    }
    static Future<bool> signUp(String firstname , String lastname , String email , String password)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('POST', Uri.parse(url+'/api/customer-signup'));
      request.body = json.encode({
        "firstname": firstname,
        "lastname": lastname,
        "email": email.toLowerCase().replaceAll(" ", ""),
        "password": password
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Store.saveLogInInfo(email.toLowerCase().replaceAll(" ", ""), password);
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }

    }
    static Future<bool> verify(String email , String code)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };

      var request = http.Request('POST', Uri.parse(url+'/api/customer-verify-email'));
      request.body = json.encode({
        "email": email.toLowerCase().replaceAll(" ", ""),
        "code": code.replaceAll(" ", "")
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Store.saveActive(true);
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<bool> resendCode(String email)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };

      var request = http.Request('POST', Uri.parse(url+'/api/resend-code'));
      request.body = json.encode({
        "email": email.toLowerCase().replaceAll(" ", ""),
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<bool> upload_customer_photo(String path)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };

      var request = http.MultipartRequest('PUT', Uri.parse(url+'/api/customer-upload-image'));
      request.fields.addAll({
        'id': customer_id.toString()
      });
      request.files.add(await http.MultipartFile.fromPath('file', path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<bool> delete_account()async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };
      var request = http.Request('DELETE', Uri.parse(url+'/api/customer-delete-account'));
      request.body = json.encode({
        "id": customer_id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Store.logout();
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<bool> change_password(String new_password)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };

      var request = http.Request('PUT', Uri.parse(url+'/api/customer-change-password'));
      request.body = json.encode({
        "password": new_password,
        "id": customer_id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        password = new_password;
        Store.saveLogInInfo(email, password);
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }
    static Future<bool> forgot_password(String email)async{
      var headers = {
        'Content-Type': 'application/json',
        'cookie': cookie
      };

      var request = http.Request('POST', Uri.parse(url+'/api/customer-forgot-password'));
      request.body = json.encode({
        "email": email.toLowerCase().replaceAll(" ", ""),
        "id": customer_id
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      }
      else {
        print(response.reasonPhrase);
        return false;
      }
    }

    static Future<bool> checkInternet()async{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      }else{
        return false;
      }
   }



}