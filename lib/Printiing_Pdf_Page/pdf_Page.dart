// import 'dart:typed_data';
// import 'package:flutter/services.dart'show rootBundle;
// import 'package:intl/intl.dart';
// import 'package:kpe/Translator_Module/Translator_Module_Page.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
//
// import '../Translator_Module/Translator_Module_Page.dart';
// import '../Translator_Module/Translator_Module_Page.dart';
// import '../Translator_Module/Translator_Module_Page.dart';
// import '../Translator_Module/Translator_Module_Page.dart';
// import '../Translator_Module/Translator_Module_Page.dart';
//
//
//
//
// Future<Uint8List> generateInvoice(PdfPageFormat pageFormat,List<Product> productlist, ) async {
//
//
//   final invoice = Invoice(
//     invoiceNumber: '#0001',
//     products: productlist,
//     customerName: '',
//     customerAddress: '',
//     paymentInfo:'Payment Mode: Online \nDate:${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}\nTime: ${DateFormat('hh:mm a').format(DateTime.now())}',
//     tax: "0",
//     baseColor: PdfColors.green,
//     accentColor: PdfColors.blueGrey900,
//   );
//
//   return await invoice.buildPdf(pageFormat);
// }
//
// class Invoice {
//   Invoice({
//     required this.products,
//     required this.customerName,
//     required this.customerAddress,
//     required this.invoiceNumber,
//     required this.tax,
//     required this.paymentInfo,
//     required this.baseColor,
//     required this.accentColor,
//   });
//
//   final List<Product> products;
//   final String customerName;
//   final String customerAddress;
//   final String invoiceNumber;
//   final String tax;
//   final String paymentInfo;
//   final PdfColor baseColor;
//   final PdfColor accentColor;
//
//   static const _darkColor = PdfColors.blueGrey800;
//   static const _lightColor = PdfColors.white;
//
//   PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;
//
//   PdfColor get _accentTextColor => baseColor.isLight ? _lightColor : _darkColor;
//
//   //double get _total => products.map<double>((p) => p.total).reduce((a, b) => a + b);
//
//   //double get _grandTotal => _total;
//
//   String? _logo;
//
//   String? _bgShape;
//
//   Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
//     // Create a PDF document.
//     final doc = pw.Document();
//
//     //_logo = await rootBundle.loadString('assets/icons8-logo.svg');
//     //_bgShape = await rootBundle.loadString('assets/invoice.svg');
//
//     // Add page to the PDF
//     doc.addPage(
//       pw.MultiPage(
//         pageTheme: _buildTheme(
//
//           pageFormat,
//           await PdfGoogleFonts.robotoRegular(),
//           await PdfGoogleFonts.robotoBold(),
//           await PdfGoogleFonts.robotoItalic(),
//         ),
//         header: _buildHeader,
//         footer: _buildFooter,
//         build: (context) => [
//         //  _contentHeader(context),
//           _contentTable(context),
//           pw.SizedBox(height: 20),
//          // _contentFooter(context),
//           pw.SizedBox(height: 20),
//
//         ],
//       ),
//     );
//     Printing.layoutPdf(
//
//       onLayout: (PdfPageFormat format) async => doc.save(),
//     );
//     // Return the PDF file content
//     return doc.save();
//   }
//
//   pw.Widget _buildHeader(pw.Context context) {
//     return pw.Column(
//       children: [
//         pw.Row(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//
//             pw.Container(
//               alignment: pw.Alignment.topRight,
//               padding: const pw.EdgeInsets.only(bottom: 8, left: 10),
//               height: 100,
//
//             ),
//             // pw.Container(
//             //   color: baseColor,
//             //   padding: pw.EdgeInsets.only(top: 3),
//             // ),
//
//             pw.Expanded(
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Container(
//                     height: 30,
//                     padding: const pw.EdgeInsets.only(left: 0),
//                     alignment: pw.Alignment.centerLeft,
//                     child: pw.Text(
//                       'Shabika Mobiles',
//                       style: pw.TextStyle(
//                         color: baseColor,
//                         fontWeight: pw.FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   pw.Text("Kolathur,Padi Chennai - 600062", style: const pw.TextStyle(
//                     color: _darkColor,
//
//                     fontSize: 13,
//                   ),),
//                   pw.Text("Call: +91 770880963",style: const pw.TextStyle(
//                     color: _darkColor,
//
//                     fontSize: 13,
//                   ),),
//                   /*  pw.Container(
//                     decoration: pw.BoxDecoration(
//                       borderRadius:
//                       const pw.BorderRadius.all(pw.Radius.circular(2)),
//                       color: accentColor,
//                     ),
//                     padding: const pw.EdgeInsets.only(
//                         left: 40, top: 10, bottom: 10, right: 20),
//                     alignment: pw.Alignment.centerLeft,
//                     height: 50,
//                     child: pw.DefaultTextStyle(
//                       style: pw.TextStyle(
//                         color: _accentTextColor,
//                         fontSize: 12,
//                       ),
//                       child: pw.GridView(
//                         crossAxisCount: 2,
//                         children: [
//                           pw.Text('Invoice #'),
//                           pw.Text(invoiceNumber),
//                           pw.Text('Date:'),
//                           pw.Text(_formatDate(DateTime.now())),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                  */
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//         if (context.pageNumber > 1) pw.SizedBox(height: 20)
//       ],
//     );
//   }
//
//   pw.Widget _buildFooter(pw.Context context) {
//     return pw.Row(
//       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: pw.CrossAxisAlignment.end,
//       children: [
//
//         pw.Text(
//           'Page ${context.pageNumber}/${context.pagesCount}',
//           style: const pw.TextStyle(
//             fontSize: 12,
//             color: PdfColors.white,
//           ),
//         ),
//       ],
//     );
//   }
//
//   pw.PageTheme _buildTheme(
//       PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
//     return pw.PageTheme(
//       pageFormat: pageFormat,
//       theme: pw.ThemeData.withFont(
//         base: base,
//         bold: bold,
//         italic: italic,
//       ),
//       buildBackground: (context) => pw.FullPage(
//         ignoreMargins: true,
//         child: pw.SvgImage(svg: _bgShape!),
//       ),
//     );
//   }
//
//   pw.Widget _contentHeader(pw.Context context) {
//     return pw.Row(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//
//         pw.Expanded(
//           child: pw.Row(
//             children: [
//               pw.Container(
//                 margin: const pw.EdgeInsets.only(left: 10, right: 10),
//                 height: 70,
//                 child: pw.Text(
//                   'Invoice to:',
//                   style: pw.TextStyle(
//                     color: _darkColor,
//                     fontWeight: pw.FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               pw.Expanded(
//                 child: pw.Container(
//                   height: 70,
//                   child: pw.RichText(
//                       text: pw.TextSpan(
//                           text: '$customerName\n',
//                           style: pw.TextStyle(
//                             color: _darkColor,
//                             fontWeight: pw.FontWeight.bold,
//                             fontSize: 12,
//                           ),
//                           children: [
//                             const pw.TextSpan(
//                               text: '\n',
//                               style: pw.TextStyle(
//                                 fontSize: 5,
//                               ),
//                             ),
//                             pw.TextSpan(
//                               text: customerAddress,
//                               style: pw.TextStyle(
//                                 fontWeight: pw.FontWeight.normal,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ])),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   pw.Widget _contentFooter(pw.Context context) {
//     return pw.Row(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Expanded(
//           flex: 2,
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//
//               pw.Container(
//                 margin: const pw.EdgeInsets.only(top: 20, bottom: 8),
//                 child: pw.Text(
//                   'Payment Info:',
//                   style: pw.TextStyle(
//                     color: baseColor,
//                     fontWeight: pw.FontWeight.bold,
//                   ),
//                 ),
//               ),
//
//               pw.Text(
//                 paymentInfo,
//                 style: const pw.TextStyle(
//                   fontSize: 8,
//                   lineSpacing: 5,
//                   color: _darkColor,
//                 ),
//               ),
//               pw.SizedBox(height: 30),
//               pw.Text(
//                 'Thank you',
//                 style: pw.TextStyle(
//                   color: _darkColor,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         pw.Expanded(
//           flex: 1,
//           child: pw.DefaultTextStyle(
//             style: const pw.TextStyle(
//               fontSize: 10,
//               color: _darkColor,
//             ),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//
//
//                 pw.DefaultTextStyle(
//                   style: pw.TextStyle(
//                     color: baseColor,
//                     fontSize: 14,
//                     fontWeight: pw.FontWeight.bold,
//                   ),
//                   child: pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     children: [
//                       pw.Text('Total:'),
//                       //pw.Text(_formatCurrency()),
//                       pw.Text(""),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//
//   pw.Widget _contentTable(pw.Context context) {
//     const tableHeaders = [
//       'Si.NO',
//       'Item Description',
//       'Price',
//       'Quantity',
//       'Total'
//     ];
//
//
//
//     return pw.TableHelper.fromTextArray(
//       border: null,
//       cellAlignment: pw.Alignment.centerLeft,
//       headerDecoration: pw.BoxDecoration(
//         borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
//         color: baseColor,
//       ),
//       headerHeight: 25,
//       cellHeight: 40,
//       cellAlignments: {
//         0: pw.Alignment.centerLeft,
//         1: pw.Alignment.centerLeft,
//         2: pw.Alignment.centerRight,
//         3: pw.Alignment.center,
//         4: pw.Alignment.centerRight,
//       },
//       headerStyle: pw.TextStyle(
//         color: _baseTextColor,
//         fontSize: 10,
//         fontWeight: pw.FontWeight.bold,
//       ),
//       cellStyle: const pw.TextStyle(
//         color: _darkColor,
//         fontSize: 10,
//       ),
//       rowDecoration: pw.BoxDecoration(
//         border: pw.Border(
//           bottom: pw.BorderSide(
//             color: accentColor,
//             width: .5,
//           ),
//         ),
//       ),
//       headers: List<String>.generate(
//         tableHeaders.length,
//             (col) => tableHeaders[col],
//       ),
//       data: List<List<String>>.generate(products.length, (row) =>
//       List<String>.generate(tableHeaders.length, (col) => products[row].getIndex(col),),
//       ),
//     );
//   }
// }
//
//
//
//
// String _formatCurrency(double amount) {
//   return 'Rs ${amount.toStringAsFixed(2)}';
// }
//
// String _formatDate(DateTime date) {
//   final format = DateFormat.yMMMd('en_US');
//   return format.format(date);
// }
//
// class Product {
//   const Product(
//       this.sku,
//       this.Usename,
//       this.Userage,
//       this.YearlyTerm,
//       this.HalflyTerm,
//       this.QuvatalyTerm,
//       this.MonthlyTerm,
//       this.Termvalue,
//       );
//
//   final String sku;
//   final String Usename;
//   final String Termvalue;
//   final String Userage;
//   final String YearlyTerm;
//   final String HalflyTerm;
//   final String QuvatalyTerm;
//   final String MonthlyTerm;
//
//
//
//   String getIndex(int index) {
//     switch (index) {
//       case 0:
//         return sku;
//       case 1:
//         return YearlyTerm;
//       case 2:
//         return HalflyTerm;
//       case 3:
//         return QuvatalyTerm;
//       case 4:
//         return MonthlyTerm;
//       case 5:
//         return Termvalue;
//
//     }
//     return '';
//   }
// }
