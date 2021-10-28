// ignore_for_file: unused_element, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // properties: name, age, email, phone
  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController emailController;
  TextEditingController phoneController;

  AppForm(
      {required this.formKey,
      required this.nameController,
      required this.ageController,
      required this.emailController,
      required this.phoneController});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  // validasi form
  String? _validateName(String? value) {
    if (value!.length < 7) return 'Nama minimal 6 karakter!';
    return null;
  }

  String? _validateNumber(String? value) {
    String pattern = r'(?<=\s|^)\d+(?=\s|$)'; //harus angka
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!)) return 'Harus diisi dengan angka!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Tulis Nama'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tulis Usia'),
            validator: _validateNumber,
          ),
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Tulis Email'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Tulis Telepon'),
            validator: _validateNumber,
          )
        ],
      ),
    );
  }
}
