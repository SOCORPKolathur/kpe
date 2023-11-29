import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPdffile extends StatefulWidget {
  String?view;
   ViewPdffile(this.view);

  @override
  State<ViewPdffile> createState() => _ViewPdffileState();
}



class _ViewPdffileState extends State<ViewPdffile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late PDFViewController pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(
        height: 600,
        width: 400,
        child: PDFView(
          pageFling: true,
          filePath: widget.view,

          onPageChanged: (int?page, int?total) {
          },
          onViewCreated: (PDFViewController pdfViewController) {
            // You can use the pdfViewController for further interactions
          },
        ),
      ),
    );
  }
}
