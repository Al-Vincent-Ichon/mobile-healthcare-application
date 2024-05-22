import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      drawerEnableOpenDragGesture: true, // Enable swipe to open drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                user != null ? 'Welcome, ${user.email}' : 'No user logged in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Appointment Schedule'),
              onTap: () {
                Navigator.of(context).pushNamed('/appointmentSchedule');
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Patient Record'),
              onTap: () {
                Navigator.of(context).pushNamed('/patientRecord');
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('History'),
              onTap: () {
                Navigator.of(context).pushNamed('/patientHistory');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: user == null
            ? const Text('No user logged in')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, ${user.email}! You are logged in as Patient.'),
                  // Add any additional patient-specific widgets here
                ],
              ),
      ),
    );
  }
}
