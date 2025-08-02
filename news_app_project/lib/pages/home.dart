import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/models/category_model.dart';
import 'package:news_app_project/services/data.dart';
import 'package:news_app_project/models/slider_model.dart';
import 'package:news_app_project/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<silderModel> sliders = [];

  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 18.0),
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),
            CarouselSlider.builder(
                itemCount: itemCount,
                itemBuilder: itemBuilder,
                options: options)
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(image, width: 120, height: 70, fit: BoxFit.cover),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.black38),
            child: Center(child: Text(categoryName, style: TextStyle(color:  Colors.white, fontSize: 14, fontWeight: FontWeight.w500),))
          )
        ],
      ),
    );
  }
}
