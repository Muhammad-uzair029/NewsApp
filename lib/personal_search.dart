import 'dart:async';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}

class news_galllery extends StatefulWidget {
  @override
  _news_gallleryState createState() => _news_gallleryState();
}

class _news_gallleryState extends State<news_galllery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News Gallery"),
        ),
        body: Container(
          child: new Column(
            children: [
              new Expanded(
                flex: 1,
                child: new Container(
                  color: Colors.white,
                  child: new Center(
                    child: new GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                      children: <Widget>[
                        _card("DAWN", "assets/dawn.jpg", "Dawn Search",
                            'https://www.dawn.com/search'),
                        _card(
                            "The Times",
                            "assets/times.png",
                            "The New York Times Search",
                            'https://www.nytimes.com/search/'),
                        _card("GEO News", "assets/geo.png", "GEO News Search",
                            'https://www.geo.tv/'),
                        _card("CNN", "assets/cnn.png", "CNN Search",
                            'https://www.cnn.com/'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _card(String card_name, String card_pic, String title, String url) {
    return new Card(
      elevation: 3.0,
      child: new GestureDetector(
        child: new Container(
          child: new Column(
            children: <Widget>[
              Image.asset(
                card_pic,
                alignment: Alignment.center,
                width: 120.0,
                height: 100.0,
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(card_name,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MyWebView(
                    title: title,
                    selectedUrl: url,
                  )));
        },
      ),
    );
  }
}
