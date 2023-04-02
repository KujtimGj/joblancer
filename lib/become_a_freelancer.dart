import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:joblancer/const.dart';
import 'package:joblancer/home/models/postModel.dart';
import 'package:joblancer/main.dart';

class BecomeFreelancer extends StatefulWidget {
  const BecomeFreelancer({super.key});

  @override
  State<BecomeFreelancer> createState() => _BecomeFreelancerState();
}

class _BecomeFreelancerState extends State<BecomeFreelancer> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController payment_typeController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();

  String error = "";
  String publisherError = "";
  String titleError = "";
  String paymentError = "";
  String descriptionError = "";
  String deadlineError = "";
  String budgetError = "";
  String requirementsError = "";

  final List<String> city = [
    'Prishtina',
    'Prizren',
    'Peja',
    'Gjilan',
    'Gjakova',
    'Ferizaj',
    'Mitrovice',
    'Deçan',
    'Dragash',
    'Drenas',
    'Fushe Kosove',
    'Istog',
    'Kaçanik',
    'Kamenica',
    'Klina',
    'Lipjan',
    'Malisheva',
    'Obiliq',
    'Peja',
    'Podujeva',
    'Rahovec',
    'Skenderaj',
    'Suhareka',
    'Shtërpcë',
    'Shtime',
    'Viti',
    'Vushtrri'
  ];
  String? selectedValue;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryPurple,
        title: const Text("Create a post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Your name"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                controller: publisherController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Kujtim Gjokaj',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            publisherError == ""
                ? Container()
                : Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Title"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                controller: titleController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Web developer, content writer...',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            titleError == ""
                ? Container()
                : Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Payment type"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                controller: payment_typeController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Fixed / Hourly',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            paymentError == ""
                ? Container()
                : Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Description"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                controller: descriptionController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Lorem ipsum...',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            descriptionError == ""
                ? Container()
                : Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Deadline"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: deadlineController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '20 days',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            deadlineError == ""
                ? Container()
                : Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Requirements"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: requirementsController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'requirements',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: primaryPurple,
                    width: 1,
                  )),
                ),
              ),
            ),
            Text(
              requirementsError,
              style: const TextStyle(color: Colors.red),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Budget"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: budgetController,
                style: const TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '120\$',
                  hintStyle: const TextStyle(color: Colors.black45),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: primaryGrey.withOpacity(0.2), width: 1.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryPurple,
                        width: 1,
                      )),
                ),
              ),
            ),
            Text(
              budgetError,
              style: const TextStyle(color: Colors.red),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("City"),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.1,),
              child: Container(
                padding:const EdgeInsets.all(10),
                width: size.width*0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select City',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: city
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                final post = Post(
                  budget: budgetController.text,
                  deadline: deadlineController.text,
                  description: descriptionController.text,
                  payment_type: payment_typeController.text,
                  publisher: publisherController.text,
                  title: titleController.text,
                  createdAt: Timestamp.now(),
                  requirements: requirementsController.text,
                  city: selectedValue as String,
                );

                if (publisherController.text == '') {
                  setState(() {
                    publisherError = "Please fill the field!";
                  });
                } else {
                  setState(() {
                    publisherError = "";
                  });
                }
                if (descriptionController.text == "") {
                  setState(() {
                    descriptionError = "Please fill the field";
                  });
                } else {
                  setState(() {
                    descriptionError = "";
                  });
                }
                if (titleController.text == "") {
                  setState(() {
                    titleError = "Please fill the field!";
                  });
                } else {
                  setState(() {
                    titleError = "";
                  });
                }
                if (payment_typeController.text == "") {
                  setState(() {
                    paymentError = "Please fill the field";
                  });
                } else {
                  setState(() {
                    paymentError = "";
                  });
                }
                if (deadlineController.text == "") {
                  setState(() {
                    deadlineError = "Please fill the field";
                  });
                } else {
                  setState(() {
                    deadlineError = "";
                  });
                }
                if (budgetController.text == "") {
                  setState(() {
                    budgetError = "Please fill the field";
                  });
                } else {
                  setState(() {
                    budgetError = "";
                  });
                }
                if(requirementsController.text==''){
                  setState(() {
                    requirementsError == "Please fill the field";
                  });
                }else{
                  setState(() {
                    budgetError="";
                  });
                }
                if (budgetController.text != "" &&
                    deadlineController.text != "" &&
                    titleController.text != "" &&
                    descriptionController.text != "" &&
                    publisherController.text != "" &&
                    payment_typeController.text != ""&&
                    requirementsController.text !=""
                ) {
                  createPost(post: post);
                } else {
                  setState(() {
                    error = "Please fill the fields";
                  });
                }

                const snackBar = SnackBar(
                  content: Text("Post been published successfully!"),
                  backgroundColor: Colors.green,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    (route) => false);
              },
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: size.height * 0.08,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future createPost({
  Post? post,
}) async {
  final docPost = FirebaseFirestore.instance.collection('posts').doc();
  post?.id = docPost.id;

  final json = post?.toJson();

  await docPost.set(json!);
}
