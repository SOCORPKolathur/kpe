import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Photo_View-Page/PhotoView_Page.dart';
import '../Translator_Module/Translator_Module_Page.dart';

class Poliy_Advertiment_subCategory extends StatefulWidget {
  String?DocumentID;
  String?TypeName;
   Poliy_Advertiment_subCategory({this.DocumentID,this.TypeName});

  @override
  State<Poliy_Advertiment_subCategory> createState() => _Poliy_Advertiment_subCategoryState();
}

class _Poliy_Advertiment_subCategoryState extends State<Poliy_Advertiment_subCategory> {

  String userName="";
  String userEmail="";
  String userImg="";
  String userPhone="";
  String companyName="";
  String companyType="";
  String companyIMage="";

  @override
  void initState() {
    getDateFromUser();
    // TODO: implement initState
    super.initState();
  }
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
                height: height / 30.062,
                width: width / 1.418,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child: KText(
                    text: '${widget.TypeName}',
                    style: const TextStyle(
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
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Policies Advertisment_category").doc(widget.DocumentID).collection("SubCategory").orderBy("timestamp").snapshots(),
            builder:(context, snapshot) {

              if(snapshot.hasData==null){
                return  Center(
                    child: CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                      strokeWidth: 5,)
                );
              }
              if(!snapshot.hasData){

                return  Center(
                    child: CircularProgressIndicator(color :Color(0xff0C9346),strokeCap: StrokeCap.square,
                      strokeWidth: 5,)
                );
              }

              return
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 65/110
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var Value=snapshot.data!.docs[index];

                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            Photo_View_Page(Value['img'].toString(),userImg,userName,userPhone,userEmail,companyName,companyType,companyIMage),));
                      },
                      child: Container(
                        margin:EdgeInsets.all(5),
                        height:height/16.539,
                        width: width/7.762,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius:  BorderRadius.circular(8),
                            image:DecorationImage(
                                fit:BoxFit.cover,
                                image:NetworkImage(Value['img'].toString())
                            )
                        ),

                      ),
                    );


                  },);
            }, ),
        ],
      ),
    );
  }

  getDateFromUser() async {
    print("user+++++++++++++++++++++++++++++++++++++++");
    var getdata=await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();

    Map<String,dynamic>?value=getdata.data();
    setState(() {
      userName=value!['Name'];
      userEmail=value['Email'];
      userImg=value['Img'];
      userPhone=value['Phone'];
      companyName=value['companyName'];
      companyType=value['companyType'];
    });

    var companyData=await FirebaseFirestore.instance.collection("CompanyType").where("Name",isEqualTo:companyType.toString()).get();

    if(companyData.docs.length>0){
      setState((){
        companyIMage=companyData.docs[0]['Img'];
      });
    }

    print(userName);
    print(userEmail);
    print(userImg);
    print(userPhone);
    print(companyName);
    print(companyType);
    print('Company Image File success');
    print(companyIMage);
  }
}
