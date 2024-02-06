import '../modle/PatientSchedule.dart';

class Utils {
  static List<PatientSchedule> patientSchedules = [
    // Adding patient schedules to the list
    PatientSchedule(
      date: DateTime.now(),
      patientMRNumber: '12345',
      patientName: 'John Doe',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      consultedDoctorName: 'Dr. Smith',
      treatmentName: 'Physical Therapy',
      blockReason: 'Lunch Break',
    ),
    PatientSchedule(
      date: DateTime.now(),
      patientMRNumber: '67890',
      patientName: 'Jane Doe',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      consultedDoctorName: 'Dr. Brown',
      treatmentName: 'Psychological Counseling',
      blockReason: null, // Example where block reason is not specified
    ),
    PatientSchedule(
      date:
          // 06/02/2024,
          DateTime.now(),
      patientMRNumber: '67890',
      patientName: 'Jane Doe',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      consultedDoctorName: 'Dr. Brown',
      treatmentName: 'Psychological Counseling',
      blockReason: null, // Example where block reason is not specified
    ),
  ];

  static void printPatientSchedules() {
    // Accessing patient schedules from the list
    for (var schedule in patientSchedules) {
      print('Date: ${schedule.date}');
      print('Patient MR Number: ${schedule.patientMRNumber}');
      print('Patient Name: ${schedule.patientName}');
      print('Start Time: ${schedule.startTime}');
      print('End Time: ${schedule.endTime}');
      print('Consulted Doctor Name: ${schedule.consultedDoctorName}');
      print('Treatment Name: ${schedule.treatmentName}');
      print(
          'Block Reason: ${schedule.blockReason ?? 'N/A'}'); // Null check for block reason
      print('\n');
    }
  }
}
