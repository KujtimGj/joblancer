import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/components/freelances.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

import 'models/postModel.dart';


class Home extends StatefulWidget {
  const Home({super.key,});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final zoomDrawerController = ZoomDrawerController();


  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool shouldPop = false;

  int selectedIndex = 1;
  int selectedNature = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sp = context.watch<SignInProvider>();
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff8f8f8),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: const Color(0xfff8f8f8),
          leadingWidth: 65,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                ZoomDrawer.of(context)?.toggle();
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.menu,
                color: Colors.grey,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Joblancer",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            // Padding(
            //   padding: EdgeInsets.all(5.0),
            //   child: CircleAvatar(
            //     backgroundColor: Colors.grey[400],
            //     maxRadius: 30,
            //     minRadius: 25,
            //     child: Icon(Icons.account_circle,size: 30,color: Colors.white,),
            //   ),
            // )
            GestureDetector(
              onTap: (){
                sp.isSignedIn?null:Get.toNamed('/login');
              },
              child: sp.isSignedIn?Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network('${sp.imageUrl}'),),
              ):Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle_rounded,size: 45,color: Colors.grey[400],),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1.3,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[700],
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: VerticalDivider(
                        thickness: 1,
                      ),
                    ),
                    const Flexible(
                      child: TextField(
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Search for freelance',
                          hintStyle: TextStyle(color: Colors.black45),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed('/freelancer');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Search",
                          style: TextStyle(
                              color: primaryPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
                const Freelances(),
            ],
          ),
        ),
      ),
    );
  }
}
