import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
            //ElevatedButton là 1 btn với hiệu ứng đổ bóng
            // Thường được dùng cho các hành động chính trong ứng dụng
            ElevatedButton(
                onPressed: () {print("Elevated Btn");},
                child: Text("Elevated Btn", style: TextStyle(fontSize: 24),)
            ),

            SizedBox(height: 20,),
            //Text btn: là 1 btn phẳng, không có đổ bóng
            //Thường dùng cho các hành động phụ như trong Card, Dialog
            TextButton(
                onPressed: () {print("Text Btn");},
                child: Text("Elevated Btn", style: TextStyle(fontSize: 24),)
            ),

            SizedBox(height: 20,),
            //Outlined btn là btn có viền bao quanh, ko có nền
            //Phù hợp cho các thay thế cho những nút bên trên
            OutlinedButton(
                onPressed: () {print("Outlined Btn");},
                child: Text("Elevated Btn", style: TextStyle(fontSize: 24),)
            ),

            SizedBox(height: 20,),
            //Icon btn là dạng btn chỉ gồm icon
            //Dùng khi xây dựng appBar hoặc toolBar
            IconButton(
                onPressed: () {print("IconButton");},
                  icon: Icon(Icons.search)
            ),

            SizedBox(height: 20,),
            //FloatingActionButton là btn hình tròn nổi trên giao diện
            FloatingActionButton(
                onPressed: () {print("FloatingActionButton");},
                child: Icon(Icons.roundabout_left),
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
