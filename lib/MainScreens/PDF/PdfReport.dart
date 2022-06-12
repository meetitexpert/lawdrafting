// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
import 'dart:io';
import 'dart:ui';
// import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

File? GarhindaImageFile;
File? GwahShudImageFile;
File? ShinakhtKnindaImageFile;

Future<String> reportView(
    context,
    String title,
    String content,
    List<File?> images,
    File? GarhindaImageFile,
    File? GwahShudImageFile,
    File? ShinakhtKnindaImageFile) async {
  //Create a new PDF document
  PdfDocument document = PdfDocument();
  document.pageSettings.size = PdfPageSize.a4;
//////////////////////////FIRST PAGE//////////////////////////////////
//Adds a page to the document
  PdfPage page = document.pages.add();
  PdfGraphics graphics = page.graphics;

  String dhinda = '\nالعبد اختیار دہن\n\n\n\n\nگواہ نمبر 1';
  String grhinda = '\nالعبد اختیار گرہندہ\n\n\n\n\nگواہ نمبر 2';

//Create a new PDF true type font instance.

  PdfFont titlefont =
      PdfTrueTypeFont(await _readFontData(), 28, style: PdfFontStyle.bold);
  PdfFont font = PdfTrueTypeFont(await _readFontData(), 14);

//Draw text
  graphics.drawString(title, titlefont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 0, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.center,
          paragraphIndent: 35));

//Draw text
  graphics.drawString(content, font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 40, page.getClientSize().width, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.right,
          lineSpacing: 3,
          paragraphIndent: 35));

//Draw text
  graphics.drawString(dhinda, font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(100, 480, page.getClientSize().width / 2,
          page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 35));

//Draw text
  graphics.drawString(grhinda, font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 480, page.getClientSize().width / 2, page.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 35));

//////////////////////////2Nd PAGE//////////////////////////////////
  PdfPage page2 = document.pages.add();
  PdfGraphics graphics2 = page2.graphics;
  //Draw text
  graphics2.drawString('گرہندہ', titlefont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 0, page2.getClientSize().width / 2, page2.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 35));

  //Draw text
  graphics2.drawString('گواہ شد', titlefont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(100, 0, page2.getClientSize().width / 2,
          page2.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.right,
          paragraphIndent: 35));

//Create a PdfGrid class
  PdfGrid grid = PdfGrid();

//Add the columns to the grid
  grid.columns.add(count: 4);
  grid.columns[0].width = 100;
  grid.columns[1].width = 150;
  grid.columns[2].width = 100;
  grid.columns[3].width = 150;

  for (var i = 0; i < 1; i++) {
    if (i == 0) {
      //Muktar Dahinda, Shnakht kninda
      //row 1
      PdfBitmap pBmp =
          PdfBitmap(GarhindaImageFile!.readAsBytesSync()); //Muktar Dahinda,
      //Add rows to grid
      PdfGridRow row = grid.rows.add();

      row.cells[0].style.backgroundImage = pBmp;
      row.height = 100;
      row.cells[1].value = 'Name:\nCNIC:\nSignature:';

      PdfBitmap pBmp2 =
          PdfBitmap(GwahShudImageFile!.readAsBytesSync()); //GWAH Shud
      //Add rows to grid

      row.cells[2].style.backgroundImage = pBmp2;
      row.height = 100;
      row.cells[3].value = 'Name:\nCNIC:\nSignature:';

      //Remove the border from  row
      for (var j = 0; j < 4; j++) {
        grid.rows[i].cells[j].style.borders.bottom = PdfPens.transparent;
        grid.rows[i].cells[j].style.borders.left = PdfPens.transparent;
        grid.rows[i].cells[j].style.borders.right = PdfPens.transparent;
        grid.rows[i].cells[j].style.borders.top = PdfPens.transparent;
      }
    }
  }

  //Set the grid style
  grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 0, top: 0, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: font);

//Draw the grid
  grid.draw(page: page2, bounds: const Rect.fromLTWH(0, 40, 0, 0));

  //Draw text
  graphics2.drawString('شناخت کنندہ', titlefont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 150, page.getClientSize().width / 2, page2.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 35));

  //Create a PdfGrid class
  PdfGrid grid2 = PdfGrid();

