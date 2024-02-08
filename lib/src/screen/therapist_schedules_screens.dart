import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modle/PatientSchedule.dart';
import '../widgect/SearchWidget.dart'; // Import for date formatting

class TherapistSchedulesScreen extends StatefulWidget {
  @override
  _TherapistSchedulesScreenState createState() =>
      _TherapistSchedulesScreenState();
}

class _TherapistSchedulesScreenState extends State<TherapistSchedulesScreen> {
  late DateTime _selectedDate;

  List<PatientSchedule> patientSchedules = []; // List of patient schedules

  List<PatientSchedule> _filteredSchedules = []; // Filtered schedules

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    // Add dummy data
    patientSchedules = [
      PatientSchedule(
        type: "Appointment",
        // date: DateTime.now(),{
        patientName: 'John Doe',
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 1)),
        consultedDoctorName: 'Dr. Smith',
        treatmentName: 'Physical Therapy',
        blockReason: null,
        patientMRNumber: '3245', date: DateTime.now(),
      ),
      PatientSchedule(
        type: "Appointment",
        date: DateTime.now().add(Duration(hours: 1)),
        patientName: 'Jane Smith',
        startTime: DateTime.now().add(Duration(hours: 3)),
        endTime: DateTime.now().add(Duration(hours: 1)),
        consultedDoctorName: 'Dr. Johnson',
        treatmentName: 'Massage Therapy',
        blockReason: null,
        patientMRNumber: '234',
      ),
      PatientSchedule(
        type: "Appointment",
        date: DateTime.now().add(Duration(hours: 3)),
        patientName: 'Jane Smith',
        startTime: DateTime.now().add(Duration(hours: 3)),
        endTime: DateTime.now().add(Duration(hours: 4)),
        consultedDoctorName: 'Dr. Johnson',
        treatmentName: 'Massage Therapy',
        blockReason: null,
        patientMRNumber: '234',
      ),
      // Add more dummy data as needed
    ];
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _filterSchedulesByDate(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 49,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF97D661),
                  Color(0xFF157519),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Select Date"),
                SizedBox(width: 170),
                Text(" Therapist 1")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_month, color: Colors.black),
                  label: Text(
                    DateFormat('MMM d, yyyy').format(_selectedDate),
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                // ElevatedButton.icon(
                //   onPressed: () {},
                //   icon: Icon(Icons.search),
                //   label: Text("Search"),
                // ),
                SizedBox(width: 130),
                SearchWidget(),

                // Expanded(
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: 'Search by patient name',
                //       border: OutlineInputBorder(),
                //       contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //     ),
                //     onChanged: (value) {
                //       // Implement search by name
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          _buildDateSelector(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // color: Colors.cyanAccent,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Chip(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.white,
                      avatar: Container(
                        color: Colors.green,
                        height: 20,
                        width: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            2.0), // Adjust the radius as needed
                        side: BorderSide(
                            color: Colors.black,
                            width: 1), // Define the border color and width
                      ),
                      label: const Text('Free'),
                    ),
                    SizedBox(
                      width: 29,
                    ),
                    Chip(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.white,
                      avatar: Container(
                        color: Colors.blue,
                        height: 20,
                        width: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            2.0), // Adjust the radius as needed
                        side: BorderSide(
                            color: Colors.black,
                            width: 1), // Define the border color and width
                      ),
                      label: const Text('Appointment'),
                    ),
                    SizedBox(
                      width: 29,
                    ),
                    Chip(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.white,
                      avatar: Container(
                        color: Colors.red,
                        height: 20,
                        width: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            2.0), // Adjust the radius as needed
                        side: BorderSide(
                            color: Colors.black,
                            width: 1), // Define the border color and width
                      ),
                      label: const Text('Block'),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: _filteredSchedules.isEmpty
                ? Center(
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'No schedules available for selected date',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                : _buildScheduleList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6DA52D),
                Color(0xFF6DA52D),
                Color(0xFF62C55E),
                Color(0xFF62C55E),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index < 3) {
                final date = _selectedDate.add(Duration(days: index));
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                      _filterSchedulesByDate(_selectedDate);
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(DateFormat('d').format(date)),
                            SizedBox(width: 3),
                            Text(DateFormat('MMM').format(date)),
                            SizedBox(width: 3),
                            Text(DateFormat('yyyy').format(date)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate
                          .add(Duration(days: 3)); // Move to next set of dates
                      _filterSchedulesByDate(_selectedDate);
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  label: Text(""),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 1),
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildScheduleList() {
    List<Widget> scheduleWidgets = [];

    // Sort schedules by start time
    _filteredSchedules.sort((a, b) => a.startTime.compareTo(b.startTime));

    // Check if the first schedule of the day starts after the day begins
    if (_filteredSchedules.isNotEmpty &&
        _filteredSchedules.first.startTime.hour > 0) {
      // Add a green card for the free time before the first schedule
      scheduleWidgets.add(_buildFreeTimeCard(
          _filteredSchedules.first.startTime.subtract(Duration(hours: 1))));
    }

    // Iterate over the schedules and add them to the list
    for (int i = 0; i < _filteredSchedules.length; i++) {
      final schedule = _filteredSchedules[i];
      scheduleWidgets.add(ScheduleCard(schedule: schedule));

      // Check if there's free time between this schedule and the next one
      if (i < _filteredSchedules.length - 1 &&
          _filteredSchedules[i + 1]
                  .startTime
                  .difference(schedule.endTime)
                  .inMinutes >
              0) {
        // Add a green card for the free time between schedules
        scheduleWidgets.add(_buildFreeTimeCard(schedule.endTime,
            endTime: _filteredSchedules[i + 1].startTime));
      }

      // Add a break time card from 1 to 2 if it's not the last schedule
      if (schedule.endTime.hour < 14 && i != _filteredSchedules.length - 1) {
        scheduleWidgets.add(_buildBreakTimeCard(
            schedule.endTime, _filteredSchedules[i + 1].startTime));
      }
    }

    return ListView(
      children: scheduleWidgets,
    );
  }

  Widget _buildFreeTimeCard(DateTime startTime, {DateTime? endTime}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF6DA52D),
          borderRadius: BorderRadius.circular(12.0),
        ),
        // color: Color(0xFF6DA52D),
        // elevation: 10,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3.2,
                  color: Color(0xFF6DA52D),
                  // padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "    Free",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF67BA4C),
                    Color(0xFF6DA52D),
                  ])),
                  width: MediaQuery.of(context).size.width / 1.8,
                  // color: Color(0xFF67BA4C),
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${DateFormat('h:mm a').format(startTime)}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (endTime != null)
                          Text(
                            ' - ${DateFormat('h:mm a').format(endTime)}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SizedBox(width: .0),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF6DA52D),
                    Color(0xFF67BA4C),
                    Color(0xFF67BA4C),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AVAILABLE",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakTimeCard(DateTime startTime, DateTime endTime) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFD0000),
          borderRadius: BorderRadius.circular(12.0),
        ),
        // color: Color(0xFFFD0000),
        // elevation: 10,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        // elevation: 5.0,
        // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3.2,
                  color: Color(0xFFFD0000),
                  // padding: EdgeInsets.only(),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "   Block",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  // color: Color(0xFFFF5C00),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFFFF5C00),
                    Color(0xFFFF5C00),
                    Color(0xFFFD0000),
                  ])),
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${DateFormat('h:mm a').format(startTime)}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' - ${DateFormat('h:mm a').format(endTime)}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(width: 5.0),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFD0000),
                    Color(0xFFFF5C00),
                    Color(0xFFFF5C00),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "BREAK TIME",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final PatientSchedule schedule;

  ScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2396EB),
          borderRadius: BorderRadius.circular(12.0),
        ),
        // color: Color(0xFF2396EB),
        // elevation: 10,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3.2,
                  // height: 50,
                  color: Color(0xFF2396EB),
                  // padding: EdgeInsets.all(1.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '   ${schedule.type}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.55,
                  color: Color(0xFF677FF9),
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                            '${DateFormat('h:mm a').format(schedule.startTime)}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(width: 5.0),
                        Text('${DateFormat('h:mm a').format(schedule.endTime)}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                Divider(height: 10),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF677FF9),
                    Color(0xFF677FF9),
                    Color(0xFF2396EB),
                    Color(0xFF2396EB),
                    Color(0xFF2396EB),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        ' MR No: ${schedule.patientMRNumber}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        ' Name :${schedule.patientName}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          'Consulted Doctor: ${schedule.consultedDoctorName ?? 'N/A'}'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Treatment Name: ${schedule.treatmentName}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
