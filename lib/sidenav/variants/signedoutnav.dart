import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const.dart';
import '../../provider/sign_in_provider.dart';

class SignedOutNav extends StatelessWidget {
  const SignedOutNav({Key? key,required this.sp}) : super(key: key);

  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              maxRadius: 45,
              minRadius: 40,
              child: Image.asset(
                "assets/joblancerlogo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          const Text(
            "Hello",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          const Text(
            "JOBLANCER",
            style: TextStyle(
                color: primaryPurple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          SizedBox(height: size.height*0.05,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.home_filled,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Home",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Search",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.favorite_outline,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Favorites",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.headset_mic_outlined,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height*0.03,),
          GestureDetector(
            onTap: (){
              Get.toNamed("/login");
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(
                    Icons.account_circle_rounded,
                    color: primaryGrey,
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Log In",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
