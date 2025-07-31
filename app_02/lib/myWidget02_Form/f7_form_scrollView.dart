import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  // Sử dụng Global key để truy cập form
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  bool _obscurePassword = true;
  String? _name;
  final List<String> _cities = [
    "Hà Nội",
    "TPHCM",
    "Hải Phòng",
    "Cần Thơ",
    "Đà Nẵng",
  ];
  String? _selectedcity;
  String? _gender;
  bool _isAgreed = false;
  DateTime? _dateOfBirth;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Basic Form")),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        //Form là widget dùng để quản lí các trường nhập liệu
        // Key: để truy cập vào trạng thái của Form
        // validate(): kiểm tra tính hợp lệ của tất cả các trường
        // save(): gọi hàm onSave của môi trường
        // reset(): đặt lại giá trị của tất cả các trường
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              //TextFormField là phiên bản mở rộng của TextField tích hợp với Form
              // Validator là hảm kiểm tra tính hợp lệ của dữ liệu
              // Controller cho phép truy cập và điều khiển giá trị trong TextFormField
              // obsureText cho phép ẩn văn bản
              // AutovalidationMode: điều khiển thời điểm Validation được kích hoạt
              children: [
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Họ và Tên",
                    hintText: "Nhập vào họ và tên",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) //null là không tồn tại, isEmpty là ""
                        {
                      return "Vui lòng nhập họ và tên";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100),

                Text(
                  "Radio Button",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 100,),
                FormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng chọn giới tính";
                      }
                      return null;
                    },
                    initialValue: _gender,
                    builder: (FormFieldState<String> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: RadioListTile<String>(
                                  title: Text("Nam"),
                                  value: "male",
                                  groupValue: _gender,
                                  onChanged: (value){
                                    setState(() {
                                      _gender = value;
                                      state.didChange(value);
                                    });
                                  }),
                              ),
                              Expanded(child: RadioListTile<String>(
                                  title: Text("Nữ"),
                                  value: "Female",
                                  groupValue: _gender,
                                  onChanged: (value){
                                    setState(() {
                                      _gender = value;
                                      state.didChange(value);
                                    });
                                  }),
                              ),

                            ],
                          )
                        ],
                      );
                    }),

                SizedBox(height: 10,),
                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    hintText: "Chọn ngày sinh của bạn",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025));
                    if (pickedDate != null) {
                      String formattedDate = DateFormat("dd/MM/yyyy").format(
                          pickedDate);
                      setState(() {
                        _dateOfBirthController.text = formattedDate;
                        _dateOfBirth = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn ngày sinh";
                    }
                  },
                ),
                SizedBox(height: 100,),
                //Email field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "email@gmail.com",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) //null là không tồn tại, isEmpty là ""
                        {
                      return "Vui lòng nhập email";
                    }
                    if (!RegExp(
                      r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Email không hợp lệ";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "email@gmail.com",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) //null là không tồn tại, isEmpty là ""
                        {
                      return "Vui lòng nhập email";
                    }
                    if (!RegExp(
                      r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Email không hợp lệ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                //Email field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                  obscureText: _obscurePassword,
                  onSaved: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) //null là không tồn tại, isEmpty là ""
                        {
                      return "Vui lòng nhập Mật khẩu";
                    }
                    if (value.length < 6) {
                      return "Mật khẩu phải có ít nhất 6 ký tự";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 50),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Thành phó",
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedcity,
                  items: _cities.map((city) {
                    return DropdownMenuItem(child: Text(city), value: city);
                  }).toList(),
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn thành phố";
                    }
                  },
                ),

                SizedBox(height: 20,),
                CheckboxListTile(
                  title: Text("Bạn đồng ý với điều khoản ABC"),
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                      print("Đồng ý: $_isAgreed");
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading, //cho dấu tick bên trái
                ),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Xin chao $_name")),
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          _name = null;
                          _dateOfBirthController.text = "";
                        });
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
