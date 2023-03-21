import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final marksController = TextEditingController();
  final semesterController = TextEditingController();

  List<Map<String, dynamic>> data = [];

  void addNewItem() {
    setState(() {
      final name = nameController.text;
      final rollNo = int.tryParse(rollNoController.text) ?? 0;
      final marks = int.tryParse(marksController.text) ?? 0;
      final semester = semesterController.text;

      data.add({
        "Name": name,
        "Roll No": rollNo,
        "Semester": semester,
        "Marks": marks,
        "checked": false,
      });

      // Clear the input fields
      nameController.clear();
      rollNoController.clear();
      semesterController.clear();
      marksController.clear();
    });
  }

  String searchQuery = '';

  List<Map<String, dynamic>> get filteredData {
    return data.where((item) {
      final name = item['Name'] as String;
      final rollNo = item['Roll No'].toString();
      final semester = item['Semester'] as String;
      final marks = item['Marks'].toString();

      return name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          rollNo.toLowerCase().contains(searchQuery.toLowerCase()) ||
          semester.toLowerCase().contains(searchQuery.toLowerCase()) ||
          marks.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student List'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: rollNoController,
                decoration: InputDecoration(labelText: 'Roll No'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: semesterController,
                decoration: InputDecoration(labelText: 'Semester'),
              ),
              TextField(
                controller: marksController,
                decoration: InputDecoration(labelText: 'Marks'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                child: Text('Add'),
                onPressed: addNewItem,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Roll No')),
                      DataColumn(label: Text('Semester')),
                      DataColumn(label: Text('Marks')),
                    ],
                    rows: filteredData
                        .map((item) => DataRow(cells: [
                              DataCell(Text(item['Name'])),
                              DataCell(Text(item['Roll No'].toString())),
                              DataCell(Text(item['Semester'])),
                              DataCell(Text(item['Marks'].toString())),
                            ]))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
