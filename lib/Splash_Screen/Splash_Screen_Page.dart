
import 'package:flutter/material.dart';

import '../Auth Pages/Login_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginpage(),));
    });
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:
              EdgeInsets.only(left: width / 19.6, top: height/4.74),
              child: Image.asset("assets/KPE LOGO.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height / 5.10),
            child: const KText(
                text: 'Your life insurance partner',
                style:TextStyle(
                    fontFamily: "Davish",
                    fontWeight: FontWeight.w500,
                    fontSize: 37
                )
              // color: Color(0xff000000)
            ),
          )
        ],
      ),
    );
  }
}
