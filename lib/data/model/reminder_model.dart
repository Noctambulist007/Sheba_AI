class ReminderModel {
  final String id;
  final String medicineName;
  final String dosage;
  final String type; // e.g., Pill, Syrup, Injection
  final String frequency; // e.g., Daily, Weekly
  final DateTime time;
  bool isEnabled;

  ReminderModel({
    required this.id,
    required this.medicineName,
    required this.dosage,
    required this.type,
    required this.frequency,
    required this.time,
    this.isEnabled = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicineName': medicineName,
      'dosage': dosage,
      'type': type,
      'frequency': frequency,
      'time': time.toIso8601String(),
      'isEnabled': isEnabled ? 1 : 0,
    };
  }

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'],
      medicineName: map['medicineName'],
      dosage: map['dosage'],
      type: map['type'],
      frequency: map['frequency'],
      time: DateTime.parse(map['time']),
      isEnabled: map['isEnabled'] == 1,
    );
  }
}
