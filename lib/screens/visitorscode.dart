import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

class VisitorsCode extends StatefulWidget {

  @override
  _VisitorsCodeState createState() => _VisitorsCodeState();
}

class _VisitorsCodeState extends State<VisitorsCode> {
  bool generated = false;
  final controller = ScreenshotController();
  var _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final visitorsController = TextEditingController();
  final timeController = TextEditingController();
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                        icon: FaIcon(FontAwesomeIcons.shareAlt, color: generated ? Colors.black : Colors.grey,),
                        onPressed: () async {
                          if(generated){
                            final image = await controller.captureFromWidget(qrCard());
                            saveAndShare(image);
                          }else{
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: RichText(text:TextSpan(
                        text: "Visitors Code",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        )
                    )),
                  ),
                  SizedBox(height: 20,),
                  qrCard(),
                  SizedBox(height: 20,),
                  RichText(text:TextSpan(
                      text: "Details",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      )
                  )),
                  SizedBox(height: 20,),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:TextSpan(
                                text: "Name",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter name";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                hintText: "Visitors Name"
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:TextSpan(
                                text: "Visitors",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: visitorsController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter No: of visitors";
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                hintText: "Enter No: of visitors"
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: RichText(text:TextSpan(
                                text: "Time",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                )
                            )),
                          ),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: timeController,
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Please Enter the time";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
                                  borderRadius:  new BorderRadius.circular(20),
                                ),
                                hintText: "Enter Time eg: (7 pm)"
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200, height: 60),
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState.validate()){
                                    setState(() {
                                      data = " Name: ${nameController.text + "\n"} Visitors: ${visitorsController.text + "\n"} Time: ${timeController.text + "\n"}";
                                      generated = true;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: Text("Generate"),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade700),
                                ),),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget qrCard(){
    return Center(
      child: Container(
        height: 360,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) => data != "",
              widgetBuilder: (BuildContext context) => _shareQR(),
              fallbackBuilder: (BuildContext context) => _fallback(),
            ),
          ),
        ),
      ),
    );
  }
  Widget _shareQR(){
    return Container(
      child: Column(
        children: [
          QrImage(
            data: data,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }

  Widget _fallback(){
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('images/qrcode.png'),
            iconSize: 190,
            onPressed: () {},
          ),
          Text("Enter the details below to\n generate a Qr code",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black38,
            ),)
        ],
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async{
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  Future<String> saveImage(Uint8List image) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Screenshot_$time';
    final result = await ImageGallerySaver.saveImage(image, name: name);
    return result['filepath'];
  }
}
