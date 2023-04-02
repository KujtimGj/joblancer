import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/models/postModel.dart';
import 'package:joblancer/home/submitProposal.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.posts});

  final Post posts;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          toolbarHeight: 40,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: primaryPurple,
            ),
          ),
          title: const Text(
            "",
            // style: TextStyle(color: Color(0xff313131)),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin:const EdgeInsets.only(top: 10),
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:const EdgeInsets.symmetric(vertical: 10),
                        height: size.height*0.05,
                        width: size.width*0.29,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/pin.png"),
                            ),
                            const Text("Prishtina")
                          ],
                        ),
                      ),
                      Text(widget.posts.title, style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                      const Text("Posted 1 hours ago",),
                      SizedBox(height: size.height*0.02,),
                      Row(
                        children: [
                          Container(
                            height: size.height*0.06,
                            width: size.width*0.27,
                            margin:const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: primaryPurple.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text('\$ ${widget.posts.budget}',style:const TextStyle(fontWeight: FontWeight.w700),),
                                Text("Fixed-price",style: TextStyle(color: Colors.grey[600]),)
                              ],
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.all(5),
                            height: size.height*0.06,
                            width: size.width*0.27,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: primaryPurple.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('\$290',style: TextStyle(fontWeight: FontWeight.w700),),
                                Text("Fixed-price",style: TextStyle(color: Colors.grey[600]),)
                              ],
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.all(5),
                            height: size.height*0.06,
                            width: size.width*0.27,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: primaryPurple.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('\$290',style: TextStyle(fontWeight: FontWeight.w700),),
                                Text("Fixed-price",style: TextStyle(color: Colors.grey[600]),)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height*0.02),
                      const Text("Job description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Text(widget.posts.description, style:const TextStyle(height: 1.3),),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      const Text("Requirements",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Text(widget.posts.requirements,style:const TextStyle(height: 1.3)),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      const Text("Attachments",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitProposal(posts: widget.posts)));
                  Get.toNamed("/login");
                },
                child: Container(
                  height: size.height*0.07,
                  width: size.width*0.4,
                  margin: EdgeInsets.symmetric(horizontal: size.width*0.2),
                  decoration: BoxDecoration(
                    color: primaryPurple,
                    borderRadius: BorderRadius.circular(35)
                  ),
                  child:const Center(child: Text("Apply",style: TextStyle(color: Colors.white,fontSize: 18),)),
                ),
              ),
            )
          ],
        ));
  }

  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .orderBy("createdAt", descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
}
