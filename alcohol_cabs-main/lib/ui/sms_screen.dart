import 'dart:io';

import 'package:alcohol_cabs/services/sms_cab_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';

class SmsReaderScreen extends StatefulWidget {
  var final_user_doc;
  SmsReaderScreen(this.final_user_doc);

  @override
  State<SmsReaderScreen> createState() => _SmsReaderScreenState();
}

class _SmsReaderScreenState extends State<SmsReaderScreen> {
  late List _allMessages;

  @override
  void initState() {
    super.initState();

    getAllMessages();
  }

  Future getAllMessages() async {
    await [Permission.sms].request();
    var permission = await Permission.sms.status;
    print(permission.isGranted);
    if (permission.isGranted) {
      SmsQuery query = SmsQuery();

      List<SmsMessage> finalmessages = await query
          .querySms(kinds: [SmsQueryKind.inbox], address: "+918169131878");

      print("Total Messages : " + finalmessages.length.toString());
      print(finalmessages);

      if (finalmessages.length > 0) {
        String msg = finalmessages[0].body ??
            "Pls Track my location, I am traveling by a cab";
        sendSMSansBookCabs(widget.final_user_doc, msg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sms reader"),
      ),
      body: Text("Reading the messages....."),
    );
  }
}
