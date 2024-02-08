import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScroll extends StatefulWidget {
  @override
  _DateScrollState createState() => _DateScrollState();
}

class _DateScrollState extends State<DateScroll> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Show only 3 dates
                itemBuilder: (context, index) {
                  final date = _selectedDate.add(Duration(days: index));
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
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedDate = _selectedDate
                      .add(Duration(days: 3)); // Move to the next date
                });
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  void _filterSchedulesByDate(DateTime date) {
    // Add your logic to filter schedules based on the selected date
    // This function will be called whenever a date is selected
  }
}
