import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo>
{
  // Sử dụng Global key để truy cập form
  final _formKey = GlobalKey<FormState>();
  String? _name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Form"),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        //Form là widget dùng để quản lí các trường nhập liệu
        // Key: để truy cập vào trạng thái của Form
        // validate(): kiểm tra tính hợp lệ của tất cả các trường
        // save(): gọi hàm onSave của môi trường
        // reset(): đặt lại giá trị của tất cả các trường
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Họ và Tên",
                  hintText: "Nhập vào họ và tên",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value;
                },
              ),

              SizedBox(height: 50,),
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate())
                    {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Xin chao $_name"))
                      );
                    }
                  }, child: Text("Submit")),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      _name = null;
                    });
                  }, child: Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}