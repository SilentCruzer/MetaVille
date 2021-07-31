import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'constants2.dart';
import 'profile_list_item.dart';

class HelpDesk extends StatefulWidget {
  HelpDesk({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.of(context).pop();},
                        child: AppBarButton(
                          icon: Icons.arrow_back,
                        ),
                      ),
                    ],
                  ),
                ),
                AvatarImage(),
                SizedBox(
                  height: 30,
                ),
                SocialIcons(),
                SizedBox(height: 30),
                Text(
                  'Help Desk',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
                SizedBox(height: 15),
                Text(
                  'Useful Contact Information\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                ),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;

  const AppBarButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAppPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: avatarDecoration,
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/mitsubishi.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          color: Color(0xFF102397),
          iconData: facebook,
          onPressed: () {},
        ),
        SocialIcon(
          color: Color(0xFFff4f38),
          iconData: googlePlus,
          onPressed: () {},
        ),
        SocialIcon(
          color: Color(0xFF38A1F3),
          iconData: twitter,
          onPressed: () {},
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function onPressed;

  SocialIcon({this.color, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatefulWidget {

  @override
  _ProfileListItemsState createState() => _ProfileListItemsState();
}

class _ProfileListItemsState extends State<ProfileListItems> {
  @override
  var arr = [true,true,true,true];
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              setState(() {
                arr[0]=!arr[0];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.phone,
              text: arr[0]?'Helpline':'+91 33333 66666',
              hasNavigation: arr[0],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                arr[1]=!arr[1];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.mail_bulk,
              text: arr[1]?'Mail':'admin@helpdesk.com',
              hasNavigation: arr[1],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                arr[2]=!arr[2];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.hospital,
              text: arr[2]?'Ambulance':'108',
              hasNavigation: arr[2],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                arr[3]=!arr[3];
              });
            },
            child: ProfileListItem(
              icon: LineAwesomeIcons.user_shield,
              text: arr[3]?'Police':'100',
              hasNavigation: arr[3],
            ),
          ),
        ],
      ),
    );
  }
}

