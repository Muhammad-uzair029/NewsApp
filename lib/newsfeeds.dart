import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsApp/Add_fvrt/Database.dart';
import 'package:newsApp/Constants/constant.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:newsApp/description.dart';
import 'dart:io';

import 'package:newsApp/Add_fvrt/fvrt.dart';

class NewsFeedPage extends StatelessWidget {
  static String tag = "NewsFeedPage-tag";
  NewsFeedPage(this.text);
  final int text;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String title;
    if (text == 1) {
      title = "Bussiness";
    } else if (text == 2) {
      title = "Bitcoin";
    } else if (text == 3) {
      title = "TechCrunch";
    } else if (text == 4) {
      title = "Apple";
    } else if (text == 5) {
      title = "Well Street";
    }
    return Scaffold(
      appBar: AppBar(
        title: new Text("$title Headlines",
            style: new TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {
              String sendname;

              if (checktype.contains(
                  'top-headlines?country=in&category=business&apiKey=')) {
                sendname = 'Bitcoin';
              }
              if (checktype.contains(
                  'everything?q=bitcoin&sortBy=publishedAt&apiKey=')) {
                sendname = 'Bussiness';
              }
              if (checktype
                  .contains('top-headlines?sources=techcrunch&apiKey=')) {
                sendname = 'Tech';
              }
              if (checktype.contains('everything?domains=wsj.com&apiKey=')) {
                sendname = 'WallStreet';
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          fvrt_news(checktype: sendname)));
            },
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new SafeArea(
          child: new Column(
        children: [
          new Expanded(
            flex: 1,
            child: new Container(
                width: width,
                color: Colors.white,
                child: new GestureDetector(
                  child: new FutureBuilder<List<News>>(
                    future: fatchNews(
                        http.Client(), text), // a Future<String> or null
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? NewsList(news: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                )),
          ),
        ],
      )),
    );
  }
}

String checktype;
Future<List<News>> fatchNews(http.Client client, id) async {
  String url;
  if (id == 1) {
    url = Constant.base_url +
        "top-headlines?country=in&category=business&apiKey=" +
        Constant.key;
  } else if (id == 2) {
    url = Constant.base_url +
        "everything?q=bitcoin&sortBy=publishedAt&apiKey=" +
        Constant.key;
  } else if (id == 3) {
    url = Constant.base_url +
        "top-headlines?sources=techcrunch&apiKey=" +
        Constant.key;
  } else if (id == 4) {
    url = Constant.base_url +
        "everything?q=apple&from=2012-07-14&to=2018-07-14&sortBy=popularity&apiKey=" +
        Constant.key;
  } else if (id == 5) {
    url =
        Constant.base_url + "everything?domains=wsj.com&apiKey=" + Constant.key;
  }
  checktype = url;
  final response = await client.get(url);
  return compute(parsenews, response.body.toString());
}

List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody.toString());
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;

  News({this.auther, this.title, this.description, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  // void post_fvrt(String title, String url) async {
  //   final response = await http
  //       .post('http://192.168.0.106/news%20app/add_to_favourite.php', body: {
  //     "title": title,
  //     "url": url,
  //   });
  // }

  DBStudentManager fvrt_news = new DBStudentManager();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            trailing: CircleAvatar(
              child: new IconButton(
                icon: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),

                // mysql database work adding the fvrt info
                onPressed: () {
                  String aa = news[index].title;
                  String bb = news[index].url;
                  Student st = new Student(
                    title: aa,
                    url: bb,
                  );
                  print(checktype);
                  if (checktype.contains(
                      'top-headlines?country=in&category=business&apiKey=')) {
                    fvrt_news.insertStudent(st, 'Bitcoin').then((value) => {
                          aa,
                          bb,
                          print("Student Data Add to database $value"),
                        });
                  }
                  if (checktype.contains(
                      'everything?q=bitcoin&sortBy=publishedAt&apiKey=')) {
                    fvrt_news.insertStudent(st, 'Bussiness').then((value) => {
                          aa,
                          bb,
                          print("Student Data Add to database $value"),
                        });
                  }
                  if (checktype
                      .contains('top-headlines?sources=techcrunch&apiKey=')) {
                    fvrt_news.insertStudent(st, 'Tech').then((value) => {
                          aa,
                          bb,
                          print("Student Data Add to database $value"),
                        });
                  }
                  if (checktype
                      .contains('everything?domains=wsj.com&apiKey=')) {
                    fvrt_news.insertStudent(st, 'WallStreet').then((value) => {
                          aa,
                          bb,
                          print("Student Data Add to database $value"),
                        });
                  }
                },
              ),
              backgroundColor: Colors.lightBlue,
            ),
            title: Text(news[index].title),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(url),
                  ));
            },
          ),
        );
      },
    );
  }
}
