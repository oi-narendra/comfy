import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';

/// Entry point of the application. This is the root widget of the application.
/// Checks if the application is opening for the first time or not.
/// If it is opening for the first time, it will navigate to the onboarding screen.
/// Otherwise, it will check if the user is logged in or not.
/// If the user is logged in, it will navigate to the home screen.
/// Otherwise, it will navigate to the login screen.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    _getMessages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }

  void _getMessages() async {
    await Permission.sms.request().isGranted;
    SmsQuery query = SmsQuery();

    const phone = '1455';
    final messages = await query.querySms(count: 5, address: phone, sort: true);
    debugPrint('Messages: ${messages.map((e) => e.string())}');
  }
}

extension SmsMessageExtension on SmsMessage {
  String string() {
    return 'SmsMessage{body: $body, address: $address, date: $date}\n';
  }

  /// Output
  /// Messages: (SmsMessage{body: 1455 मा कल गर्नुहोस् र नेपाली गीतहरुको सुनी आफ्नो कलर ट्युन बनाउनुहोस् , address: 1455, date: 2022-01-24 12:17:51.082}
  /// , SmsMessage{body: 1455 मा कल गर्नुहोस् र नेपाली गीतहरुको सुनी आफ्नो कलर ट्युन बनाउनुहोस् , address: 1455, date: 2021-12-11 12:17:46.969}
  /// , SmsMessage{body: 1455 मा कल गर्नुहोस् र नेपाली गीतहरुको सुनी आफ्नो कलर ट्युन बनाउनुहोस् , address: 1455, date: 2021-12-01 12:17:46.730}
  ///, SmsMessage{body: सुन्नुहोस् लोकप्रिय गीत हरु अनी बनाउनुहोस् आफ्नो कलर ट्युन, डायल् गर्नुहोस् 1455, अन्य गीत का लागि *1455# थिच्नुहोस् , address: 1455, date: 2021-11-03 12:17:56.611}
  ///, SmsMessage{body: 1455 डायल गर्नुहोस, पेह्लो नम्बरमा गीतको कलर ट्युन बनाउनुहोस् , address: 1455, date: 2021-10-23 12:17:54.025}
  /// )
}
