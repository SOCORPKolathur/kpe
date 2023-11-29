
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Landing Screen/Landing-Screen_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import 'otppage.dart';


class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  TextEditingController _PhoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffFffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ///KALPANA ENTERPRISES Text
          Padding(
            padding: EdgeInsets.only(top: height / 20.36),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const firstpage()));
              },
              child: Padding(
                padding: EdgeInsets.only(top: height / 42.16),
                child: GestureDetector(
                  onTap: () {
                  },
                  child:  const Text(
                    "KALPANA\nENTERPRISES",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontFamily: "Davish",
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // IntlPhoneField(
          //   decoration: InputDecoration(
          //     labelText: 'Phone Number',
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(),
          //     ),
          //   ),
          //   languageCode: "en",
          //   onChanged: (phone) {
          //     print(phone.completeNumber);
          //   },
          //   onCountryChanged: (country) {
          //     print('Country changed to: ' + country.name);
          //   },
          // ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: width / 10.2, top: height / 41.6),
                child: const KText(
                  text:"Enter Phone Number",
                  style: TextStyle(
                    fontFamily: "Davish",
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: height / 30.37),
            child: Container(
              height: height / 18.97,
              width: width / 1.22,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 21.81),
                    child: SizedBox(
                        height: height / 30.36,
                        width: width / 15.68,
                        child: Image.asset("assets/flag2.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 30.20),
                    child: KText(
                      text: "India",
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),


          ///flag image and controller
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 11.01),
                child: Container(
                  height: height / 19.97,
                  width: width / 7.84,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height / 94.87, left: width / 30.15),
                    child: Text(
                      "+91",
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height / 18.97,
                width: width / 1.46,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: height / 75.9, left: width / 30.1),
                  child:
                 TextField(
                   controller: _PhoneController,
                   keyboardType: TextInputType.number,
                   decoration: const InputDecoration(
                     border: InputBorder.none,


                     hintText: "Enter the Phone Number"
                   ),
                 )
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
                top: height / 37.98, left: width / 20.64),
            child: KText(
             text: "We’ll Send you a code by SMS to confirm your phone number.",
              style: GoogleFonts.openSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222B45)),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                top: height / 37.95, left: width / 19.6),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  OTPScreen(_PhoneController.text)));
              },
              child: Padding(
                padding: EdgeInsets.only(top:height/30.36),
                child:
                Container(
                  height: height / 13.97,
                  width: width / 1.91,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff0A904C), Color(0xff018266)],
                    ),
                  ),
                  child:   const Center(
                    child: KText(
                      text:"Continue",
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 0.5,
                        fontFamily: "Davish",
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
