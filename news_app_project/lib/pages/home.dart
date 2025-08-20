import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/models/category_model.dart';
import 'package:news_app_project/services/data.dart';
import 'package:news_app_project/models/slider_model.dart';
import 'package:news_app_project/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<silderModel> sliders = [];
  int activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  Widget? buildImage(String image, int index, String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("View All", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIndex) {
                  String? res = sliders[index].image;
                  String? res1 = sliders[index].name;
                  return buildImage(res!, index, res1!)!;
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              Center(child: buildIndicator()),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending News!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("View All", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("images/business.png", height: 150,
                                width: 150,
                                fit: BoxFit.cover,),
                            ),
                        ),
                        SizedBox(width: 3.0,),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              child: Text("Name of News", style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17)),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              child: Text("Some Description", style: TextStyle(color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)),
                            ),
        
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending News!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("View All", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("images/business.png", height: 150,
                              width: 150,
                              fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 3.0,),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              child: Text("Name of News", style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17)),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              width: MediaQuery.of(context).size.width/1.8,
                              child: Text("Some Description", style: TextStyle(color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)),
                            ),
        
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: sliders.length,
      effect: SlideEffect(
        dotWidth: 20,
        dotHeight: 20,
        activeDotColor: Colors.blueAccent,
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
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38,
            ),
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
