import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String dialogText;
  final String headerText;

  SectionHeader({
    Key key,
    @required this.dialogText,
    @required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headerText,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            child: Text(
              'Manage',
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) => AlertDialog(
                  title: Text(dialogText),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
