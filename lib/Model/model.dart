/*

public class Sources {
 public string id { get; set; }
 public string name { get; set; }
 public string description { get; set; }
 public string url { get; set; }
 public string category { get; set; }
 public string language { get; set; }
 public string country { get; set; }

}
public class Application {
 public string status { get; set; }
 public List<Sources> sources { get; set; }

}

*/

  class Sources{
 final String id ;
 final String name;
 final String description ;
 final String url ;
 final String category ;
 final String language;
 final String country ;


   Sources({this.id,this.category,this.country,
   this.description,this.language,this.name,this.url});
    factory Sources.fromJson(Map<String,dynamic> json)
    {
    return Sources(
      id:json['id'],
      name:json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'] 
 ) ;
    
  }
  }

  class NewsApi{
    final String status;
    final List<Sources> sources;
    NewsApi({this.status,this.sources});
    factory NewsApi.fromJson(Map<String,dynamic> json)
    {
    return NewsApi(status: json['status'],
    sources: (json['sources'] as List).map((sources) =>Sources.fromJson(sources)).toList());
    }

  }