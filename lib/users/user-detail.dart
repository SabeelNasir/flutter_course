import 'package:flutter/material.dart';
import '../api-services/Employees.dart';

class UserDetail extends StatelessWidget {
  final Employees employeeInfo;
  UserDetail(this.employeeInfo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employeeInfo.employeeName + ' Details'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(employeeInfo.employeeName),
              subtitle: Text(
                  '${employeeInfo.employeeSalary}  |  ${employeeInfo.employeeAge}'),
            ),
          )
        ],
      ),
    );
  }
}
