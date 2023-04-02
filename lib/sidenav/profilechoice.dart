import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';

class ProfileChoice extends StatefulWidget {
  const ProfileChoice({Key? key}) : super(key: key);

  @override
  State<ProfileChoice> createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {

  int selectedProfile =3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: EdgeInsets.only(top:size.height*0.06,bottom: size.height*0.06),
            child: Text("Zgjedh tipin e shpalljes", style: TextStyle(fontSize: 18,color: Colors.grey[600]),),
          ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height*0.06),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedProfile=0;
                      });
                    },
                    child: Container(
                      margin:const EdgeInsets.all(10),
                      height: size.height * 0.19,
                      width: size.width*0.42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                                color: selectedProfile==0?primaryPurple:Colors.grey.shade300,
                                spreadRadius: 1,
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/freelancer.png",height: 120,),
                          const Text("Pune afatshkurt",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedProfile=1;
                      });
                    },
                    child: Container(
                      margin:const EdgeInsets.all(10),
                      height: size.height * 0.19,
                      width: size.width*0.42,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                                color: selectedProfile==1?primaryPurple:Colors.grey.shade300,
                                spreadRadius: 1,
                                blurRadius: 10
                            )
                          ]
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/office-building.png",height: 120,),
                          const Text("Pune afatgjate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            selectedProfile <3?button():Container(),
          ],
        ),
    ),
    );
  }
  Widget button(){
    return GestureDetector(
      onTap: (){
        if(selectedProfile==2){
          Get.toNamed('/tac');
        }
        if(selectedProfile==1){
          Get.toNamed('/tac');
        }
        if(selectedProfile==0){
          Get.toNamed('/tac');
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.07,
        width: MediaQuery.of(context).size.height*0.8,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07),
        decoration: BoxDecoration(
            color: primaryPurple,
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Center(child: Text("Continue", style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
