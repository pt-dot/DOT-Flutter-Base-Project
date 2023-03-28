import 'package:base_flutter/src/ui/shared/base_button.dart';
import 'package:base_flutter/src/ui/shared/base_text_field.dart';
import 'package:base_flutter/src/ui/shared/my_app_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const routeName = 'update-profile';

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppToolbar(title: 'Update Profile'),
      body: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          Text('Name'),
          SizedBox(height: 12.h),
          BaseTextField(
            label: 'Input your name',
            controller: _nameController,
          ),
          SizedBox(height: 20.h),
          Text('Email'),
          SizedBox(height: 12.h),
          BaseTextField(
            label: 'Input your email',
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h),
          Text('Phone'),
          SizedBox(height: 12.h),
          BaseTextField(
            label: 'Input your phone',
            controller: _phoneController,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 20.h),
          Text('Website'),
          SizedBox(height: 12.h),
          BaseTextField(
            label: 'Input your website url',
            controller: _phoneController,
          ),
          SizedBox(height: 30.h),
          RoundedButton(onPress: () {}, title: 'Save'),
        ],
      ),
    );
  }
}
