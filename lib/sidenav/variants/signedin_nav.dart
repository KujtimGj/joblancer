import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/provider/sign_in_provider.dart';

import '../../const.dart';

class SignedInNav extends StatelessWidget {
  const SignedInNav({
    super.key,
    required this.sp,
  });

  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
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
              child: Image.network(
                '${sp.imageUrl}',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Text(
            "Hello",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          Text(
            "${sp.name}",
            style: const TextStyle(
                color: primaryPurple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
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
          GestureDetector(
            onTap: (){
              Get.toNamed("/account");
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
                      "Profile",
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.file_present,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "All projects",
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
                  Icons.home_filled,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Messages",
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
                  Icons.price_change,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Offers",
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
                  Icons.wallet,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Wallet",
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
                  Icons.favorite,
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
          GestureDetector(
            onTap: () {
              Get.toNamed("/profilechoice");
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(
                    Icons.assignment_ind_rounded,
                    color: primaryGrey,
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Publiko shpallje",
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.call,
                  color: primaryGrey,
                  size: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Contact us",
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}