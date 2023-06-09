import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/details.dart';
import 'package:joblancer/home/models/postModel.dart';

class Freelances extends StatefulWidget {
  const Freelances({Key? key}) : super(key: key);

  @override
  State<Freelances> createState() => _FreelancesState();
}

class _FreelancesState extends State<Freelances> {


  @override
  void initState() {
    readPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: readPosts(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong! ${snapshot.error}");
        } else if (snapshot.hasData) {
          final posts = snapshot.data;
          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(posts: posts[index])));
                  },
                  child: Container(
                    // height: size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey.withOpacity(0.3))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Container(
                                  //   padding: const EdgeInsets.all(30),
                                  //   margin: const EdgeInsets.all(10),
                                  //   decoration: const BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.red),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:15),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          posts![index].publisher,
                                          style: const TextStyle(
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        Text(posts[index].publisher)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.bookmark_border),
                                        Text("Save")
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Column(
                                      children:  [
                                        Transform.rotate(angle: 12,child:const Icon(Icons.send, color: primaryPurple,)),
                                        const Text("Apply",style: TextStyle(color: primaryPurple),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  posts[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                      fontSize: 17,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.price_change,
                                            color: Colors.grey,
                                          ),
                                          Text(posts[index]
                                              .payment_type)
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.access_time_sharp,
                                            color: Colors.grey,
                                          ),
                                          Text(posts[index].deadline)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              posts[index].description,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 3,
                            ),
                          ),
                          const Divider(height: 1),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.attach_money),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text("Budget"),
                                        Text(posts[index].budget),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const VerticalDivider(
                                      thickness: 1,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.access_time),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Deadline"),
                                        Text("20 days"),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const VerticalDivider(
                                      thickness: 1,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.person),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: const [
                                        Text("Workers"),
                                        Text("3 freelancers"),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: primaryPurple),
          );
        }
      }),
    );
  }
  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .orderBy("createdAt", descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
}
