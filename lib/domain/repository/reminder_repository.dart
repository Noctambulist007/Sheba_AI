import 'package:sheba_ai/data/model/reminder_model.dart';

abstract class ReminderRepository {
  Future<List<ReminderModel>> getReminders();
  Future<void> addReminder(ReminderModel reminder);
  Future<void> updateReminder(ReminderModel reminder);
  Future<void> deleteReminder(String id);
}
