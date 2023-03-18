import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/postModel.dart';

class Details extends StatefulWidget {
  const Details({super.key});

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
          toolbarHeight: 70,
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
            "Job Details",
            style: TextStyle(color: Color(0xff313131)),
          ),
        ),
        body: StreamBuilder<List<Post>>(
          stream: readPosts(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong ${snapshot.error}");
            } else if (snapshot.hasData) {
              final posts = snapshot.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryPurple),
                          ),
                          const Flexible(
                            child: Text(
                              "Looking for Figma designer for GAMING THEME with potential long term position",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Project overview",
                          style: TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          posts![1].description,
                          style: TextStyle(
                            height: 1.3,
                            wordSpacing: 1.2,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Skills and expertise",
                          style: TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,
                            mainAxisExtent: 130,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 7,
                          itemBuilder: ((context, index) {
                            return Container(
                              width: size.width * 0.1,
                              margin: const EdgeInsets.symmetric(
                                vertical: 30,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryPurple.withOpacity(0.3)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Skill",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          })),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Detail Project",
                          style: TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          "5.00 of 48 reviews",
                          style: TextStyle(color: black, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amber[600],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
        ));
  }

  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .orderBy("createdAt", descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
}
