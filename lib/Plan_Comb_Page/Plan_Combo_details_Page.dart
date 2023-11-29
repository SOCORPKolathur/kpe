import 'package:flutter/material.dart';

import '../Translator_Module/Translator_Module_Page.dart';

class Plan_Combo_details_Page extends StatefulWidget {
  const Plan_Combo_details_Page({Key? key}) : super(key: key);

  @override
  State<Plan_Combo_details_Page> createState() => _Plan_Combo_details_PageState();
}

class _Plan_Combo_details_PageState extends State<Plan_Combo_details_Page> {
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
                    text: 'Plans Details',
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
    );
  }
}
