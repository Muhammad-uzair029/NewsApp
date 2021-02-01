import 'package:flutter/material.dart';
import 'package:newsApp/newsfeeds.dart';
import 'package:newsApp/personal_search.dart';

// void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: new Text("News App", style: new TextStyle(color: Colors.white)),
      ),
      body: new SafeArea(
        child: new Column(
          children: [
            new Expanded(
              flex: 1,
              child: new Container(
                width: width,
                color: Colors.white,
                child: new Center(
                  child: new GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: <Widget>[
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/bussines.jpg",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 100.0,
                                ),
                                new Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    "Business Headlines",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            var id = 1;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/bitcoin.jpg",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 100.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("Bitcoin",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            var id = 2;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/tech.jpeg",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 100.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("TechCrunch",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            var id = 3;
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new NewsFeedPage(id),
                                ));
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/WS.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 100.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("Wall Street Journal",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            var id = 5;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/search.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 100.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("Personal Search",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.black),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    news_galllery()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
