// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawdrafting/MainScreens/DaraftDocment.dart';
import 'package:lawdrafting/Model/GeneralAttorny.dart';
import 'package:lawdrafting/Utils/ColorTools.dart';
import 'package:lawdrafting/Utils/DialogTools.dart';

class DaraftPart2 extends StatefulWidget {
  GeneralAttorny savedDetail;
  DaraftPart2(
      {Key? key,
      this.title,
      required this.savedDetail,
      required this.isForNormal})
      : super(key: key);
  final String? title;
  late bool isForNormal;
  @override
  State<DaraftPart2> createState() => _DaraftPart2State();
}

class _DaraftPart2State extends State<DaraftPart2> {
  /// Variables
  List<File?> imageFiles = [];
  File? GarhindaImageFile;
  File? GwahShudImageFile;
  File? ShinakhtKnindaImageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Color(ColorTools.primaryColor),
                    onPressed: () {
                      takeImageOption(false);
                    },
                    child: Text(
                      "PICK FROM GALLERY",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  MaterialButton(
                    color: Color(ColorTools.primaryColor),
                    onPressed: () {
                      takeImageOption(true);
                    },
                    child: Text(
                      "PICK FROM CAMERA",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                if (GarhindaImageFile != null)
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'گرہندہ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.file(
                            GarhindaImageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                if (GwahShudImageFile != null)
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'گواہ شد',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.file(
                            GwahShudImageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (ShinakhtKnindaImageFile != null)
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'شناخت کنندہ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.file(
                            ShinakhtKnindaImageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 10,
            ),
            if (imageFiles.length > 0)
              Text(
                '  دہندہ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            Expanded(
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(imageFiles.length, (index) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Image.file(
                            imageFiles[index]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }))),
            if (GarhindaImageFile != null &&
                GwahShudImageFile != null &&
                ShinakhtKnindaImageFile != null &&
                imageFiles.isNotEmpty)
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
                    child: const Text('اگلا پیج'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaraftDocument(
                                    generalAttorny: widget.savedDetail,
                                    doctitle: widget.title.toString(),
                                    selectedImagesFiles: imageFiles,
                                    isForNormal: widget.isForNormal,
                                    GarhindaImageFile: GarhindaImageFile!,
                                    GwahShudImageFile: GwahShudImageFile!,
                                    ShinakhtKnindaImageFile:
                                        ShinakhtKnindaImageFile!,
                                  )));
                    },
                  )),
          ],
        ));
  }

  moveToNextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DaraftDocument(
                  generalAttorny: widget.savedDetail,
                  doctitle: widget.title.toString(),
                  selectedImagesFiles: imageFiles,
                  isForNormal: widget.isForNormal,
                  GarhindaImageFile: GarhindaImageFile!,
                  GwahShudImageFile: GwahShudImageFile!,
                  ShinakhtKnindaImageFile: ShinakhtKnindaImageFile!,
                )));
  }

  takeImageOption(bool isFromCamera) {
    showAdaptiveActionSheet(
      context: context,
      title: const Text('Select Image'),
      androidBorderRadius: 30,
      actions: <BottomSheetAction>[
        BottomSheetAction(
            title: const Text('گرہندہ'),
            onPressed: () {
              Navigator.pop(context);
              if (isFromCamera) {
                _getFromCamera(true, false, false, false);
              } else {
                _getFromGallery(true, false, false, false);
              }
            }),
        BottomSheetAction(
            title: const Text('گواہ شد'),
            onPressed: () {
              Navigator.pop(context);
              if (isFromCamera) {
                _getFromCamera(false, true, false, false);
              } else {
                _getFromGallery(false, true, false, false);
              }
            }),
        BottomSheetAction(
            title: const Text('شناخت کنندہ'),
            onPressed: () {
              Navigator.pop(context);
              if (isFromCamera) {
                _getFromCamera(false, false, true, false);
              } else {
                _getFromGallery(false, false, true, false);
              }
            }),
        BottomSheetAction(
            title: const Text('دہندہ'),
            onPressed: () {
              Navigator.pop(context);
              if (isFromCamera) {
                _getFromCamera(false, false, false, true);
              } else {
                _getFromGallery(false, false, false, true);
              }
            }),
      ],
      cancelAction: CancelAction(
          title: const Text(
              'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  /// Get from gallery
  _getFromGallery(bool isForGawinda, bool isForGwahShud,
      bool isForShinakhtKninda, bool isForDhinda) async {
    if (isForDhinda && imageFiles.length >= 5) {
      DialogTools.alertDialg(
          'OK', 'You have reached at the limit of images.', '', context);
      return;
    }

    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
    );
    if (pickedFile != null) {
      setState(() {
        if (isForGawinda) {
          GarhindaImageFile = File(pickedFile.path);
        } else if (isForGwahShud) {
          GwahShudImageFile = File(pickedFile.path);
        } else if (isForShinakhtKninda) {
          ShinakhtKnindaImageFile = File(pickedFile.path);
        } else if (isForDhinda) {
          imageFiles.add(File(pickedFile.path));
        }
      });
    }
  }

  /// Get from Camera
  _getFromCamera(bool isForGawinda, bool isForGwahShud,
      bool isForShinakhtKninda, bool isForDhinda) async {
    if (isForDhinda && imageFiles.length >= 5) {
      DialogTools.alertDialg(
          'OK', 'You have reached at the limit of images.', '', context);
      return;
    }
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        if (isForGawinda) {
          GarhindaImageFile = File(pickedFile.path);
        } else if (isForGwahShud) {
          GwahShudImageFile = File(pickedFile.path);
        } else if (isForShinakhtKninda) {
          ShinakhtKnindaImageFile = File(pickedFile.path);
        } else if (isForDhinda) {
          imageFiles.add(File(pickedFile.path));
        }
      });
    }
  }
}
