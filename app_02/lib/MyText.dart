import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    //trả về 1 Scaffold - widget cung cấp bố cục Material
    //Màn hình
    return Scaffold(
      //Thanh tiêu đề ứng dụng
      appBar: AppBar(
        title: Text("App_02"),
      ),
      backgroundColor: Colors.white,

      body: Center(child: Column(
        children: [
          //Tạo 1 khoảng cách
          const SizedBox(height: 50,),
          const Text("Nguyen Phuoc Tho"),
          const SizedBox(height: 30,),

          const Text(
            "Hello hehehe",
            textAlign: TextAlign.center,
            //dùng style để chỉnh
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 30,),
          const Text(
            "Flutter là SDK dành cho thiết bị di động của Google để tạo ra các giao diện native chất lượng cao trên iOS và Android trong thời gian ngắn. , được sử dụng bởi các nhà phát triển và các tổ chức trên khắp thế giới, đồng thời nó open-source và miễn phí.",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            //dùng style để chỉnh
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              letterSpacing: 1.5,
            ),
          ),

        ]
        // Text cơ bản
      )),

      floatingActionButton: FloatingActionButton(
          onPressed: (){print("Pressed");},
          child: const Icon(Icons.add_ic_call)
      ),

      //items là 1 set => để trong []
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.g_translate), label: "Dịch"),

      ]),
    );
  }
}
