import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/postModel.dart';
import 'package:joblancer/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final zoomDrawerController = ZoomDrawerController();

  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool shouldPop = false;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sp = context.watch<SignInProvider>();
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff8f8f8),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: const Color(0xfff8f8f8),
          leadingWidth: 65,
          leading: GestureDetector(
            onTap: () {
              setState(() {
                ZoomDrawer.of(context)?.toggle();
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.menu,
                color: Colors.grey,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Joblancer",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1.3,
                      color: Colors.grey.withOpacity(0.3),
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[700],
                        size: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: VerticalDivider(
                        thickness: 1,
                      ),
                    ),
                    const Flexible(
                      child: TextField(
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Search for freelance',
                          hintStyle: TextStyle(color: Colors.black45),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Search",
                        style: TextStyle(
                            color: primaryPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder<List<Post>>(
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
                              Get.toNamed("/details");
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
                                            Container(
                                              padding: const EdgeInsets.all(30),
                                              margin: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red),
                                            ),
                                            Column(
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
                                                children: const [
                                                  Icon(Icons.send),
                                                  Text("Apply")
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
                                                .headline6!
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
                                                child: Icon(Icons.attach_money),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text("Budget"),
                                                  Text("800\$"),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<Post>> readPosts() => FirebaseFirestore.instance
      .collection('posts')
      .orderBy("createdAt", descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
}
