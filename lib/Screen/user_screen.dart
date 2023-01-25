import 'package:flutter/material.dart';
import 'package:json_and_api/Model/user_get_model.dart';
import 'package:json_and_api/Service/user_get_request.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          List<Post>? posts = snapshot.data;
          return ListView(
            children: posts!
                .map((Post post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text("${post.userId}"),
                    ))
                .toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
