import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    //trả về 1 Scaffold - widget cung cấp bố cục Material
    //Màn hình
    return Scaffold(
      //Thanh tiêu đề ứng dụng
      appBar: AppBar(
        title: Text("App_02"),
        //Màu nều
        backgroundColor: Colors.green,
        //Độ nâng
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("Button 1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("Button 2");
            },
            icon: Icon(Icons.abc_rounded),
          ),
          IconButton(
            onPressed: () {
              print("Button 3");
            },
            icon: Icon(Icons.more_vert),  //nút 3 chấm
          ),


        ],
      ),

      body: Center(child: Text("Nội dung chính")),

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
