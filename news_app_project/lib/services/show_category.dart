import 'package:news_app_project/models/article_model.dart';
//2 dòng này để dùng gói http
import 'package:http/http.dart' as http;
import 'package:news_app_project/models/category_model.dart';
import 'package:news_app_project/models/show_category.dart';
import 'dart:convert' as convert;
import 'package:news_app_project/models/slider_model.dart';
import 'package:news_app_project/pages/category_news.dart';
class ShowCategoryNews
{
  List<ShowCategoryModel> categories =[];

  //   Dùng Future để lấy slider
  Future<void> getCategories (String category) async
  {
    //Check nếu url get quá nhiều bài báo thì đổi url khác
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=eb7ef361cb804e51a0c4b7f492bf088c";
    var response = await http.get(Uri.parse(url));
    var jsonData = convert.jsonDecode(response.body);

    if (jsonData['status'] == 'ok')
    {
      jsonData["articles"].forEach((e) {
        if (e["urlToImage"] != null && e['description'] != null)
        {
          ShowCategoryModel categoryModel = ShowCategoryModel(e["author"],e["title"],
              e["description"],e["url"],e["urlToImage"],e["content"]);
          categories.add(categoryModel);
        }
      });
    }
  }
}
