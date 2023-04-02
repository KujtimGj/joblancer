import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  bool isBtn1Checked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryPurple;
      }
      return Colors.blue;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:size.height*0.03),
                  child: Image.asset("assets/done.png",height: 100,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height*0.03),
                  child: const Text("Terms & Conditions",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                ),
                 Padding(
                  padding: EdgeInsets.only(top:size.height*0.04),
                  child: const Text("The Customer agrees that Fore may use, process and/or host customer confidential information/data such as CNIC, Bank Account Number & other bank account credentials and Contact Number etc.).\n\nThe Customer also agrees that Fore has the debit authority; Foree may debit money from customer account/wallet/card etc. for the processing of transactions."),
                ),
                Padding(
                  padding: EdgeInsets.only(top:size.height*0.03),
                  child:const Text("Read full terms & conditions",style: TextStyle(color: primaryPurple,fontSize: 14,fontWeight: FontWeight.w600),),
                ),
                SizedBox(height: size.height*0.03,),
                Row(
                  children: [
                    Checkbox(
                        fillColor:MaterialStateProperty.resolveWith(getColor),
                        checkColor: primaryPurple,
                        value: isBtn1Checked, onChanged: (bool? value){
                      setState(() {
                        isBtn1Checked = value!;
                      });
                    }),
                    Text("I agree with the Terms and Conditions")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        fillColor:MaterialStateProperty.resolveWith(getColor),
                        checkColor: primaryPurple,
                        value: isBtn1Checked, onChanged: (bool? value){
                      setState(() {
                        isBtn1Checked = value!;
                      });
                    }),
                   const Text("I agree with Joblancer Privacy Policy")
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                isBtn1Checked==true?button():Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget button(){
    return GestureDetector(
      onTap: (){
        Get.toNamed('/freelancer');
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
