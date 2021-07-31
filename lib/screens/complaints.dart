import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_stack/image_stack.dart';

class Complaints extends StatefulWidget {
  @override
  ComplaintsScreen createState() => ComplaintsScreen();
}

class ComplaintsScreen extends State<Complaints> {
  bool generated = false;
  var _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  var data = "";
  List<String> images1 = [
    "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
        "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        body: Material(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.arrowLeft),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.commentAlt,
                          color: generated ? Colors.black : Colors.blue,
                        ),
                        onPressed: () {
                          NavigatorState;
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                          text: TextSpan(
                              text: "Complaints",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                              text: "Unresolved Complaints",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Container(
                      height: 220,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.9),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          _buildUnresolvedCard(
                              title: "Covid-19 Safety",
                              subject: "Sanitization required",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          _buildUnresolvedCard(
                              title: "Water Shortage",
                              subject: "No water in C-Block",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          _buildUnresolvedCard(
                              title: "No Cleanliness",
                              subject: "Bad odour near Park",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO"),
                          _buildUnresolvedCard(
                              title: "Covid-19 Safety",
                              subject: "Visitors should not be allowed",
                              text: "Complaint supported by",
                              imageList: images1,
                              me: "Meeting Required?",
                              meeting: "YES",
                              meeting2: "NO")
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 1),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 48),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: "Raise a Complaint",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                        text: TextSpan(
                                            text: "Title",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: titleController,
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Title";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade200,
                                              width: 2.0),
                                          borderRadius:
                                              new BorderRadius.circular(20),
                                        ),
                                        hintText:
                                            "Enter title of your complaint"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: RichText(
                                        text: TextSpan(
                                            text: "Subject",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: subjectController,
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Subject";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade200,
                                              width: 2.0),
                                          borderRadius:
                                              new BorderRadius.circular(20),
                                        ),
                                        hintText:
                                            "Enter subject of your complaint"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: 200, height: 60),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              data =
                                                  " Name: ${titleController.text + "\n"} Visitors: ${subjectController.text + "\n"}";
                                              generated = true;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text('Raised')),
                                            );
                                          }
                                        },
                                        child: Text("Raise"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue.shade700),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ))
                        ])))
          ],
        ),
      ),
    ));
  }

  Widget _buildUnresolvedCard(
      {String title,
      String subject,
      String text,
      List<String> imageList,
      String me,
      String meeting,
      String meeting2}) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        text: subject,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12))
                        ]),
                      ),
                      ImageStack(
                        imageList: imageList,
                        totalCount: 20,
                        imageRadius: 25,
                        imageCount: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: me,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))
                        ]),
                      ),
                      TextButton(
                        child: Text(meeting),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(meeting2),
                        onPressed: () {},
                      )
                    ],
                  )
                ])));
  }
}
