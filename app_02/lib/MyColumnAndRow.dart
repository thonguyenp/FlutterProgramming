import 'package:flutter/material.dart';

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

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
            Row(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.alarm_add_rounded),
                const Icon(Icons.ac_unit),
                const Icon(Icons.accessibility),
              ],
            ),
            Row(
              children: [
                Text("Text1----------"),
              ],
            )

          ],
        )
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
