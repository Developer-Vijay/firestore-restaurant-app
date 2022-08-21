import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  showTextNotifications(var title, var body) async {
    var android = AndroidNotificationDetails("Id", "channel", "description",
        importance: Importance.high, playSound: true);
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    await _flutterLocalNotificationsPlugin.show(0, title, body, platform);
  }

  Future<void> scheduleNotification(var title, var body) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'chef',
      largeIcon: DrawableResourceAndroidBitmap('chef'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.schedule(0, title, body,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
