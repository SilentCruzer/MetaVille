import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_stack/image_stack.dart';
import 'package:metaville2/screens/complaints.dart';
import 'package:metaville2/screens/eventslist.dart';
import 'package:metaville2/screens/visitorscode.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:metaville2/screens/memberships.dart';
import 'package:metaville2/screens/helpdesk.dart';

class DashBoard extends StatefulWidget {
  @override
  DashboardScreen createState() => DashboardScreen();
}

class DashboardScreen extends State<DashBoard> {
  List<String> images1 = [
    "https://st4.depositphotos.com/1643295/24751/i/600/depositphotos_247513910-stock-photo-portrait-serious-mature-indian-businessman.jpg",
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top"
        "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  List<String> images2 = [
    "https://www.mckinsey.com/~/media/mckinsey/locations/asia/india/careers/our%20people/raman/india_careers_raman-sharma_quote-profile_1536x1152.jpg?mw=1536&car=48:59&cpx=Left&cpy=Top",
    "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://www.manchester.ac.uk/study/international/country-specific-information/india/India-profile-video-pic-070519-edited.jpg"
  ];
  List<String> images3 = [
    "https://images.unsplash.com/photo-1534235187448-833893dfe3e0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
    "https://us.123rf.com/450wm/michaeljung/michaeljung1209/michaeljung120900015/15041949-attractive-female-white-collar-worker-in-office.jpg?ver=6",
    "https://images.pexels.com/photos/4593618/pexels-photo-4593618.jpeg?cs=srgb&dl=pexels-nila-racigan-4593618.jpg&fm=jpg",
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                                ),
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "Welcome back, Adithya!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "You have got 3 events\nthis week!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Container(
                        height: 190,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.9),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          children: <Widget>[
                            _buildEventsCard(
                                title: "Residents Weekly\nMeeting",
                                subject: "Upcoming festivals",
                                time: "7 PM - 8 PM, Mon",
                                imageList: images1,
                                count: 22),
                            _buildEventsCard(
                                title: "Grounds Maintenance\nMeeting",
                                subject: "Cleanliness Guidelines",
                                time: "5 PM - 6 PM,  Wed",
                                imageList: images2,
                                count: 17),
                            _buildEventsCard(
                                title: "Covid-19 safety\nMeeting",
                                subject: "Visitors schedule",
                                time: "8 PM - 9 PM,  Thu",
                                imageList: images3,
                                count: 19)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    maxHeight: double.infinity,
                  ),
                  child: Container(
                    height: 425,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.5,
                          spreadRadius: 0.0,
                          offset:
                          Offset(-1.0, -1.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: new SingleChildScrollView(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          RichText(
                              text: TextSpan(
                                  text: "Overview",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          SizedBox(height: 25),
                          Container(
                            height: 250,
                            child: PageView(
                              controller: PageController(
                                  viewportFraction: 0.5, initialPage: 1),
                              scrollDirection: Axis.horizontal,
                              pageSnapping: false,
                              children: <Widget>[
                                _buildItemCard(
                                    title: "Memberships",
                                    total: "Total: 5",
                                    used: "Active: 3",
                                    totalNum: 5,
                                    usedNum: 3,
                                    color: Colors.blue,
                                    icon: FontAwesomeIcons.addressCard,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Memberships()),
                                    )),
                                _buildItemCard(
                                    title: "Events",
                                    total: "This month: 10",
                                    used: "Replied: 5",
                                    totalNum: 10,
                                    usedNum: 5,
                                    color: Colors.red,
                                    icon: FontAwesomeIcons.campground,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventsTimeline()),
                                    )),
                                _buildItemCard(
                                    title: "Complaints",
                                    total: "Unresolved: 4",
                                    used: "Resolved: 3",
                                    totalNum: 4,
                                    usedNum: 3,
                                    color: Colors.orange,
                                    icon: FontAwesomeIcons.comment,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Complaints()),
                                    )),
                                _buildItemCard(
                                    title: "Visitors",
                                    total: "Approved: 4",
                                    used: "Cancelled: 1",
                                    totalNum: 4,
                                    usedNum: 1,
                                    color: Colors.cyan,
                                    icon: FontAwesomeIcons.peopleArrows,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VisitorsCode()),
                                    )),
                                _buildItemCard(
                                    title: "Help Desk",
                                    total: "Tap to view",
                                    used: "",
                                    totalNum: 1,
                                    usedNum: 1,
                                    color: Colors.indigo,
                                    icon: FontAwesomeIcons.handsHelping,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HelpDesk()),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildItemCard(
      {String title,
        String total,
        String used,
        int totalNum,
        int usedNum,
        Color color,
        IconData icon,
        GestureTapCallback onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: FaIcon(
                            icon,
                            color: color,
                            size: 30,
                          )),
                    ],
                  )),
              SizedBox(height: 25),
              RichText(
                  text: TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ))),
              SizedBox(height: 10),
              Divider(
                thickness: 1,
              ),
              RichText(
                  text: TextSpan(
                      text: total,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: used,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ))),
              SizedBox(height: 20),
              LinearPercentIndicator(
                width: 115,
                lineHeight: 5,
                percent: usedNum / totalNum,
                backgroundColor: Colors.grey,
                progressColor: color,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventsCard(
      {String title, String subject, String time, List<String> imageList, int count}) {
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
                    WidgetSpan(
                        child: Icon(
                          Icons.timer,
                          size: 16,
                        )),
                    TextSpan(
                        text: "  " + time,
                        style: TextStyle(color: Colors.black, fontSize: 12))
                  ]),
                ),
                ImageStack(
                  imageList: imageList,
                  totalCount: count,
                  imageRadius: 25,
                  imageCount: 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
