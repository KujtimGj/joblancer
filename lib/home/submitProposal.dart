import 'package:flutter/material.dart';
import 'package:joblancer/const.dart';
import 'package:get/get.dart';

import 'models/postModel.dart';

class SubmitProposal extends StatefulWidget {
  const SubmitProposal({Key? key,required this.posts}) : super(key: key);
  final Post posts;

  @override
  State<SubmitProposal> createState() => _SubmitProposalState();
}

class _SubmitProposalState extends State<SubmitProposal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: (){
          Get.back();
        },child: const Icon(Icons.arrow_back,color: primaryPurple,size: 30,)),
        title:const Text("Submit proposal",style: TextStyle(color: Color(0xff313131)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text("Apply to",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              ),
              Center(
                child: Container(
                  width: size.width*0.9,
                  decoration: BoxDecoration(
                    color: const Color(0xfff6f6f6),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1,color: primaryPurple.withOpacity(0.4))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.posts.title,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0,bottom: 9),
                          child: Text(widget.posts.description, overflow: TextOverflow.ellipsis,maxLines: 3,),
                        ),
                        const Text("Posted 1 hour ago",style: TextStyle(fontSize: 11),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
