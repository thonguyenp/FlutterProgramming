import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
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
  final List<String> _cities = [
    "Hà Nội",
    "TPHCM",
    "Hải Phòng",
    "Cần Thơ",
    "Đà Nẵng",
  ];
  final ImagePicker _picker = ImagePicker();

  File? _profileImage;
  bool _obscurePassword = true;
  String? _name;
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
                SizedBox(height: 16),
                FormField(
                  validator: (value) {
                    if (value == null) {
                      return "Vui lòng chọn ảnh đại diện";
                    }
                  },
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ảnh đại diện",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Chọn nguồn"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.photo_library),
                                        title: Text("Thư viện"),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.gallery,
                                            ),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text("Máy ảnh"),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.camera,
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                              if (image != null)
                              {
                                setState(() {
                                  _profileImage = File(image.path);
                                  state.didChange(_profileImage);
                                });
                              }

                            },

                            child: Container(
                              width: 120,
                              height: 120,
                              child: _profileImage != null ? ClipRect(
                                child: Image.file(
                                  _profileImage!,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ) : Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: CupertinoColors.inactiveGray,
                              )
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
