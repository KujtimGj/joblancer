import 'package:flutter/material.dart';
import 'package:joblancer/const.dart';

class CompanySignUp extends StatefulWidget {
  const CompanySignUp({Key? key}) : super(key: key);

  @override
  State<CompanySignUp> createState() => _CompanySignUpState();
}

class _CompanySignUpState extends State<CompanySignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Sign up as a company"),
        backgroundColor: primaryPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
