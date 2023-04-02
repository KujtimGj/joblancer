import 'package:flutter/material.dart';
import 'package:joblancer/const.dart';

class EmployerSignup extends StatefulWidget {
  const EmployerSignup({Key? key}) : super(key: key);

  @override
  State<EmployerSignup> createState() => _EmployerSignupState();
}

class _EmployerSignupState extends State<EmployerSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employer"),
        backgroundColor: primaryPurple,
      ),
    );
  }
}
