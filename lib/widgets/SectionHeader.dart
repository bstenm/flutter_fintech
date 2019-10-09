import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String dialogText;
  final String headerText;
  final String sectionKey;

  SectionHeader({
    Key key,
    this.sectionKey,
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
            // for integration tests
            key: Key('${sectionKey}_section_header'),
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          // shows a dialog box on tap
          GestureDetector(
            child: Text(
              'Manage',
              // for integration tests
              key: Key('${sectionKey}_manage_btn'),
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
                  title: Text(
                    dialogText,
                    // for integration tests
                    key: Key('${sectionKey}_dialog'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
