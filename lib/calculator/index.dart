import 'package:flutter/material.dart';
import '../layouts/main.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorLayout();
  }
}

class CalculatorLayout extends State<Calculator> {
  String resultText = "";
  String showText = "";
  List<int> numbersList = [];
  int totalResult = 0;
  TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: resultText);
  }

  @override
  void didUpdateWidget(Calculator oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Result',
                      filled: true,
                      fillColor: Colors.grey),
                  enableInteractiveSelection: false,
                  enabled: false,
                ),
              )
            ],
          ),
          drawButton('123+', () {}),
          drawButton('456-', (null)),
          drawButton('789*', (null)),
          drawButton('C', (null))
        ],
      ),
    );

    return MainLayout(appBarTitle: 'Calculator', bodyWidget: bodyWidget);
  }

  //function for drawing button
  Widget drawButton(String rowButtonsString, Function onPressedFunction) {
    List<String> buttonsList = rowButtonsString.split("");
    return Row(
      children: buttonsList
          .map(
            (element) => Expanded(
              child: RaisedButton(
                child: Text('$element'),
                onPressed: () {
                  if (element == 'C') {
                    textController.text = '0';
                    totalResult = 0;
                    numbersList.clear();
                    return;
                  }
                  textController.text += element;
                  showText = textController.text;
                  if (element == '+' || element == '-' || element == '*') {
                    numbersList.add(int.parse(resultText));
                    resultText = '';
                    if (numbersList.length > 1) {
                      print(numbersList);
                      numbersList.map((number) {
                        print(number);
                        if (element == '+') {
                          totalResult += number;
                        }
                      }).toList();
                      print('result = ' + totalResult.toString());
                      textController.text = totalResult.toString();
                    }
                  } else {
                    resultText = textController.text;
                  }
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
