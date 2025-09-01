import 'package:news_app_project/models/article_model.dart';
//2 dòng này để dùng gói http
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class News
{
  List<ArticleModel> news =[];

//   Dùng Future để lấy news
  Future<void> getNews () async
  {
    //Check nếu url get quá nhiều bài báo thì đổi url khác
    String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=eb7ef361cb804e51a0c4b7f492bf088c";
    var response = await http.get(Uri.parse(url));
    var jsonData = convert.jsonDecode(response.body);

    if (jsonData['status'] == 'ok')
    {
      jsonData["articles"].forEach((e) {
        if (e["urlToImage"] != null && e['description'] != null)
        {
          ArticleModel articleModel = ArticleModel(e["author"],e["title"],
              e["description"],e["url"],e["urlToImage"],e["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}
