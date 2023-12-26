import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../Landing Screen/Landing-Screen_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';

class Languages_Page extends StatefulWidget {

  @override
  State<Languages_Page> createState() => _Languages_PageState();
}

class _Languages_PageState extends State<Languages_Page> {
  List<ChooseLanguageModel> languagesList = [
    ChooseLanguageModel(
      name: "Tamil",
      orgName: "தமிழ்",
      code: "ta",
    ),
    ChooseLanguageModel(
      name: "English",
      orgName: "English",
      code: "en_US",
    ),
    ChooseLanguageModel(
      name: "Hindi",
      orgName: "हिंदी",
      code: "hi",
    ),
    ChooseLanguageModel(
      name: "Telugu",
      orgName: "తెలుగు",
      code: "te",
    ),
    ChooseLanguageModel(
      name: "Malayalam",
      orgName: "മലയാളം",
      code: "ml",
    ),
    ChooseLanguageModel(
      name: "Kannada",
      orgName: "ಕನ್ನಡ",
      code: "kn",
    ),
    ChooseLanguageModel(
      name: "Bengali",
      orgName: "বাংলা",
      code: "bn",
    ),
    ChooseLanguageModel(
      name: "Gujarati",
      orgName: "ગુજરાતી",
      code: "Gujarath",
    ),
    ChooseLanguageModel(
      name: "Urdu",
      orgName: "اُردُو",
      code: "Urdu",
    ),
    ChooseLanguageModel(
      name: "Odia",
      orgName: "ଓଡ଼ିଆ",
      code: "Odia",
    ),
    ChooseLanguageModel(
      name: "Assamese",
      orgName: "ଓଡ଼ିଆ",
      code: "Assamese",
    ),
    ChooseLanguageModel(
      name: "Maithili",
      orgName: "Macushi",
      code: "Maithili",
    ),
    ChooseLanguageModel(
      name: "Sanskrit",
      orgName: "संस्कृतम्",
      code: "Sanskrit",
    ),
    ChooseLanguageModel(
      name: "Punjabi",
      orgName: "ਪੰਜਾਬੀ",
      code: "Punjabi",
    ),
    ChooseLanguageModel(
      name: "Punjabi",
      orgName: "ਪੰਜਾਬੀ",
      code: "Punjabi",
    ),
    ChooseLanguageModel(
      name: "Marathi",
      orgName: "मराठी",
      code: "Marathi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    text: 'Select Your Language',
                    style:
                    TextStyle(
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
      body: SafeArea(
          child: Stack(
            children: [


              SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [

                    Expanded(
                      child: SizedBox(
                          width: double.infinity,
                          child: GridView.builder(
                            itemCount: languagesList.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0,
                                childAspectRatio: 16 / 15),
                            itemBuilder: (BuildContext context, int i) {
                              return InkWell(
                                onTap: () {

                                 setState(() {
                                   changeLocale(context, languagesList[i].code!);
                                 });

                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const firstpage(),));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 16),
                                  child: Container(
                                    height: height/10.957,
                                    width: width/5.142,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Color(0xff0C9346), Color(0xff008069)],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(1, 3),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          languagesList[i].orgName!,
                                          style:
                                          TextStyle(
                                              fontFamily: "Davish",
                                              color: Colors.white,
                                              fontSize: width/15.824,
                                              letterSpacing: 0.3)
                                        ),
                                         SizedBox(height: height/175.30),
                                        Text(
                                          languagesList[i].name!.toUpperCase(),
                                          style:
                                          TextStyle(
                                              fontFamily: "Davish",
                                              color: Colors.white,
                                              fontSize: width/15.824,
                                              letterSpacing: 0.3)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class ChooseLanguageModel {
  ChooseLanguageModel({this.name, this.code, this.orgName});

  String? name;
  String? orgName;
  String? code;
}