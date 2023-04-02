import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      appBar: AppBar(
        title:const Text("Joblancer"),
        centerTitle: true,
        backgroundColor: primaryPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.3,
                child: CircleAvatar(
                  child: Image.network(
                    '${sp.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text('${sp.name}'),
            Text('${sp.email}'),
            GestureDetector(
              onTap: (){
                sp.userSignOut();
              },
                child:const Text("Sing out",style: TextStyle(color: Colors.red,fontSize: 30),))
          ],
        ),
      ),
    );
  }
}
