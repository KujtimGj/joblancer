import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblancer/AuthUI/employersignup.dart';
import 'package:joblancer/AuthUI/login.dart';
import 'package:joblancer/AuthUI/options.dart';
import 'package:joblancer/AuthUI/signup.dart';
import 'package:joblancer/AuthUI/welcome.dart';
import 'package:joblancer/become_a_freelancer.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/home.dart';
import 'package:joblancer/nav/messages.dart';
import 'package:joblancer/nav/category.dart';
import 'package:joblancer/nav/saved.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:joblancer/provider/internet_provider.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:joblancer/sidenav/account.dart';
import 'package:joblancer/sidenav/profilechoice.dart';
import 'package:joblancer/sidenav/tac.dart';
import 'package:joblancer/sidenav/variants/signedin_nav.dart';
import 'package:joblancer/sidenav/variants/signedoutnav.dart';
import 'package:provider/provider.dart';
import 'AuthUI/companysignup.dart';

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
          GetPage(name: "/login", page: () => const Login()),
          GetPage(name: "/signup", page: () => const Signup()),
          GetPage(name: "/welcome", page: () => const Welcome()),
          GetPage(name: "/root", page: () => const MyHomePage()),
          GetPage(name: "/freelancer", page: () => const BecomeFreelancer()),
          GetPage(name: "/account", page: ()=>const Account()),
          GetPage(name: "/options", page: ()=>const Options()),
          GetPage(name: "/companysignup", page: ()=> const CompanySignUp()),
          GetPage(name: "/employersignup", page: ()=>const EmployerSignup()),
          GetPage(name: "/profilechoice", page: ()=>const ProfileChoice()),
          GetPage(name: "/tac", page: ()=>const TermsAndConditions()),
        ],
        home: const Welcome(),
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
      body: sp.isSignedIn?SignedInNav(sp: sp):SignedOutNav(sp: sp),
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


  const Body({super.key,required });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
     const Home(),
    const Category(),
    const Saved(),
    const Chat(),
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
            BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: '')
          ],
        ),
      ),
    );
  }
}
