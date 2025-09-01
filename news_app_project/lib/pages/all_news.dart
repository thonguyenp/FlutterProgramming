import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/models/article_model.dart';
import 'package:news_app_project/models/show_category.dart';
import 'package:news_app_project/models/slider_model.dart';
import 'package:news_app_project/pages/article_view.dart';
import 'package:news_app_project/pages/category_news.dart';
import 'package:news_app_project/services/news.dart';
import 'package:news_app_project/services/slider_data.dart';

class AllNews extends StatefulWidget {
  String news;


  AllNews(this.news);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  List<ShowCategoryModel> categories = [];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    getSliders();
    getNews();
    super.initState();
  }


  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
    });
  }

  getSliders () async
  {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news + " News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.news == "Breaking" ? sliders.length: articles.length,
          itemBuilder: (context, index) {
            return AllNewsSection(
              widget.news == "Breaking" ? sliders[index].urlToImage! : articles[index].urlToImage!,
              widget.news == "Breaking" ? sliders[index].description! : articles[index].description!,
              widget.news == "Breaking" ? sliders[index].title! : articles[index].title!,
              widget.news == "Breaking" ? sliders[index].url! : articles[index].url!,
            );
          },
        ),
      ),
    );
  }

}

class AllNewsSection extends StatelessWidget {
  String image, desc, title, url;

  AllNewsSection(this.image, this.desc, this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(desc, maxLines: 3,),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}

