import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _backlogController = TextEditingController();
  final _tenthPercentageController = TextEditingController();
  final _twelfthPercentageController = TextEditingController();
  double _cgpaRange = 0;
  double _tenthPercentage = 0;
  double _twelfthPercentage = 0;
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();

  @override
  void dispose() {
    _backlogController.dispose();
    _tenthPercentageController.dispose();
    _twelfthPercentageController.dispose();
    _nameController.dispose();
    _rollNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _rollNoController,
              decoration: const InputDecoration(
                labelText: 'Roll No.',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _backlogController,
              decoration: const InputDecoration(
                labelText: 'Number of backlogs',
              ),
            ),
            const Divider(
              height: 30,
            ),
            TextFormField(
              controller: _tenthPercentageController,
              decoration: const InputDecoration(
                labelText: '10th Percentage',
              ),
            ),
            const Divider(
              height: 30,
            ),
            TextFormField(
              controller: _twelfthPercentageController,
              decoration: const InputDecoration(
                labelText: '12th Percentage',
              ),
            ),
            const Divider(
              height: 30,
            ),
            Text('CGPA Range: ${_cgpaRange.toStringAsFixed(2)}'),
            Slider(
              value: _cgpaRange,
              onChanged: (double value) {
                setState(() {
                  _cgpaRange = value;
                });
              },
              min: 0,
              max: 10,
              divisions: 100,
              label: _cgpaRange.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('verify'),
            ),
          ],
        ),
      ),
    );
  }
}
