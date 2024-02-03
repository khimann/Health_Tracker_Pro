import 'package:flutter/material.dart';

class CalorieCounterPage extends StatefulWidget {
  @override
  _CalorieCounterPageState createState() => _CalorieCounterPageState();
}

class CalorieRecord {
  DateTime dateTime;
  int caloriesConsumed;

  CalorieRecord({required this.dateTime, required this.caloriesConsumed});
}

class _CalorieCounterPageState extends State<CalorieCounterPage> {
  List<CalorieRecord> calorieRecords = [];
  TextEditingController caloriesController = TextEditingController();

  void _addCalories() {
    if (caloriesController.text.isNotEmpty) {
      setState(() {
        int calories = int.parse(caloriesController.text);
        calorieRecords.add(CalorieRecord(
          dateTime: DateTime.now(),
          caloriesConsumed: calories,
        ));
        caloriesController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Calories',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addCalories,
              child: Text('Add Calories'),
            ),
            SizedBox(height: 20),
            if (calorieRecords.isNotEmpty)
              DataTable(
                columns: [
                  DataColumn(label: Text('Date & Time')),
                  DataColumn(label: Text('Calories Consumed')),
                ],
                rows: calorieRecords.map((record) {
                  return DataRow(cells: [
                    DataCell(Text(record.dateTime.toString())),
                    DataCell(Text(record.caloriesConsumed.toString())),
                  ]);
                }).toList(),
              )
            else
              Text('No calorie records available.'),
          ],
        ),
      ),
    );
  }
}
