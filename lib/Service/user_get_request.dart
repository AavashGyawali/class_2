import 'dart:convert';

import 'package:http/http.dart';
import 'package:json_and_api/Model/user_get_model.dart';

class HttpService{
  String postsURL = "https://jsonplaceholder.typicode.com/posts";
  Future<List <Post>> getPosts() async{
    Response response = await get(Uri.parse(postsURL));
    if (response.statusCode==200){ //status code 200 le sab ok cha bhancha
      List<dynamic> body =jsonDecode(response.body);//dynamic le string lai hataauncha ra readable banaauncha

      List<Post> posts =body
      .map(
          (dynamic item) => Post.fromJson(item), //json baata aako data lina ko laagi

      )
      .toList();

      return posts;

    }
    else{
      throw "Unable to retrive posts. ";

    }
  }
}