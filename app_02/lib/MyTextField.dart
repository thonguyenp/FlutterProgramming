import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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

      body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 16,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                // Textfield cho phép nhập văn bản từ bàn phím
                TextField(
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    hintText: "Nhập vào họ và tên của bạn",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Example@gmail.com",
                    helperText: "Nhập vào địa chỉ email",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    filled: true,
                    fillColor: Colors.greenAccent,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Số điện thoại",
                    hintText: "Nhập vào SDT của bạn",
                    border: OutlineInputBorder(),
                  ),
                  // Thay đổi dạng bàn phím
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    hintText: "Nhập vào ngày sinh của bạn",
                    border: OutlineInputBorder(),
                  ),
                  // Thay đổi dạng bàn phím
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(),
                  ),
                  // Thay đổi dạng bàn phím
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                ),

                SizedBox(height: 10,),
                TextField(
                  // onChanged: (value)
                  // {
                  //   print("Đang nhập vào $value");
                  // },
                  onSubmitted: (value)
                  {
                    print("Đã hoàn thành nội dung $value");
                  },
                  decoration: InputDecoration(
                    labelText: "Câu hỏi bí mật",
                    border: OutlineInputBorder(),
                  ),
                  // Thay đổi dạng bàn phím
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            )
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
