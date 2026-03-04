
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    debugPrint('Device Timezone Raw: $timeZoneName');
    
    String tzId = timeZoneName.toString();
    if (tzId.startsWith('TimezoneInfo(')) {
      final parts = tzId.split('(');
      if (parts.length > 1) {
        final content = parts[1].split(',');
        if (content.isNotEmpty) {
          tzId = content[0].trim();
        }
      }
    }
    debugPrint('Cleaned Timezone ID: $tzId');

    try {
      tz.setLocalLocation(tz.getLocation(tzId));
    } catch (e) {
      // Fallback if timezone lookup fails
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Handle notification tap
      },
    );

    // Request notification permission for Android 13+
    final androidImplementation = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    
    if (androidImplementation != null) {
      await androidImplementation.requestNotificationsPermission();
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    // Request exact alarm permission on Android 12+
    final androidPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      await androidPlugin.requestExactAlarmsPermission();
    }

    final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);
    debugPrint('Scheduling notification for: $tzScheduledTime (Local: $scheduledTime)');

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzScheduledTime,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'medicine_reminder_channel_v4', // Changed channel ID
            'Medicine Reminders',
            channelDescription: 'Channel for medicine reminders',
            importance: Importance.max,
            priority: Priority.max, // Increased to max
            ticker: 'ticker',
            additionalFlags: Int32List.fromList(<int>[4]), // FLAG_INSISTENT
            category: AndroidNotificationCategory.alarm,
            audioAttributesUsage: AudioAttributesUsage.alarm,
            visibility: NotificationVisibility.public,
            sound: const UriAndroidNotificationSound('content://settings/system/alarm_alert'), // Use default alarm sound
          ),
          iOS: const DarwinNotificationDetails(
            presentSound: true,
            presentAlert: true,
            presentBadge: true,
            sound: 'default_sound.caf', // Ensure sound plays on iOS
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } on PlatformException catch (e) {
      debugPrint('Error scheduling exact alarm: $e');
      // Fallback to inexact scheduling if exact alarms are not permitted
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzScheduledTime,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'medicine_reminder_channel_v4', // Changed channel ID
            'Medicine Reminders',
            channelDescription: 'Channel for medicine reminders',
            importance: Importance.max,
            priority: Priority.max, // Increased to max
            ticker: 'ticker',
            additionalFlags: Int32List.fromList(<int>[4]), // FLAG_INSISTENT
            category: AndroidNotificationCategory.alarm,
            audioAttributesUsage: AudioAttributesUsage.alarm,
            visibility: NotificationVisibility.public,
            sound: const UriAndroidNotificationSound('content://settings/system/alarm_alert'), // Use default alarm sound
          ),
          iOS: const DarwinNotificationDetails(
            presentSound: true,
            presentAlert: true,
            presentBadge: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
