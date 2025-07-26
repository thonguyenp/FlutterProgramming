import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

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
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]
            
          ),
          child: Align(
            alignment: Alignment.center,
            child: const Text(
                "Nguyen Tho",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
            ),
          ),
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
