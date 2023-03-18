import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblancer/AuthUI/login.dart';
import 'package:joblancer/AuthUI/signup.dart';
import 'package:joblancer/AuthUI/welcome.dart';
import 'package:joblancer/become_a_freelancer.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/details.dart';
import 'package:joblancer/home/home.dart';
import 'package:joblancer/nav/messages.dart';
import 'package:joblancer/nav/taskboard.dart';
import 'package:joblancer/nav/trophy.dart';
import 'package:joblancer/nav/wallet.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joblancer/provider/internet_provider.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<MyDrawerController>(MyDrawerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SignInProvider())),
        ChangeNotifierProvider(create: ((context) => InternetProvider()))
      ],
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.montserrat().toString()),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/home", page: () => const Home()),
          GetPage(name: "/login", page: () => const Login()),
          GetPage(name: "/signup", page: () => const Signup()),
          GetPage(name: "/welcome", page: () => const Welcome()),
          GetPage(name: "/body", page: () => const Body()),
          GetPage(name: "/root", page: () => const MyHomePage()),
          GetPage(name: "/freelancer", page: () => const BecomeFreelancer()),
          GetPage(name: "/details", page: () => const Details())
        ],
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends GetView<MyDrawerController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        menuScreen: const MenuScreen(),
        mainScreen: const Body(),
        controller: _.zoomDrawerController,
        menuBackgroundColor: const Color(0xfff8f8f8),
        moveMenuScreen: false,
        borderRadius: 20.0,
        // showShadow: true,
        angle: -0.4,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        showShadow: true,
        shadowLayer2Color: primaryPurple,
        drawerShadowsBackgroundColor: primaryGrey,
        // slideWidth: MediaQuery.of(context).size.width * 0.65,
        style: DrawerStyle.defaultStyle,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final sp = context.watch<SignInProvider>();
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
              width: size.width * 0.2,
              child: CircleAvatar(
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
            Padding(
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
                Get.toNamed("/freelancer");
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
                        "Become a freelancer",
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
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    log("Toggle drawer");
    zoomDrawerController.toggle!();
    update();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Trophy(),
    const TaskBoard(),
    const Chat(),
    const Wallet(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: primaryPurple,
          unselectedItemColor: primaryGrey,
          elevation: 0,
          iconSize: 30,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: '')
          ],
        ),
      ),
    );
  }
}
