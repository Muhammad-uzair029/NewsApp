import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:newsApp/Add_fvrt/Database.dart';
import 'package:newsApp/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsApp/newsfeeds.dart';

class fvrt_news extends StatefulWidget {
  final checktype;
  fvrt_news({Key key, @required this.checktype}) : super(key: key);

  @override
  _fvrt_newsState createState() => _fvrt_newsState();
}

class _fvrt_newsState extends State<fvrt_news> {
  // Future<List> Get_Notification_Data() async {
  //   final response =
  //       await http.get('http://192.168.0.106/news%20app/show_fvrt.php');
  //   return json.decode(response.body);
  // }
  List<Student> studlist;

  @override
  Widget build(BuildContext context) {
    DBStudentManager fvrt_news = new DBStudentManager();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your favourite news lounge'),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder(
            future: fvrt_news.getStudentList(widget.checktype),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                studlist = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: studlist == null ? 0 : studlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    Student st = studlist[index];
                    return _buildContactItem(
                      st.id,
                      index,
                      st.title,
                      st.url,
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  DBStudentManager dbStudentManager = new DBStudentManager();
  Widget _buildContactItem(
    int id,
    int index,
    String name,
    String price,
  ) {
    return new Container(
        child: LiquidPullToRefresh(
            onRefresh: () async {
              return await Future.delayed(Duration(seconds: 1));
            },
            child: Card(
              child: new ListTile(
                trailing: CircleAvatar(
                  child: new IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      dbStudentManager.deleteStudent(id, widget.checktype);
                      setState(() {
                        studlist.removeAt(index);
                      });
                    },
                  ),
                  backgroundColor: Colors.lightBlue,
                ),
                title: Text(name),
                onTap: () {
                  var url = price;
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new DescriptionPage(url),
                      ));
                },
              ),
            )));
  }
}

// class Items extends StatelessWidget {
//   void delete_fvrt_news(String title, String url) async {
//     final response = await http
//         .post('http://192.168.0.106/news%20app/unfvrt_news.php', body: {
//       "title": title,
//       "url": url,
//     });
//   }

//   List list;
//   Items({this.list});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: LiquidPullToRefresh(
//             onRefresh: () async {
//               return await Future.delayed(Duration(seconds: 1));
//             },
//             child: ListView.builder(
//                 itemCount: list == null ? 0 : list.length,
//                 itemBuilder: (ctx, i) {
//                   return new Card(
//                     child: new ListTile(
//                       trailing: CircleAvatar(
//                         child: new IconButton(
//                           icon: Icon(
//                             Icons.star,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             return showDialog(
//                                 barrierDismissible: false,
//                                 context: context,
//                                 child: new CupertinoAlertDialog(
//                                   title: new Column(
//                                     children: <Widget>[
//                                       new Text(
//                                           "Are u sure u want to remove this news from fvrt list"),
//                                       new Icon(
//                                         Icons.delete_forever,
//                                         color: Colors.red,
//                                       ),
//                                     ],
//                                   ),
//                                   actions: <Widget>[
//                                     new FlatButton(
//                                         onPressed: () {
//                                           String title = list[i]['title'];
//                                           String url = list[i]['url'];
//                                           delete_fvrt_news(title, url);
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: new Text("yeah do it "))
//                                   ],
//                                 ));
//                           },
//                         ),
//                         backgroundColor: Colors.lightBlue,
//                       ),
//                       title: Text(list[i]['title']),
//                       onTap: () {
//                         var url = list[i]['url'];
//                         Navigator.push(
//                             context,
//                             new MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   new DescriptionPage(url),
//                             ));
//                       },
//                     ),
//                   );
//                 })));
//   }
// }