//Add the columns to the grid
  grid2.columns.add(count: 4);
  grid2.columns[0].width = 100;
  grid2.columns[1].width = 150;
  grid2.columns[2].width = 100;
  grid2.columns[3].width = 150;

  for (var i = 0; i < 1; i++) {
    //Muktar Dahinda, Shnakht kninda
    //row 1
    PdfBitmap pBmp =
        PdfBitmap(ShinakhtKnindaImageFile!.readAsBytesSync()); //Muktar Dahinda,
    //Add rows to grid
    PdfGridRow row = grid2.rows.add();

    row.cells[0].style.backgroundImage = pBmp;
    row.height = 100;
    row.cells[1].value = 'Name:\nCNIC:\nSignature:';

    //Remove the border from  row
    for (var j = 0; j < 4; j++) {
      grid2.rows[i].cells[j].style.borders.bottom = PdfPens.transparent;
      grid2.rows[i].cells[j].style.borders.left = PdfPens.transparent;
      grid2.rows[i].cells[j].style.borders.right = PdfPens.transparent;
      grid2.rows[i].cells[j].style.borders.top = PdfPens.transparent;
    }
  }

  //Set the grid style
  grid2.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 0, top: 0, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: font);

  //Draw the grid
  grid2.draw(page: page2, bounds: const Rect.fromLTWH(0, 190, 0, 0));

  //Draw text
  graphics2.drawString('دہندہ', titlefont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(
          0, 300, page2.getClientSize().width, page2.getClientSize().height),
      format: PdfStringFormat(
          textDirection: PdfTextDirection.rightToLeft,
          alignment: PdfTextAlignment.left,
          paragraphIndent: 35));

  //Create a PdfGrid class
  PdfGrid grid3 = PdfGrid();

//Add the columns to the grid
  grid3.columns.add(count: 4);
  grid3.columns[0].width = 100;
  grid3.columns[1].width = 150;
  grid3.columns[2].width = 100;
  grid3.columns[3].width = 150;

  var totalRowsForGrhinda = (images.length / 2).ceil();
  int imageIndex = 0;
  for (var i = 0; i < totalRowsForGrhinda; i++) {
    //Add rows to grid
    PdfGridRow row = grid3.rows.add();

    //row 1
    PdfBitmap pBmp =
        PdfBitmap(images[imageIndex]!.readAsBytesSync()); //Muktar Dahinda,
    row.cells[0].style.backgroundImage = pBmp;
    row.height = 120;
    row.cells[1].value = 'Name:\nCNIC:\nSignature:';
    imageIndex++;

    if (imageIndex < images.length) {
      //row 1
      PdfBitmap pBmp2 =
          PdfBitmap(images[imageIndex]!.readAsBytesSync()); //Muktar Dahinda,
      row.cells[2].style.backgroundImage = pBmp2;
      row.height = 120;
      row.cells[3].value = 'Name:\nCNIC:\nSignature:';
      imageIndex++;
    }
    //Remove the border from  row
    for (var j = 0; j < 4; j++) {
      grid3.rows[i].cells[j].style.borders.bottom = PdfPens.transparent;
      grid3.rows[i].cells[j].style.borders.left = PdfPens.transparent;
      grid3.rows[i].cells[j].style.borders.right = PdfPens.transparent;
      grid3.rows[i].cells[j].style.borders.top = PdfPens.transparent;
    }
  }

  //Set the grid style
  grid3.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 5, right: 0, top: 0, bottom: 20),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: font);

  //Draw the grid
  grid3.draw(page: page2, bounds: const Rect.fromLTWH(0, 340, 0, 0));

  //save PDF
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/outPut.pdf';
  final File file = File(path);
  file.writeAsBytesSync(List.from(document.save()));

  return path;
}

Future<List<int>> _readFontData() async {
  final ByteData bytes = await rootBundle.load('assets/fonts/arial.ttf');
  return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
}
