// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lawdrafting/MainScreens/DaraftPart2.dart';
import 'package:lawdrafting/Model/GeneralAttorny.dart';

import '../Utils/DialogTools.dart';

class SpecialPowerAttorny extends StatefulWidget {
  const SpecialPowerAttorny({Key? key}) : super(key: key);

  @override
  State<SpecialPowerAttorny> createState() => _SpecialPowerAttornyState();
}

class _SpecialPowerAttornyState extends State<SpecialPowerAttorny> {
  TextEditingController attornyNameController = TextEditingController();
  TextEditingController attornyFatherNameController = TextEditingController();
  TextEditingController attornyCastController = TextEditingController();
  TextEditingController attornyLocationController = TextEditingController();
  TextEditingController attornyTahseelController = TextEditingController();
  TextEditingController attornyDistrictController = TextEditingController();
  TextEditingController attornyIDController = TextEditingController();
  TextEditingController khataNoController = TextEditingController();
  TextEditingController khatooniNoController = TextEditingController();
  TextEditingController nambratController = TextEditingController();
  TextEditingController katatController = TextEditingController();
  TextEditingController muntqilaController = TextEditingController();
  TextEditingController totalAreaController = TextEditingController();
  TextEditingController totalTransferAreaController = TextEditingController();
  TextEditingController loatedAtController = TextEditingController();
  TextEditingController locationTahseelController = TextEditingController();
  TextEditingController locationDistrictController = TextEditingController();
  TextEditingController executerNameController = TextEditingController();
  TextEditingController executerFatherNameController = TextEditingController();
  TextEditingController executerCastController = TextEditingController();
  TextEditingController executerLocationController = TextEditingController();
  TextEditingController executerTahseelController = TextEditingController();
  TextEditingController executerDistrictController = TextEditingController();

  void detailSaveAndPasstoNextScreen() {
    if (attornyNameController.text.isEmpty ||
        attornyFatherNameController.text.isEmpty ||
        attornyCastController.text.isEmpty ||
        attornyLocationController.text.isEmpty ||
        attornyTahseelController.text.isEmpty ||
        attornyDistrictController.text.isEmpty ||
        attornyIDController.text.isEmpty ||
        khataNoController.text.isEmpty ||
        khatooniNoController.text.isEmpty ||
        nambratController.text.isEmpty ||
        katatController.text.isEmpty ||
        muntqilaController.text.isEmpty ||
        totalAreaController.text.isEmpty ||
        totalTransferAreaController.text.isEmpty ||
        locationTahseelController.text.isEmpty ||
        locationDistrictController.text.isEmpty ||
        executerNameController.text.isEmpty ||
        executerFatherNameController.text.isEmpty ||
        executerCastController.text.isEmpty ||
        executerLocationController.text.isEmpty ||
        executerTahseelController.text.isEmpty ||
        executerDistrictController.text.isEmpty) {
      DialogTools.alertDialg(
          'ٹھیک ہے', '.براےٰ مھر با نی ساری تفصیلات مکمل کریں', '', context);

      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DaraftPart2(
                  title: 'مختار خاص',
                  savedDetail: getAttornyDetail(),
                  isForNormal: false,
                )));
  }

  GeneralAttorny getAttornyDetail() {
    GeneralAttorny attornyDetail = GeneralAttorny();
    attornyDetail.ownerName = attornyNameController.text;
    attornyDetail.ownerFatherName = attornyFatherNameController.text;
    attornyDetail.ownerCast = attornyCastController.text;
    attornyDetail.ownerLocation = attornyLocationController.text;
    attornyDetail.ownerTahseel = attornyTahseelController.text;
    attornyDetail.ownerDistrict = attornyDistrictController.text;
    attornyDetail.ownerIDCardNo = attornyIDController.text;
    attornyDetail.khataNo = khataNoController.text;
    attornyDetail.khatoniNo = khatooniNoController.text;
    attornyDetail.nambratKhasra = nambratController.text;
    attornyDetail.katat = katatController.text;
    attornyDetail.currentLocation = loatedAtController.text;
    attornyDetail.totalArea = totalAreaController.text;
    attornyDetail.totalTransferArea = totalTransferAreaController.text;
    attornyDetail.areaTransfer = muntqilaController.text;
    attornyDetail.locationTahseel = locationTahseelController.text;
    attornyDetail.locationDistrict = locationDistrictController.text;
    attornyDetail.executerName = executerNameController.text;
    attornyDetail.executerFatherName = executerFatherNameController.text;
    attornyDetail.executerCast = executerCastController.text;
    attornyDetail.executerLocation = executerLocationController.text;
    attornyDetail.executerTahseel = executerTahseelController.text;
    attornyDetail.executerDistrict = executerDistrictController.text;

    return attornyDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مختار نامہ خاص'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک کا نام',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyFatherNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک والد نام',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyCastController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک کی قوم',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyLocationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'سکنہ',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyTahseelController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک  کی تحصیل',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyDistrictController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک  کا ضلع',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: attornyIDController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مالک کا شناختی کارڈ نمبر',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: khataNoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'کھاتا نمبر',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: khatooniNoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'کھتونی نمبر',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: nambratController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'نمبرات خسرہ',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: katatController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'قطعات',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: muntqilaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'حصہ منتقلع',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: totalAreaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'کل رقبہ',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: totalTransferAreaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'رقبہ بقدر منتقلہ',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: loatedAtController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'واقع  موضع',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: locationTahseelController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'جگہ کی تحصیل',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: locationDistrictController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'جگہ کا ضلع',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مختار خاص کا نام',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerFatherNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مختار خاص والد نام',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerCastController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' مختار خاص قوم',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerLocationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مختار خاص سکنہ',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerTahseelController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مختار خاص تحصیل',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: executerDistrictController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'مختار خاص ضلع',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ElevatedButton(
                child: const Text('اگلا پیج'), //چیک کریں
                onPressed: () {
                  detailSaveAndPasstoNextScreen();
                },
              )),
        ],
      ),
    );
  }
}
