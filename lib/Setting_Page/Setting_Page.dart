
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Language_Page/Language_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';

class Setting_Page extends StatefulWidget {
  const Setting_Page({Key? key}) : super(key: key);

  @override
  State<Setting_Page> createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(left: width / 102.857),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 27.428),
              child: SizedBox(
                height: height/30.062,
                width:width/1.418,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  child: KText(
                    text: 'Settings',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,

                        letterSpacing: 0.3),
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: height / 9.59,
        flexibleSpace: Container(
          height: height / 7.09,
          width: width / 3.92,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff0C9346), Color(0xff008069)],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              elevation: 5,

              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>   Languages_Page(),));
                },
                tileColor: Colors.white,
                leading: const Icon(Icons.calculate,color: Color(0xff0C9346),size: 30,),
                title: SizedBox(
                  width:width/1.6457,
                  height: height/35.062,
                  child: const FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: KText(
                      text: 'Languages',
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.black,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              elevation: 5,

              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                tileColor: Colors.white,
                leading: const Icon(Icons.app_blocking,color: Color(0xff0C9346),size: 30,),
                title: SizedBox(
                  width:width/1.6457,
                  height: height/35.062,
                  child: const FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: KText(
                      text: 'App Version 1.0',
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.black,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              elevation: 5,

              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onTap: (){
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                tileColor: Colors.white,
                leading: const Icon(Icons.exit_to_app_outlined,color: Color(0xff0C9346),size: 30,),
                title: SizedBox(
                  width:width/1.6457,
                  height: height/35.062,
                  child: const FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    child: KText(
                      text: 'Exit Application',
                      style: TextStyle(
                          fontFamily: "Davish",
                          color: Colors.black,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),),
            ),
          ),
        ],
      ),

    );
  }
}
