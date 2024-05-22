import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
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
              leading: Icon(Icons.calendar_today),
              title: Text('Patients Appointments'),
              onTap: () {
                Navigator.of(context).pushNamed('/patientsAppointments');
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('List of Patients'),
              onTap: () {
                Navigator.of(context).pushNamed('/listOfPatients');
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Data Visualization'),
              onTap: () {
                Navigator.of(context).pushNamed('/dataVisualization');
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
                  Text('Welcome, ${user.email}! You are logged in as Admin.'),
                  // Add any additional admin-specific widgets here
                ],
              ),
      ),
    );
  }
}
