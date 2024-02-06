import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

import '../modle/PatientSchedule.dart'; // Import your PatientSchedule model here

class TherapistSchedulesScreen extends StatefulWidget {
  @override
  _TherapistSchedulesScreenState createState() =>
      _TherapistSchedulesScreenState();
}

class _TherapistSchedulesScreenState extends State<TherapistSchedulesScreen> {
  late DateTime _selectedDate;

  List<PatientSchedule> patientSchedules =
      []; // Declaration and initialization of patientSchedules

  List<PatientSchedule> _filteredSchedules = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _filterSchedulesByDate(_selectedDate);
  }

  void _filterSchedulesByDate(DateTime selectedDate) {
    setState(() {
      _filteredSchedules = patientSchedules
          .where((schedule) =>
              schedule.date.year == selectedDate.year &&
              schedule.date.month == selectedDate.month &&
              schedule.date.day == selectedDate.day)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Schedules'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDateSelector(),
          Expanded(
            child: _filteredSchedules.isEmpty
                ? Center(
                    child: Text('No schedules for selected date'),
                  )
                : ListView.builder(
                    itemCount: _filteredSchedules.length,
                    itemBuilder: (context, index) {
                      return ScheduleCard(
                        schedule: _filteredSchedules[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7, // Example: Show dates for the next 7 days
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index));
          return InkWell(
            onTap: () {
              setState(() {
                _selectedDate = date;
                _filterSchedulesByDate(_selectedDate);
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              color: _selectedDate == date ? Colors.blue : null,
              child: Text(DateFormat('MMM d').format(date)),
            ),
          );
        },
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final PatientSchedule schedule;

  ScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient Name: ${schedule.patientName}'),
            Text(
                'Start Time: ${DateFormat('h:mm a').format(schedule.startTime)}'),
            Text('End Time: ${DateFormat('h:mm a').format(schedule.endTime)}'),
            Text('Consulted Doctor: ${schedule.consultedDoctorName}'),
            Text('Treatment Name: ${schedule.treatmentName}'),
            if (schedule.blockReason != null)
              Text('Block Reason: ${schedule.blockReason!}'),
          ],
        ),
      ),
    );
  }
}
