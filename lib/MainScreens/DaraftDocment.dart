// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state, must_be_immutable, unused_local_variable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lawdrafting/MainScreens/PDF/PdfReport.dart';
import 'package:lawdrafting/Model/GeneralAttorny.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:lawdrafting/Utils/PixelTools.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:share_plus/share_plus.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
// import 'package:dio/dio.dart';
// import 'package:lawdrafting/EmilyNewtworkService/NetworkSerivce.dart';

class DaraftDocument extends StatefulWidget {
  late GeneralAttorny generalAttorny;
  late String doctitle;
  late List<File?> selectedImagesFiles = [];
  late bool isForNormal;
  late File? GarhindaImageFile;
  late File? GwahShudImageFile;
  late File? ShinakhtKnindaImageFile;

  DaraftDocument({
    Key? key,
    required this.generalAttorny,
    required this.doctitle,
    required this.selectedImagesFiles,
    required this.isForNormal,
    required this.GarhindaImageFile,
    required this.GwahShudImageFile,
    required this.ShinakhtKnindaImageFile,
  }) : super(key: key);

  @override
  State<DaraftDocument> createState() =>
      _DaraftDocumentState(generalAttornyDetail: generalAttorny);
}

class _DaraftDocumentState extends State<DaraftDocument> {
  late GeneralAttorny generalAttornyDetail;
  _DaraftDocumentState({required this.generalAttornyDetail});

