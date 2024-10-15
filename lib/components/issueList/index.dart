import 'package:flutter/material.dart';

class IssueList extends StatelessWidget {
  final List<Map<String, dynamic>> issues;
  final int? selectedIssue;
  final ValueChanged<int?> onIssueSelected;

  const IssueList({
    Key? key,
    required this.issues,
    required this.selectedIssue,
    required this.onIssueSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: issues.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              issues[index]['icon'],
              color: Color(0xFF256E69),
            ),
          ),
          title: Text(
            issues[index]['text'],
            style: TextStyle(color: Colors.white),
          ),
          trailing: Radio<int>(
            value: index,
            groupValue: selectedIssue,
            activeColor: Colors.white,
            onChanged: onIssueSelected,
          ),
        );
      },
    );
  }
}
