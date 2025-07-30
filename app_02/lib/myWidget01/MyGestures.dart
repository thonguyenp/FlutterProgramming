import 'package:flutter/material.dart';

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

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
            //   GestureDetector: bắt được các sự kiện
            
            GestureDetector(
              onTap: () {
                print("Nội dung được tap");
              },
              onPanUpdate: (details) {
                print("Kéo - di chuyển: ${details.delta} ");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text("Chọn vào tôi"),
                ),
              ),
            )
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
