import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class EventsTimeline extends StatefulWidget{
  @override
  EventsTimelineScreen createState() => EventsTimelineScreen();
}

class EventsTimelineScreen extends State<EventsTimeline>{
  DateTime now = DateTime.now();
  DateTime pickedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromRGBO(0, 26, 51, 10),
                padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {Navigator.of(context).pop();},
                            icon: FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white,size: 20,)
                        ),
                        RichText(text: TextSpan(
                          text: DateFormat.MMMM().format(now) + " " + DateFormat('yyyy').format(now),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19
                          )
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.search, color: Colors.white,size: 20,)
                        ),
                      ],
                    ),
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.grey.shade700,
                      selectedTextColor: Colors.white,
                      monthTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 0
                      ),
                      dateTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                      ),
                      dayTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          pickedDate = date;
                        });
                      },
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              _buildEventCard(from: '6:00 pm', to: '7:00 pm', Title: "Weekly Meeting", location: "Community hall"),
              _buildEventCard(from: '7:30 pm', to: '8:00 pm', Title: "Book club meeting", location: "Apt 13, floor 3"),
              _buildEventCard(from: '8:30 pm', to: '9:00 pm', Title: "Covid-19 safety meeting", location: "Lobby")
            ],
          ),
        ),
      )
    );
  }

  Widget _buildEventCard({ String from, String to, String Title,  String location}){
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(from),
              SizedBox(height: 20,),
              Container(height: 1,width: 25,color: Colors.grey[300],),
              SizedBox(height: 30,),
              Container(height: 1,width: 35,color: Colors.grey[300],),
              SizedBox(height: 30,),
              Container(height: 1,width: 25,color: Colors.grey[300],),
              SizedBox(height: 25,),
            ],
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 26, 51, 10),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 4.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Container(
                        height: 15,
                        child: Row(
                          children: [
                            Text(from + " - "+ to),
                            VerticalDivider(width: 10,color: Colors.grey[700],),
                            Text(location)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        Title,
                        style: TextStyle(
                          fontSize: 22
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}