import 'package:flutter/material.dart';

class MyTextField2 extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => _MyTextField2();
}

class _MyTextField2 extends State<MyTextField2>
{
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App_02"),
      ),
      backgroundColor: Colors.white,

      body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 16,
      ),
      child: Column(
          children: [
            SizedBox(height: 50,),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Nhập thông tin của bạn:",
                hintText: "Thông tin của bạn",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;

                });
              },
            ),

            SizedBox(height: 20,),
            Text("Bạn đã nhập dữ liệu : $_inputText",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    );
  }
}