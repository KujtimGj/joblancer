import 'package:flutter/material.dart';
import 'package:joblancer/provider/sign_in_provider.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.size,
    required this.sp,
  }) : super(key: key);

  final Size size;
  final SignInProvider sp;

  @override
  Widget build(BuildContext context) {
      return Container(
          // height: size.height * 0.3,
          width: size.width,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: Colors.grey.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${sp.name}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          const Text("data")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.all(8.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need freelancer to develop new web store!",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.price_change,
                                color: Colors.grey,
                              ),
                              Text("fixed")
                            ],
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: const [
                              Icon(
                                Icons.access_time_sharp,
                                color: Colors.grey,
                              ),
                              Text("10 min")
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
              const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 3,
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.attach_money),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Budget"),
                            Text("800\$"),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
          ));
  }
}
