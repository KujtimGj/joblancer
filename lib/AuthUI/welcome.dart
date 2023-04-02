import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblancer/const.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/welcome_screen.jpg',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'JOBLANCER',
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.2,
                      vertical: size.height * 0.03),
                  child: const Divider(
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Platform that includes Freelancer\nexperts in all specialities",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed("/login");
                //   },
                //   child: Container(
                //     height: size.height * 0.07,
                //     width: size.width * 0.9,
                //     margin: const EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //         color: primaryPurple,
                //         borderRadius: BorderRadius.circular(15)),
                //     child: const Center(
                //         child: Text(
                //       "Login",
                //       style: TextStyle(
                //           color: white,
                //           fontSize: 18,
                //           fontWeight: FontWeight.w600,
                //           letterSpacing: 1),
                //     )),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/root");
                  },
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryPurple,
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(color: Colors.white, width: 1)
                    ),
                    child: const Center(
                        child: Text(
                      "Welcome",
                      style: TextStyle(color: white, fontSize: 19),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}


// GestureDetector(
// onTap: () {
// Get.toNamed("/login");
// },
// child: Container(
// height: size.height * 0.07,
// width: size.width * 0.9,
// margin: const EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: primaryPurple,
// borderRadius: BorderRadius.circular(15)),
// child: const Center(
// child: Text(
// "Login",
// style: TextStyle(
// color: white,
// fontSize: 18,
// fontWeight: FontWeight.w600,
// letterSpacing: 1),
// )),
// ),
// ),