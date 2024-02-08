import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _showTextField = false;

  @override
  Widget build(BuildContext context) {
    return _showTextField
        ? Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by patient name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (value) {
                // Implement search by name
              },
            ),
          )
        : ElevatedButton.icon(
            icon: Icon(Icons.search),
            label: Text('Search'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              setState(() {
                _showTextField = true;
              });
            },
          );
  }
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchWidget(),
        ),
      ],
    );
  }
}
