import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formkey = GlobalKey<FormState>();

  String? _selectedRole = 'user';
  bool _isNotificationEnabled = false;
  bool _isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Form Example')
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    hintText: 'Họ và tên',
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Email'
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Vui lòng nhập email hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Mật khẩu'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    if (value.length < 6) {
                      return 'Mật khẩu phải có ít nhất 6 ký tự';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text('Giới tính'),
                const SizedBox(height:8),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'option1', child: Text('Nam')),
                    DropdownMenuItem(value: 'option2', child: Text('Nữ')),
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    hintText: 'Chọn giới tính',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Vui lòng chọn giới tính';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                FormField<bool>(
                  initialValue: _isCheckBox,
                  validator: (value) {
                    if (!value!) return 'Bạn cần đồng ý điều khoản trước khi gửi';
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Đồng ý điều khoản sử dụng'),
                            Checkbox(
                              value: state.value,
                              onChanged: (value) {
                                setState(() {
                                  _isCheckBox = value ?? false;
                                  state.didChange(value);
                                });
                              },
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Text(
                            state.errorText!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 16),
                Text('Vai trò:'),
                Row(
                  children: [
                    Radio<String>(
                      value: 'user',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                    Text('User'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'admin',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value;
                        });
                      },
                    ),
                    Text('Admin'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Bật thông báo'),
                    Switch(
                      value: _isNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isNotificationEnabled = value;
                        });
                      },
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: (){
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form đã được gửi thành công!')),
                      );
                    }
                  }, 
                  child: Text('Gửi')
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}