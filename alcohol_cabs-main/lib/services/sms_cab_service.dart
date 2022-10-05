import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

Future<void> sendSMSansBookCabs(var snapshot , String message ) async {
  print("sending sms");
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: 'AC54f0a584ce5b6b2dcdc9dd9444dfde54',
      authToken: '86b2ad523d5b283c162f2f0fa39993ea',
      twilioNumber: '+13082176979');

  
      
  twilioFlutter.sendSMS(toNumber: snapshot.data['emergencyContact1'], messageBody: message);
  twilioFlutter.sendSMS(toNumber: snapshot.data['emergencyContact2'], messageBody: message);
  twilioFlutter.sendSMS(toNumber: snapshot.data['emergencyContact3'], messageBody: message);

  await LaunchApp.openApp(
    androidPackageName: 'com.ubercab',
    iosUrlScheme: 'uber://',
    appStoreLink: 'https://apps.apple.com/in/app/uber/id368677368',
    // openStore: false
  );

//  String uber = 'https://m.uber.com/ul/?client_id=DD1leP4UkF1Jbo67_FSAnowm32GC8gBH&action=setPickup&pickup[latitude]=18.9220&pickup[longitude]=72.83478&pickup[nickname]=UberHQ&pickup[formatted_address]=1455%20Market%20St%2C%20San%20Francisco%2C%20CA%2094103&dropoff[latitude]=19.1075&dropoff[longitude]=72.8263&dropoff[nickname]=Coit%20Tower&dropoff[formatted_address]=1%20Telegraph%20Hill%20Blvd%2C%20San%20Francisco%2C%20CA%2094133&product_id=a1111c8c-c720-46c3-8534-2fcdd730040d';

//   String uber_client_id = 'DD1leP4UkF1Jbo67_FSAnowm32GC8gBH' ;
}

// curl -X POST https://api.twilio.com/2010-04-01/Accounts/AC54f0a584ce5b6b2dcdc9dd9444dfde54/Messages.json \
// --data-urlencode "Body=This is the ship that made the Kessel Run in fourteen parsecs?" \
// --data-urlencode "From=+13082176979" \
// --data-urlencode "To=+919810910960" \
// -u AC54f0a584ce5b6b2dcdc9dd9444dfde54:86b2ad523d5b283c162f2f0fa39993ea
