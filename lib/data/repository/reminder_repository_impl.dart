import 'package:sheba_ai/data/datasource/local/database_helper.dart';
import 'package:sheba_ai/data/model/reminder_model.dart';
import 'package:sheba_ai/domain/repository/reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final DatabaseHelper _databaseHelper;

  ReminderRepositoryImpl() : _databaseHelper = DatabaseHelper();

  @override
  Future<List<ReminderModel>> getReminders() async {
    return _databaseHelper.getReminders();
  }

  @override
  Future<void> addReminder(ReminderModel reminder) async {
    await _databaseHelper.insertReminder(reminder);
  }

  @override
  Future<void> updateReminder(ReminderModel reminder) async {
    await _databaseHelper.updateReminder(reminder);
  }

  @override
  Future<void> deleteReminder(String id) async {
    await _databaseHelper.deleteReminder(id);
  }
}
