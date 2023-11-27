import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Local Notification
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // request permission for notification
  Future<void> requestNotificationsPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // get device token
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  // check token is expired or not
  Future<void> checkToken() async {
    String? token = await messaging.getToken();
    print('Token: $token');
    messaging.onTokenRefresh.listen((event) {
      print('Token: $event');
    });
  }

  // Firebase Notification Initialization
  Future<void> initializeFirebaseNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  // initialize local notification
  Future<void> initializeLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/cc_launcher');

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: (payload) {});
  }

  // show notification
  Future<void> showNotification(
      BuildContext context, RemoteMessage message) async {
    Future.delayed(const Duration(seconds: 1), () async {
      await initializeLocalNotification(context, message);
      var androidChannelSpecifics = AndroidNotificationDetails(
        message.notification!.title!,
        message.notification!.body!,
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        icon: '@mipmap/cc_launcher',
        largeIcon: const DrawableResourceAndroidBitmap('@mipmap/cc_launcher'),
      );

      var platformChannelSpecifics =
          NotificationDetails(android: androidChannelSpecifics);

      await _flutterLocalNotificationsPlugin.show(
        1,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: 'New Payload',
      );
    });
  }
}
