import 'package:flutter/material.dart';
import 'home.dart';
import 'newsfeeds.dart';
import 'description.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    DescriptionPage.tag: (context) => DescriptionPage(null),
    NewsFeedPage.tag: (context) => NewsFeedPage(null)
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        //fontFamily: 'Nunito',
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}








// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:newsApp/Model/model.dart';
// import 'package:http/http.dart' as http;

// String API_KEY='adf6132d648c43af809be8c90cb1e7e2';
// Future <List<Sources>> fetchNewsSources() async{
//   final response=await http.get('https://newsapi.org/v2/sources?apiKey=${API_KEY}');

//   if(response.statusCode == 200){
//   List sources=json.decode(response.body)['sources'];
//    return sources..map((sources) =>Sources.fromJson(sources)).toList();
//   }
// else{
//   throw Exception('Failed to load Source List');
// }
// }

// void main() {
//   runApp(new SourceScreen());
// }

// class SourceScreen extends StatefulWidget {
//   @override
//   _SourceScreenState createState() => _SourceScreenState();
// }

// class _SourceScreenState extends State<SourceScreen> {
//   var list_sources;
//   var refreshKey=GlobalKey<RefreshIndicatorState>();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     refreshListSource();
//   }
//   Future<Null> refreshListSource(){
// refreshKey.currentState?.show(atTop:false);
// setState(() {
//   list_sources=fetchNewsSources();
// });
// return null; 
//   }
//   @override
//   Widget build(BuildContext context) {
//  return MaterialApp(title: 'News Lounge',
//     theme :ThemeData(primarySwatch: Colors.teal),
//    home: Scaffold(appBar: AppBar(title: Text(' All newsssesss'),
//   ),
//      body: Center(
//      child:RefreshIndicator(
//        key:refreshKey,
//         child:FutureBuilder<List<Sources>>(
//           future: list_sources,
//           builder: (context,snapshot){
//               if(snapshot.hasError)
//               {
//                 Text('Error is ::${snapshot.error}');

//               }
//               else if(snapshot.hasData)
//               {
//                  List<Sources>  sources=snapshot.data;
//                    return new ListView(
//                      children:sources.map((Sources) => GestureDetector(
//                        onTap: (){

//                        },
//                        child:Card(
//                          elevation:1.0,
//                          color:Colors.white,
//                          margin:const EdgeInsets.symmetric(vertical:8.0,horizontal:14.0),
//                          child:Row(children: [
//                            Container(
//                              margin:const EdgeInsets.symmetric(horizontal:2.0),
//        width: 100,
//        height: 140,child:Text('asdasd'),

//                            ),
// //    Expanded(
// //      child:Column(
// //      crossAxisAlignment: CrossAxisAlignment.start,
// //        children: [
// //          Row(
// //            children: [
// // Expanded(child: Container(
// //     margin:const EdgeInsets.only(top:20,bottom:10.0),
// //     child:Text('${sources.name}',style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),)
// // )
// // )


// //            ],
// //          )
// //        ],
// //      )
// //    )


//                          ],)

//                        )
//                      )
//                    ).toList());
//               }
//            return CircularProgressIndicator();
//           }),
//       onRefresh: refreshListSource,
//      )


//      ),
   
//    )
 
//  ,);
 
 
//   }
// }
