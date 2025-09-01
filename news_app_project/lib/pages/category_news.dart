import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/models/show_category.dart';
import 'package:news_app_project/services/show_category.dart';
class CategoryNews extends StatefulWidget {
  String name;

  CategoryNews(this.name);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  getCategories() async {
    ShowCategoryNews newsCategory = ShowCategoryNews();
    await newsCategory.getCategories(widget.name.toLowerCase());
    categories = newsCategory.categories;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategory(
              categories[index].urlToImage!,
              categories[index].description!,
              categories[index].title!,
            );
          },
        ),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  String image, desc, title;

  ShowCategory(this.image, this.desc, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
