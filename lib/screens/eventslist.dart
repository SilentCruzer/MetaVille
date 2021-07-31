import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class EventsTimeline extends StatefulWidget{
  @override
  EventsTimelineScreen createState() => EventsTimelineScreen();
}

class EventsTimelineScreen extends State<EventsTimeline>{
  List data;
  DateTime now = DateTime.now();
  DateTime pickedDate = DateTime.now();
  String dateText;
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
                          dateText = DateFormat('dd-MM-yyyy').format(pickedDate).toString();
                        });
                      },
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .load('lib/screens/events.json'),
                builder: (context, snapshot){
                  var newData = json.decode(jsonData);
                  print(data);
                  return Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) => newData[dateText] != null,
                      widgetBuilder: (BuildContext context) => conditionalList(newData),
                      fallbackBuilder: (BuildContext context) => conditionalNull()
                  );
                },
              ),
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
                        height: 16,
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
  Widget conditionalList(dynamic newData){
    return Container(
      height: 1000,
      child: ListView.builder(itemCount: newData[dateText].length,itemBuilder: (BuildContext context, int index){
        return _buildEventCard(
            from: newData[dateText][index]["from"],
            to: newData[dateText][index]["to"],
            Title: newData[dateText][index]["title"],
            location: newData[dateText][index]["location"]
        );
      })
      ,);
  }
  Widget conditionalNull(){
    return Center(
      child:Padding(
        padding: EdgeInsets.only(top: 50),
        child: Text("You have no events on this day",
        style: TextStyle(
          fontSize: 16,
        ),),
      )
    );
  }
  String jsonData = '{"01-08-2021":[{"from":"6:00pm","to":"7:00pm","location":"Community hall","title":"Party planning meeting"},'
      '{"from":"7:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Book club meeting"},'
      '{"from":"8:30pm","to":"9:00pm","location":"Community hall","title":"Covid-19 safety meeting"}],'
      '"02-08-2021":[{"from":"8:00pm","to":"7:00pm","location":"Apt 20, floor 4","title":"Birthday Party"},'
      '{"from":"9:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Weekly meeting"}],'
      '"03-08-2021":[{"from":"8:00pm","to":"7:00pm","location":"Apt 20, floor 4","title":"Current Events"},'
      '{"from":"9:30pm","to":"8:00pm","location":"Apt 13, floor 3","title":"Arts club meeting"}]}';
}