import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        toolbarHeight: 95,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.toNamed("/welcome");
          },
          child: Container(
            margin: const EdgeInsets.all(23),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: primaryPurple),
                borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryPurple,
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.8,
          width: size.width,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: primaryPurple),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 15),
                    child: Text(
                      "Full name",
                      style: TextStyle(
                          color: primaryGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Kujtim Gjokaj',
                        hintStyle: const TextStyle(color: Colors.black45),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: primaryPurple,
                              width: 1,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: primaryGrey.withOpacity(0.2),
                                width: 1.5)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: primaryPurple,
                          width: 1,
                        )),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                          color: primaryGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'gjoka@gmail.com',
                        hintStyle: const TextStyle(color: Colors.black45),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: primaryPurple,
                              width: 1,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: primaryGrey.withOpacity(0.2),
                                width: 1.5)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: primaryPurple,
                          width: 1,
                        )),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: primaryGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black54),
                      obscureText: isObscure == true ? true : false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure == true
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: '••••••••',
                        hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: primaryPurple,
                              width: 1,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: primaryGrey.withOpacity(0.2),
                                width: 1.5)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: primaryPurple,
                          width: 1,
                        )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/root");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: size.height * 0.085,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryPurple),
                      child: const Center(
                          child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/login");
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
