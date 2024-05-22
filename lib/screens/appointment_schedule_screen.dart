import 'package:flutter/material.dart';

class AppointmentScheduleScreen extends StatefulWidget {
  @override
  _AppointmentScheduleScreenState createState() =>
      _AppointmentScheduleScreenState();
}

class _AppointmentScheduleScreenState extends State<AppointmentScheduleScreen> {
  final _nameController = TextEditingController();
  final _sexController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateController = TextEditingController();
  final _ageController = TextEditingController();

  String _selectedCheckupType = 'General Check-up';
  String? _selectedDay;

  final Map<String, List<String>> _checkupDays = {
    'General Check-up': ['Monday', 'Tuesday', 'Thursday'],
    'Baby Vaccination': ['Wednesday'],
    'Pregnant Vaccination': ['Friday']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _sexController,
              decoration: InputDecoration(labelText: 'Sex'),
            ),
            TextField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Complete Address'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCheckupType,
              decoration: InputDecoration(labelText: 'Select Check-up Type'),
              items: _checkupDays.keys.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCheckupType = newValue!;
                  _selectedDay =
                      null; // Reset the selected day when check-up type changes
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedDay,
              decoration: InputDecoration(labelText: 'Select Day'),
              items: _checkupDays[_selectedCheckupType]!.map((String day) {
                return DropdownMenuItem<String>(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDay = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                final appointmentDetails = {
                  'Name': _nameController.text,
                  'Sex': _sexController.text,
                  'Date of Birth': _dobController.text,
                  'Complete Address': _addressController.text,
                  'Date': _dateController.text,
                  'Age': _ageController.text,
                  'Check-up Type': _selectedCheckupType,
                  'Day': _selectedDay
                };
                // Print or save the appointment details
                print(appointmentDetails);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
