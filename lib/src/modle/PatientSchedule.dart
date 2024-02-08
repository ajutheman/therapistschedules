class PatientSchedule {
  final DateTime date;
  final String patientMRNumber;
  final String patientName;
  final DateTime startTime;
  final DateTime endTime;
  final String consultedDoctorName;
  final String treatmentName;
  final String type;

  final String?
      blockReason; // Block Reason can be nullable if not always present

  PatientSchedule({
    required this.date,
    required this.type,
    required this.patientMRNumber,
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.consultedDoctorName,
    required this.treatmentName,
    this.blockReason,
  });
}
