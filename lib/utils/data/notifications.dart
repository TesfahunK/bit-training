import 'package:bit_initial/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

Future<void> initFcm() async {
  var flutterLocalNotificationsPlugin;
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}

void showPushNotification(
    {required int hascode, required String title, required String message}) {
  flutterLocalNotificationsPlugin.show(
      hascode,
      title,
      message,
      NotificationDetails(
        android: AndroidNotificationDetails(
            'high_importance_channel', 'High Importance',
            channelDescription:
                'This channel is used for important notifications.',
            icon: 'appicon',
            importance: Importance.max,
            channelShowBadge: true),
      ));
}
