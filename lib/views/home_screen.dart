import 'dart:convert';

import 'package:bloc_application_3/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articleList = [];
  Future<List<ArticleModel>> getArticleApi() async {
    final response = await http
        .get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        articleList.add(ArticleModel.fromJson(i.cast()));
      }
      return articleList;
    } else {
      return articleList;
    }
  }

  String title = 'News App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getArticleApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: articleList.length,
                      itemBuilder: (context, index) {
                        return Text(articleList[index].summary.toString());
                      },
                    );
                  } else {
                    return const Text('Loading');
                  }
                },
              ),
            )
          ],
        ));
  }
}
