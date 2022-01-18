import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _messageStreamController =
      StreamController.broadcast();

  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('MEssage: ${message.messageId}');
    _messageStreamController.add(message.data['producto'] ?? 'no data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('MEssage: ${message.messageId}');
    _messageStreamController.add(message.data['producto'] ?? 'no data');
  }

  static Future _onOpenAppHandler(RemoteMessage message) async {
    print('MEssage: ${message.messageId}');
    _messageStreamController.add(message.data['producto'] ?? 'no data');
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    FirebaseMessaging.onMessage.listen(_onMessageHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenAppHandler);

    //Local notifications
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
