import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sheba_ai/domain/model/reminder/reminder.dart';
import 'package:sheba_ai/domain/repository/reminder_repository.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/data/datasource/remote/service/notification_service.dart';

final reminderNotifierProvider =
    StateNotifierProvider<ReminderNotifier, List<Reminder>>((ref) {
  return ReminderNotifier(
    getIt<ReminderRepository>(),
    getIt<NotificationService>(),
  );
});

class ReminderNotifier extends StateNotifier<List<Reminder>> {
  final ReminderRepository _repository;
  final NotificationService _notificationService;

  ReminderNotifier(this._repository, this._notificationService) : super([]) {
    loadReminders();
  }

  Future<void> loadReminders() async {
    final reminders = await _repository.getReminders();
    state = reminders;
  }

  Future<void> addReminder(Reminder reminder) async {
    await _repository.addReminder(reminder);
    if (reminder.isEnabled) {
      await _scheduleNotification(reminder);
    }
    await loadReminders();
  }

  Future<void> updateReminder(Reminder reminder) async {
    await _repository.updateReminder(reminder);
    await _notificationService.cancelNotification(reminder.id.hashCode);
    if (reminder.isEnabled) {
      await _scheduleNotification(reminder);
    }
    await loadReminders();
  }

  Future<void> deleteReminder(String id) async {
    await _repository.deleteReminder(id);
    await _notificationService.cancelNotification(id.hashCode);
    await loadReminders();
  }

  Future<void> toggleReminder(Reminder reminder) async {
    reminder.isEnabled = !reminder.isEnabled;
    await updateReminder(reminder);
  }

  Future<void> _scheduleNotification(Reminder reminder) async {
    await _notificationService.scheduleNotification(
      id: reminder.id.hashCode,
      title: 'Medicine Reminder',
      body: 'Time to take ${reminder.medicineName} (${reminder.dosage})',
      scheduledTime: reminder.time,
    );
  }
}
