import 'package:flutter/material.dart';

class MyButton_2 extends StatelessWidget {
  const MyButton_2({super.key});

  @override
  Widget build(BuildContext context) {
    //trả về 1 Scaffold - widget cung cấp bố cục Material
    //Màn hình
    return Scaffold(
      //Thanh tiêu đề ứng dụng
      appBar: AppBar(title: Text("App_02")),
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                print("Elevated Btn");
              },
              child: Text("Elevated Btn", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                //Màu nền
                backgroundColor: Colors.purple,
                //Màu các nội dung bên trong
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                //Padding
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),
                //Elevate
                elevation: 15,
              ),
            ),
            // InkWell
            //Ko phải là btn nhưng cho tạo hiệu ứng gợn sóng (ripple effect) khi nhấn vào widget
            SizedBox(height: 50,),
            InkWell(
              onTap: () {
                print("InkWell được nhấn");
              },
              onDoubleTap: () {
                print("Double Tap");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Text("Button tùy chỉnh với InkWell"),
              ),
            ),

            SizedBox(height: 50,),
            TextButton.icon(
                onPressed: () {
                  print("Text btn Icon");
                },
                icon: Icon(Icons.favorite),
                label: Text("Yêu thích")
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),

      //items là 1 set => để trong []
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.g_translate), label: "Dịch"),
        ],
      ),
    );
  }
}
