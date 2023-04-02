import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {


  int selectedProfile = 3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryPurple,
        title:const Text("Choose your profile"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(
                padding: EdgeInsets.only(top:size.height*0.04),
                child: Text("I want to login as...", style: TextStyle(fontSize: 18,color: Colors.grey[600]),),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedProfile=0;
                  });
                },
                child: Container(
                  margin:const EdgeInsets.all(10),
                  height: size.height * 0.19,
                  width: size.width*0.44,
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
                      Image.asset("assets/office-building.png",height: 120,),
                      const Text("Company",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
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
                  width: size.width*0.44,
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
                      Image.asset("assets/freelancer.png",height: 120,),
                      const Text("Freelancer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedProfile=2;
                  });
                },
                child: Container(
                  margin:const EdgeInsets.all(10),
                  height: size.height * 0.19,
                  width: size.width*0.44,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            color: selectedProfile==2?primaryPurple:Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/graduated.png",height: 120,),
                      const Text("Student",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              ),
              selectedProfile <3?button():Container(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget button(){
    return GestureDetector(
      onTap: (){
        if(selectedProfile==2){
          Get.toNamed('/login');
        }
        if(selectedProfile==1){
          Get.toNamed('/employersignup');
        }
        if(selectedProfile==0){
          Get.toNamed('/companysignup');
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
