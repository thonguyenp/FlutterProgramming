import 'package:flutter/material.dart';

class MyButton_3 extends StatelessWidget {
  const MyButton_3({super.key});

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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            ElevatedButton(
              // Khóa lại bằng cách cho onPressed : null
              onPressed: () {
                print("Elevated Btn");
              },
              child: Text("Elevated Btn", style: TextStyle(fontSize: 24)),
            ),

            SizedBox(height: 50,),
            ElevatedButton(
              // Khóa lại bằng cách cho onPressed : null
              onPressed: () {
                print("Elevated Btn");
              },
              onLongPress: () {
                print("Long Press");
              },
              child: Text("Long Press Elevated Btn", style: TextStyle(fontSize: 24)),
            ),

          ],
        ),
      ),

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
