import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblancer/AuthUI/components/ordivider.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/main.dart';
import 'package:joblancer/provider/internet_provider.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:joblancer/utils/next_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:provider/provider.dart';
import 'package:joblancer/utils/snackbar.dart';

import 'components/SocialIcons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xfff9f9f9),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 60),
          child: Column(
            children: [
              Container(
                  height: size.height*0.2,
                  width: size.width*0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image:const DecorationImage(
                      image: AssetImage("assets/joblancerlogo.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
         const Padding(
           padding: EdgeInsets.all(8.0),
           child: Text("JOBLANCER",style: TextStyle(color: primaryPurple,fontSize: 30,fontWeight: FontWeight.w700),),
         ),
             SizedBox(height: size.height*0.1,),
             //  Container(
             //    margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
             //    height: size.height*0.06,
             //    width: size.width*0.8,
             //    child: TextFormField(
             //      decoration:const InputDecoration(
             //        hintText: 'Email',
             //        border: UnderlineInputBorder(),
             //          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryPurple))
             //      ),
             //    ),
             //  ),
             //  Container(
             //    margin:const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
             //    height: size.height*0.06,
             //    width: size.width*0.8,
             //    child: TextFormField(
             //      obscureText: true,
             //      decoration:const InputDecoration(
             //        hintText: 'Password',
             //        border: UnderlineInputBorder(),
             //        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryPurple))
             //      ),
             //    ),
             //  ),
             // const Align(alignment: Alignment.centerRight,child: Text("Forgot password?",style: TextStyle(color: primaryPurple,fontSize: 16),)),
             //  GestureDetector(
             //    onTap: (){
             //      Get.toNamed('/home');
             //    },
             //    child: Container(
             //      margin: const EdgeInsets.symmetric(vertical: 35),
             //      height: size.height*0.07,
             //      width: size.width*0.9,
             //      decoration: BoxDecoration(
             //        color: primaryPurple,
             //        borderRadius: BorderRadius.circular(20)
             //      ),
             //      child:const Center(child: Text("Log In",style:TextStyle(color: Colors.white,fontSize: 20))),
             //    ),
             //  ),
              RoundedLoadingButton(
                width: size.width * 0.9,
                controller: googleController,
                onPressed: () {
                  handleGoogleSignIn();
                },
                successColor: Colors.red,
                color: Colors.red,
                child: Wrap(
                  children: const [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Sign in with Google",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RoundedLoadingButton(
                onPressed: () {
                  handleFacebookAuth();
                },
                controller: facebookController,
                successColor: Colors.blue,
                width: MediaQuery.of(context).size.width * 0.80,
                elevation: 0,
                borderRadius: 25,
                color: Colors.blue,
                child: Wrap(
                  children: const [
                    Icon(
                      FontAwesomeIcons.facebook,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Sign in with Facebook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedLoadingButton(
                onPressed: () {},
                controller: twitterController,
                successColor: Colors.lightBlue,
                width: MediaQuery.of(context).size.width * 0.80,
                elevation: 0,
                borderRadius: 25,
                color: Colors.lightBlue,
                child: Wrap(
                  children: const [
                    Icon(
                      FontAwesomeIcons.twitter,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Continue with Twitter",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // phoneAuth loading button
              RoundedLoadingButton(
                onPressed: () {},
                controller: phoneController,
                successColor: Colors.black,
                width: MediaQuery.of(context).size.width * 0.80,
                elevation: 0,
                borderRadius: 25,
                color: Colors.black,
                child: Wrap(
                  children: const [
                    Icon(
                      FontAwesomeIcons.phone,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Sign in with Phone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              // OrDivider(),
              // SizedBox(height: size.height*0.05,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SocalIcon(
              //       iconSrc: "assets/google.svg",
              //       press: () {
              //         handleGoogleSignIn();
              //       },
              //     ),
              //     SocalIcon(
              //       iconSrc: "assets/twitter.svg",
              //       press: () {},
              //     ),
              //     SocalIcon(
              //       iconSrc: "assets/facebook.svg",
              //       press: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              //? user exists
              await sp
                  .getUserDataFromFirestore(sp.uid)
                  .then((value) => sp.saveDataToSharedPreferences())
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      }));
            } else {
              //? user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your internet connection", Colors.red);
      facebookController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          facebookController.reset();
        } else {
          sp.checkUserExists().then((value) async {
            if (value == true) {
              //? user exists
              await sp
                  .getUserDataFromFirestore(sp.uid)
                  .then((value) => sp.saveDataToSharedPreferences())
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      }));
            } else {
              //? user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      nextScreenReplace(context, const MyHomePage());
    });
  }
}
