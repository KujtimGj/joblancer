// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:joblancer/AuthUI/login.dart';
// import 'package:joblancer/const.dart';
// import 'package:joblancer/home/home.dart';
// import 'package:joblancer/provider/sign_in_provider.dart';
// import 'package:joblancer/utils/next_screen.dart';
// import 'package:provider/provider.dart';
//
// import '../home/models/postModel.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key,required this.posts});
//
//   final Post posts;
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   late final Post posts;
//   @override
//   void initState() {
//     final sp = context.read<SignInProvider>();
//     super.initState();
//
//     Timer(const Duration(seconds: 2), () {
//       sp.isSignedIn == false
//           ?nextScreen(context, const Login())
//           : nextScreen(context, Home(posts: posts[index],)  );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryPurple,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [],
//         ),
//       ),
//     );
//   }
// }