  Widget documentContent() {
    return ListView(children: [
      Text(
        widget.doctitle,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      SizedBox(
        height: 10,
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Text(
              widget.isForNormal ? mukhtareAam() : mukhtareKhas(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('العبد اختیار دہندہ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('گواہ نمبر 1'),
                  ],
                ),
                SizedBox(
                  width: 70,
                ),
                Column(
                  children: [
                    Text(
                      ' العبد اختیار گرہندہ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text('گواہ نمبر 2'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    ]);
  }

  String mukhtareAam() {
    String text =
        'منکہ/مایانکہ ${widget.generalAttorny.ownerName} (من مقر/مامقران )اقرار معتبر بقائمی ہوش وحواس بلا جبرو اکراہ برضا مندی خود تحریر کیے دیتی ہوں /کئے دیتاہوں /کئے دیتے ہیں کہ میرا /ہمارا رقبہ تعدادی ${widget.generalAttorny.totalArea} بمطابق ${generalAttornyDetail.khataNo} کھتونی نمبر ${generalAttornyDetail.khatoniNo} نمبرات خسرہ ${generalAttornyDetail.nambratKhasra} قطعات ${generalAttornyDetail.katat} حصہ منتقلعہ  ${generalAttornyDetail.areaTransfer} میں ہے ۔ کا انتظام و انصرام کرنےسے قاصر ہیں لہذا میں /ہم اپنی جانب سے مسمی ${generalAttornyDetail.executerName} ولد ${generalAttornyDetail.executerFatherName} قوم ${generalAttornyDetail.executerCast} سکنہ ${generalAttornyDetail.executerLocation} تحصیل ${generalAttornyDetail.executerTahseel} ضلع ${generalAttornyDetail.executerDistrict} کو اپنا  مختارعام مقرر کرکے اختیار دیتی /دیتا/دیتے ہیں کہ  مختار موصوف میری /ہماری جانب سے رقبہ مذکور بالا کا انتظام و انصرام کرے دیکھ بھال کرے بیع کرے زربیعانہ زربیع وصول کرے رسید دیوے ہر قسم کا اقرار کرے ہر قسمی اقرار نامہ تحریر کرواے متبادل پراپرٹی حاصل کرے نشاندہی کرواے نقشہ پاس کرواے زبانی یا ں تحریری بیان دیوے درخواست ہر قسم کی گزارے زبانی یا تحریری بیان حلفی دیوے کسی اتھارٹی کے روبرو پیش ہووے ضمانت نامہ داخل کرے کنیکشن ٹیلی فون و بجلی وغیرہ حاصل کرے مختار خاص مقرر کرے لین دین کرکے اشٹام خریدے رقم ریفنڈ کرواے رقم ریفنڈ وصول کرے رقبہ مذکور رہن رکھ کر زرعی ترقیاتی بنک آف پاکستان و ہر قسمی بنک لمیٹڈ سے قرضہ حاصل کرے چیک وصول کرے چیک کیش کرواے کسی قسم کی دستاویز کی تکمیل کراے یا تکمیل کرے جس کے نام چاہے انتقال کرے یا ٹرانسفر کرے رقبہ مذکور خود کاشت کرے مزارع پر دیوے چھمک پر دیوے ٹھیکہ پر دیوے اگر کوئی تناذعہ مقدمہ رٹ اپیل یا دعوی رونما ہوتو ہر عدالت میں ابتدا سے لیکر انتہا تک جس کی پیروی کرے اور بغرض پیروی کوئی وکیل یا بیرسٹر مقرر کرے ان کا محنتانہ دے اسکی تصدیق کرے کوئی عرضی دعوی یابیان تحریر ی یا دیگر دستاویزات پر منجانب میرے /ہمارے دستخط کرے یا تصدیق کرے یا کوئی سوال و جواب کرے ثالث مقرر کرے تصفیہ کرے دستبرداری اختیار کرے الغرض جملہ مقدمات جن میں میں /ہم فریق ہوں بعدالت ہاے مال فوجداری و دیوانی تابہ بعدالت العالیہ ہائیکورٹ و صاحبان بورڈ محکمہ جات ڈاک خانہ ریلوے وآبکاری و نہر متعلقہ اتھارٹی کے روبرو حاضر ہو کر ہر قسم کی کاروائی ہاے ضروری عمل میں لاے علاوہ ازیں میری /ہماری جانب سے کسی بھی سرکاری یا پرائیویٹ ادارے میں جملہ امور سر انجام دے تو وہ سب ساختہ پرداختہ مختار موصوف کا مثل کردہ زات خاص اپنی کے مجھ کو /ہم کو قبول و منظور ہے ۔ ${'\nپس مختار نامہ عام لکھ دیا ہے تاکہ سند رہے اور عندالضرورت کام آوے ۔'} پس مختار نامہ عام لکھ دیا ہے تاکہ سند رہے اور عندالضرورت کام آوے ۔';
    return text;
  }

  String mukhtareKhas() {
    //String text2 = 'منکہ ${generalAttornyDetail.ownerName} ولد ${generalAttornyDetail.ownerFatherName} قوم ${generalAttornyDetail.ownerCast} سکنہ ${generalAttornyDetail.ownerLocation} تحصیل ${generalAttornyDetail.ownerTahseel} حامل شناختی کارڈ نمبر ${generalAttornyDetail.ownerIDCardNo} (مقرام) اقرار معتبر برضا مندی خود بقائمی ہوش و حواس بلا جبرو اکراہ بحالت صحت نفس و ثبات عقل اس طور پر کرکے تحریر کر دیتا ہونکہ ایک نالش نمبر ۔۔۔۔۔۔۔۔۔ سال ۔۔۔۔۔۔ بعدالت جناب ۔۔۔۔۔۔۔۔۔۔۔۔۔۔۔ میں ۔۔۔۔۔۔۔۔۔۔ ولد۔۔۔۔۔۔۔قوم ۔۔۔۔۔۔۔۔۔۔ سکنہ۔۔۔۔۔۔۔۔۔ کے برخلاف دائر ہے جس کی من مقر عدیم الفرصتی کی وجہ سے پیروی کرنے سے اصالتا قاصر ہوں لہذا مقر اپنی جانب سے ۔۔۔۔۔۔۔۔۔۔۔۔ ولد ۔۔۔۔۔۔۔۔۔۔قوم ۔۔۔۔۔۔۔۔ ضلع ۔۔۔۔۔۔۔۔ حامل شناختی کارڈ ۔۔۔۔۔۔۔۔۔۔۔۔۔۔ کو اپنا  مختار خاص مقرر کر کے اختیار دیتا ہوں کہ نالش مذکور میں مختار مذکور مقر کی جانب سے کسی وکیل کو براے پیروی مقدمہ مقرر کرے  اور جواب دعوی داخل کرے ۔ بیان تحریری پر مقر کی جانب سے تصدیق کرے اس کو داخل عدالت کرے کاغذات یا دیگر ثبوت تحریری و زبانی طلب کراے دستاویزات پیش عدالت کرے یا واپس لے صلح کرے ،راضی نامہ کرے ، دستبرداری نامہ یا باز دعوی دے یا معاملہ سپرد ثالث کرے اجراے ڈگری کراے روپیہ مقر کی جانب سے وصول کرے اور اس کی رسیدات دے غرضیکہ مقدمہ کی پیروی میں ہر قسم کی کاروائی کرے جملہ ساختہ و پر داختہ مختار موصوف مثل کردہ ذات خاص خود کے منظور و قبول ہوگا ،پس یہ مختار نامہ خاص تحریر کردیا ہے تاکہ سند رہے اور عند الضرورت کام آوے ۔';
    String text =
        'منکہ ${generalAttornyDetail.ownerName} والد ${generalAttornyDetail.ownerFatherName} قوم ${generalAttornyDetail.ownerCast} سکنہ ${generalAttornyDetail.ownerLocation} تحصیل ${generalAttornyDetail.ownerTahseel} ضلع ${generalAttornyDetail.ownerDistrict} حامل شناختی کارڈ نمبر ${generalAttornyDetail.ownerIDCardNo} کا ہو جو کہ من مقر اپنی ملکیتی و مقبو ضہ اراضی سکنی بمطابق کھاتہ نمبر ${generalAttornyDetail.khataNo} کھتونی نمبر ${generalAttornyDetail.khatoniNo} نمبرات خسرہ ${generalAttornyDetail.nambratKhasra} قطعات ${generalAttornyDetail.katat} حصہ منتقلعہ  ${generalAttornyDetail.areaTransfer}کل رقبہ ${generalAttornyDetail.totalArea} رقبہ بقدر منتقلہ ${generalAttornyDetail.totalTransferArea} واقع مو ضع ${generalAttornyDetail.currentLocation} تحصیل ${generalAttornyDetail.locationTahseel} ضلع ${generalAttornyDetail.locationDistrict} فروخت کرنیکا خواہشمند ہے اور مقر بوجہ مصروفیت  کارو بار اصالتا رقبہ مذکو رہ بیع نہیں کر سکتا لھذا مقر اپنی جانب سے  ${generalAttornyDetail.executerName} ولد ${generalAttornyDetail.executerFatherName} قوم ${generalAttornyDetail.executerCast} سکنہ ${generalAttornyDetail.executerLocation}  تحصیل ${generalAttornyDetail.executerTahseel}  ضلع ${generalAttornyDetail.executerDistrict} کو مختار خاص مقرر کر کے حسب ذیل اختیارات دیتا ہے${'\n 1:یہ کہ مختار خاص مذکور من مقرکی جانب سے دفتر سب رجسٹرار میں بیع نامہ مذکور بغرض رجسٹری پیش کرے\n 2:یہ کہ میری جانب سے اس کی رجسٹڑی کرواے\n 3:یہ کہ بغرض رجسٹری دستاویزمذکور جو دیگر کام کرنے ضروری ہوں کرے\n 4:یہ کہ جائیداد مذکور مناسب و معقول قیمت پر فروخت کرے اور حاصل شدہ قیمت وصول کرے یا میرے کسی اکاونٹ نمبر ۔۔۔۔۔۔۔۔۔بینک ۔۔۔۔۔۔۔ برانچ میں جمع کرواے پ'}';
    return text;
  }

  Widget imagesHandlingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  'گرہندہ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.file(
                    widget.GarhindaImageFile!,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "CNIC:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Signature:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'گواہ شد',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.file(
                        widget.GwahShudImageFile!,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "CNIC:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Signature:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  'شناخت کنندہ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.file(
                    widget.ShinakhtKnindaImageFile!,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "CNIC:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Signature:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '  دہندہ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Flexible(
          child: GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (1 / .50),
              children:
                  List.generate(widget.selectedImagesFiles.length, (index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.file(
                          widget.selectedImagesFiles[index]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "CNIC:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Signature:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }

  Widget swiperWidget() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return index == 0 ? documentContent() : imagesHandlingWidget();
      },
      itemCount: 2,
      itemHeight: MediaQuery.of(context).size.height,
      itemWidth: PixelTools.screenWidth,
      loop: false,
      onTap: (index) {},
      pagination: SwiperPagination(
          margin: EdgeInsets.all(0.0),
          builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return ConstrainedBox(
              child: Container(
                  color: Colors.white,
                  child: Text(
                    "${config.activeIndex + 1}/${config.itemCount}",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  )),
              constraints: BoxConstraints.expand(height: 20.0),
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
              icon: Icon(Icons.share_sharp),
              onPressed: () {
                shareOption();
              })
        ],
      ),
      body: Container(
          // color: Colors.orangeAccent.shade200,
          padding: EdgeInsets.all(20),
          child: swiperWidget()),
    );
  }

  shareOption() {
    showAdaptiveActionSheet(
      context: context,
      title: const Text('Share Via'),
      androidBorderRadius: 30,
      actions: <BottomSheetAction>[
        BottomSheetAction(
            title: const Text('Email'),
            onPressed: () {
              shareViaEmail();
              Navigator.pop(context);
            }),
        BottomSheetAction(
            title: const Text('Whats App'),
            onPressed: () {
              shareViaWhatsAPP();
              Navigator.pop(context);
            }),
      ],
      cancelAction: CancelAction(
          title: const Text(
              'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  /*Future payment() async {
    Response response;
    HttpService http = HttpService();

    Map<String, dynamic> headers = {
      "Authorization": "Bearer REPLACE_BEARER_TOKEN",
      "Credentials": "REPLACE_THIS_VALUE",
      "Signature": "REPLACE_THIS_VALUE",
      "Client-Id": "REPLACE_THIS_VALUE",
      "Request-Time": "REPLACE_THIS_VALUE",
      "Access-Token": "REPLACE_THIS_VALUE",
      "content-type": "application/json",
      "accept": "application/json"
    };
    Map<String, dynamic> parameters = {
      "merchantID": "447564214173696",
      "appID": "4757928170040576",
      "paymentAmount": {"currency": "COP", "value": "56.06"},
      "paymentOrderID": "4223167392382976",
      "paymentOrderTitle": "togmu",
      "productCode": "jica",
      "paymentMethods": "vidogcajfababb",
      "paymentAuthCode": "wahoolgenkebit",
      "paymentMode": "nopmacmesjas",
      "paymentFactor": "lobraodcizw",
      "paymentExpiryTime": "06/2032",
      "paymentReturnUrl": "http://boisavoj.vc/gooru",
      "paymentNotifyUrl": "http://sagajim.lu/mejfu",
      "merchantCategoryCode": "fofik",
      "extendInfo": "juwruplirfohupee",
      "envInfo": {
        "terminalType": "ilikifenhahnuag",
        "osType": "polimugumozwuv",
        "userAgent":
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36",
        "deviceTokenId":
            "552f990b7fd1da4abbcaffa63e54524be8f31bcccd5a6682aca065ceb34c4ed2",
        "clientIp": "25.127.36.156",
        "cookieId": "4540093868015616",
        "storeTerminalId": "5798557206446080",
        "storeTerminalRequestTime": "10:70",
        "extendInfo": "merikn"
      }
    };

    String path =
        'https://api.eu-de.apiconnect.appdomain.cloud/easypaisaapigw-telenorbankpk-tmbdev/dev-catalog/miniapp/payments/createPayment';

    try {
      response = await http.postRequest(path, parameters, context);
      if (response.statusCode == 200) {
        debugPrint("$response");
      } else {
        debugPrint('some thing went wrong');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }*/

  /** 
  * An event listener to start card entry flow
  */
  Future<void> _onStartCardEntryFlow() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  /**
  * Callback when card entry is cancelled and UI is closed
  */
  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  /**
  * Callback when successfully get the card nonce details for processig
  * card entry is still open and waiting for processing card nonce details
  */
  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);

      // payment finished successfully
      // you must call this method to close card entry
      // this ONLY apply to startCardEntryFlow, please don't call this method when use startCardEntryFlowWithBuyerVerification
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on Exception catch (ex) {
      // payment failed to complete due to error
      // notify card entry to show processing error
      InAppPayments.showCardNonceProcessingError('Sorry! Payment not done');
    }
  }

  /**
  * Callback when the card entry is closed after call 'completeCardEntry'
  */
  void _onCardEntryComplete() {
    // Update UI to notify user that the payment flow is finished successfully
  }

  shareViaEmail() async {
    String filePath = await reportView(
        context,
        widget.doctitle,
        mukhtareAam(),
        widget.selectedImagesFiles,
        widget.GarhindaImageFile,
        widget.GwahShudImageFile,
        widget.ShinakhtKnindaImageFile);

    final Email email = Email(
      body: '',
      subject: 'Law Draft',
      recipients: [''],
      cc: [],
      bcc: [],
      attachmentPaths: [filePath],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  shareViaWhatsAPP() async {
    String filePath = await reportView(
        context,
        widget.doctitle,
        mukhtareAam(),
        widget.selectedImagesFiles,
        widget.GarhindaImageFile,
        widget.GwahShudImageFile,
        widget.ShinakhtKnindaImageFile);

    Share.shareFiles([filePath], text: widget.doctitle);
  }
}
