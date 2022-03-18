import 'package:flutter/material.dart';

class ProfitCalculator extends StatefulWidget {
  const ProfitCalculator({Key? key}) : super(key: key);

  @override
  _ProfitCalculatorState createState() => _ProfitCalculatorState();
}

class _ProfitCalculatorState extends State<ProfitCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Mint Price"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
