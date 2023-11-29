import 'package:flutter/material.dart';
import '../Translator_Module/Translator_Module_Page.dart';
import '../const File Page.dart';

class New_Endowment_details_Page extends StatefulWidget {
 String planusername;
 String planuserage;
 String planuserassuredvalue;
 String planusertermvalue;
 String planuserbounusvalue;
 New_Endowment_details_Page(
     this.planusername,
     this.planuserage,
     this.planuserassuredvalue,
     this.planusertermvalue,
     this.planuserbounusvalue,
     );

  @override
  State<New_Endowment_details_Page> createState() => _New_Endowment_details_PageState();
}

class _New_Endowment_details_PageState extends State<New_Endowment_details_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Row(

          children: [

            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Padding(
                padding:  EdgeInsets.only(left:width/102.857),
                child:  const Icon(Icons.arrow_back_ios_new_rounded),

              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left:width/27.428),
              child: SizedBox(
                height: height/30.062,
                width:width/1.418,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.contain,
                  child:
                  KText(
                    text: 'New Endowment Details',
                    style: TextStyle(
                        fontFamily: "Davish",
                        color: Colors.white,
                        fontSize: width/13.714,
                        letterSpacing: 0.3
                    ),
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
          decoration:  const BoxDecoration(
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
        Column(
         children: [

           ///profile image and text widgets
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               SizedBox(width: width/41.143,),
               Image.asset("assets/avator icon.png"),
               SizedBox(width: width/41.143,),
               SizedBox(
                 height: height/30.828,
                 width: width/4.0,
                 child: FittedBox(
                   fit: BoxFit.contain,
                   alignment: Alignment.center,
                   child: KText(
                     text:widget.planusername,
                     style: const TextStyle(
                         fontFamily: "Davish",
                         color: Colors.black,
                         letterSpacing: 0.3
                     ),
                   ),
                 ),
               ),


             ],
           ),
           SizedBox(height: height/87.657,),


           ///sumassured value and terms and text and value
           Row(
             children: [

               ///age container text
                SizedBox(
                 height: height/12.522,

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Age",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: FittedBox(
                         fit: BoxFit.contain,
                         alignment: Alignment.center,
                         child: KText(
                           text: widget.planuserage,
                           style: const TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),




                   ],
                 ),
               ),

               ///SumAssured container and text
               SizedBox(
                 height: height/12.522,

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"SumAssured",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: FittedBox(
                         fit: BoxFit.contain,
                         alignment: Alignment.center,
                         child: KText(
                           text: widget.planuserassuredvalue,
                           style: const TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),




                   ],
                 ),
               ),

               ///Term container and text
               SizedBox(
                 height: height/12.522,

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Term",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: FittedBox(
                         fit: BoxFit.contain,
                         alignment: Alignment.center,
                         child: KText(
                           text: widget.planusertermvalue,
                           style: const TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),




                   ],
                 ),
               ),

               ///ppt container and text
               SizedBox(
                 height: height/12.522,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"PPT",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: height/43.828,
                       width: width/4.1143,
                       child: FittedBox(
                         fit: BoxFit.contain,
                         alignment: Alignment.center,
                         child: KText(
                           text: widget.planusertermvalue,
                           style: const TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),




                   ],
                 ),
               ),


             ],
           ),

           SizedBox(height: height/87.657,),

           ///first year premium container---start(4.5% gst)
           Container(
             height: height/25.044,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Center(
               child:
               SizedBox(
                 height: height/25.044,
                width: width/2.0571,
                 child:
                 const FittedBox(
                   alignment: Alignment.center,
                   fit: BoxFit.contain,
                   child: KText(
                     text:"First Year Premium(4.5% Gst)",
                     style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3
                     ),
                   ),
                 ),
               ),
             ),


           ),

           ///yearly and half text container and so on.......
           Container(
             height: height/29.219,
             decoration: BoxDecoration(
               color: Colors.grey.shade300
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"YLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"HLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"QLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"MLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),

           ///yearly and half text container and so on value text.......
           Container(
             height: height/29.219,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           ),

           ///yearly and half  value text and gst value add .......
           Container(
             height: height/29.219,
             decoration: BoxDecoration(
                 color: Colors.grey.shade300
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child: const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child: const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child:
                   const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child:
                   const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           ),
           ///first year premium container--end


           ///Renewal premium container---start(2.25% gst)
           Container(
             height: height/25.044,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Center(
               child:
               SizedBox(
                 height: height/25.044,
                width: width/2.0571,
                 child:
                 const FittedBox(
                   alignment: Alignment.center,
                   fit: BoxFit.contain,
                   child: KText(
                     text:"Renewal Premium(2.25% Gst)",
                     style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3
                     ),
                   ),
                 ),
               ),
             ),


           ),

           ///yearly and half text container and so on.......
           Container(
             height: height/29.219,
             decoration: BoxDecoration(
                 color: Colors.grey.shade300
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"YLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"HLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"QLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"MLY",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.black,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),

           ///yearly and half text container and so on value text.......
           Container(
             height: height/29.219,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/4.1143,
                   child: SizedBox(
                     height: height/54.785,
                     width: width/20.571,
                     child:
                     const FittedBox(
                       alignment: Alignment.center,
                       fit: BoxFit.contain,
                       child: KText(
                         text:"999999",
                         style: TextStyle(
                             fontFamily: "Davish",
                             color: Colors.white,
                             letterSpacing: 0.3
                         ),
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           ),

           ///yearly and half  value text and gst value add .......
           Container(
             height: height/29.219,
             decoration: BoxDecoration(
                 color: Colors.grey.shade300
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children:  [

                 ///yearly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child: const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),


                 ///halfy text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child: const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

                 ///Quvatterly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child:
                   const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

                 ///monthly text
                 SizedBox(
                   height: height/54.785,
                   width: width/8.228,
                   child:
                   const FittedBox(
                     alignment: Alignment.center,
                     fit: BoxFit.contain,
                     child: KText(
                       text:"999999+10000",
                       style: TextStyle(
                           fontFamily: "Davish",
                           color: Colors.black,
                           letterSpacing: 0.3
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           ),

           ///Renewal premium container---start(2.25% gst)--end.............


           ///approximate return container
           Container(
             height: height/25.044,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Center(
               child:
               SizedBox(
                 height: 22,
                width: width/2.0571,
                 child:
                 const FittedBox(
                   alignment: Alignment.center,
                   fit: BoxFit.contain,
                   child: KText(
                     text:"Approximate Returns",
                     style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3
                     ),
                   ),
                 ),
               ),
             ),


           ),

           ///approximate details container

           Container(

             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             padding: const EdgeInsets.only(top: 10,bottom: 10),
             margin: const EdgeInsets.all(4),
             child:
             Column(
               children: [
                 ///sum assured text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///Sum Assured text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Sum Assured",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///Sum Assured value  text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: height/87.657),

                 ///Bounus Text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///Bonus text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Bonus",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///Bonus text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: height/87.657),

                 ///final addition bonus text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///final addition bonus text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"final addition bonus",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///final addition bonus text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: height/87.657),

                 ///maturity text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///maturity text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Maturity",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///final addition bonus text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.white,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),


           ),

           ///total details value container

           Container(
             height: 40,
             decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
             ),
             margin: const EdgeInsets.symmetric(
               horizontal: 4,
               vertical: 10
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 ///Total Premium text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///Total Premium text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Total Premium",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///Total Premium value  text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),


                 ///Total Returns text
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ///Total Returns text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.centerLeft,
                         fit: BoxFit.contain,
                         child: KText(
                           text:"Total Returns",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),

                     ///Total Returns text
                     SizedBox(
                       height: 15,
                       width: width/4.1143,
                       child:
                       const FittedBox(
                         alignment: Alignment.center,
                         fit: BoxFit.contain,
                         child: KText(
                           text:": 200000",
                           style: TextStyle(
                               fontFamily: "Davish",
                               color: Colors.black,
                               letterSpacing: 0.3
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),

               ],
             ),



           ),


           ///Medical reports text
           Container(
             height: height/25.044,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Center(
               child:
               SizedBox(
                 height: height/39.844,
                width: width/2.0571,
                 child:
                 const FittedBox(
                   alignment: Alignment.center,
                   fit: BoxFit.contain,
                   child: KText(
                     text:"Medical reports",
                     style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3
                     ),
                   ),
                 ),
               ),
             ),


           ),


           ///medical details container................
           SizedBox(height: height/87.657),
           Container(
             width: double.infinity,
             height: 150,
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Color(0xff0C9346), Color(0xff008069)],
               ),
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                     height: height/10.844,
                     width: width/1.0,
                     child: KText(text:medicalreport_textvalue,
                       style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3,
                         fontSize: width/20.571
                     ),),
                   ),

                   SizedBox(
                     height: height/26.844,
                     width: width/1.0,
                     child: KText(text:medicalreport_textvalue2,
                       align: TextAlign.start,
                       style: TextStyle(
                         fontFamily: "Davish",
                         color: Colors.white,
                         letterSpacing: 0.3,
                           fontSize: width/20.571

                     ),),
                   ),
                 ],
               ),
             ),
           ),
           SizedBox(height: height/87.657),









         ],

        ),
      ),
    );
  }
}
