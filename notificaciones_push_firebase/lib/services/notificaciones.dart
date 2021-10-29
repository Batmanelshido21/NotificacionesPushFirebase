//13:F8:D7:E6:0F:EA:D9:C8:24:46:17:3D:5A:4C:C2:86:4E:6B:D4:A9
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ServicioNotificacionPush {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  // ignore: prefer_final_fields
  static StreamController<String> _messageStreamController =
      new StreamController.broadcast();

  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print(message.data);
    _messageStreamController.add(message.data['userId'] ?? 'No hay titulo');
  }

  static Future _messageHandler(RemoteMessage message) async {
    print(message.data);
    print('Message Handler ${message.messageId}');
    _messageStreamController.add(message.data['userId'] ?? 'No hay titulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print(message.data);
    print('On message open App ${message.messageId}');
    _messageStreamController.add(message.data['userId'] ?? 'No hay titulo');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_messageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStream() {
    _messageStreamController.close();
  }
}
