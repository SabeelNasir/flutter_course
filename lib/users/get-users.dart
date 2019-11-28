import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';
import '../api-services/Post.dart';
import '../api-services/Employees.dart';
import './user-detail.dart';

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<List<Employees>> fetchEmployees() async {
  List<Employees> empList;
  final response =
      await http.get('http://dummy.restapiexample.com/api/v1/employees');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    //return Employees.fromJson(json.decode(response.body));
    var data = json.decode(response.body);
    var rest = data as List;
    empList = rest.map<Employees>((json) => Employees.fromJson(json)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
  return empList;
}

class GetUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetUsersState();
  }
}

class _GetUsersState extends State<GetUsers> {
  Future<Post> post;
  Future<List<Employees>> employees;
  @override
  void initState() {
    super.initState();
    post = fetchPost();
    //employees = fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Manage Users')),
          body: ListView(
            children: <Widget>[
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.rss_feed),
                                title: Text(snapshot.data.title),
                              ),
                              ListBody(
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      'Body',
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Text(snapshot.data.body),
                                          padding: EdgeInsets.all(8),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        //Doctor-Notes Card
                        Card(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.note),
                                title: Text('Focus'),
                                trailing: Text('25 Nov | 15:15 PM'),
                              ),
                              ListBody(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Text(snapshot.data.body),
                                          padding: EdgeInsets.all(8),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.note),
                                title: Text('Focus'),
                                trailing: Text('25 Nov | 15:15 PM'),
                              ),
                              ListBody(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Text('This testing note for Doctor-Mobile App'),
                                          padding: EdgeInsets.all(8),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return GlowingProgressIndicator(
                    child: Icon(Icons.person_outline),
                  );
                },
              ),
              //Post Card

              //Employees Card
              FutureBuilder<List<Employees>>(
                future: employees,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data
                          .map(
                            (row) => Card(
                              margin:
                                  EdgeInsets.only(left: 8, right: 8, bottom: 5),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserDetail(row)));
                                },
                                leading: Icon(Icons.person),
                                title: Text(row.employeeName),
                                trailing: Text('23,Nov 13:45 PM'),
                                subtitle: Text(row.employeeAge +
                                    '  |  ' +
                                    row.employeeSalary),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error : ${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return GlowingProgressIndicator(
                    child: Icon(Icons.verified_user),
                  );
                },
              )
            ],
          )),
    );
  }
}
