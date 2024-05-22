import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/role_selection.dart';
import 'screens/admin_home_screen.dart';
import 'screens/patient_home_screen.dart';
import 'screens/appointment_schedule_screen.dart';
import 'screens/patient_history_record.dart';
import 'screens/data_visualization.dart';
import 'screens/admin_list_of_patient.dart';
import 'screens/admin_patient_appointments.dart';

import 'screens/patient_record_screen.dart'; // Import the new screens

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Hospital App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => RoleSelectionScreen(),
          '/login': (context) =>
              LoginScreen(role: 'Patient'), // Default to Patient
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/adminHome': (context) => AdminHomeScreen(),
          '/patientHome': (context) => PatientHomeScreen(),
          '/appointmentSchedule': (context) => AppointmentScheduleScreen(),
          '/patientRecord': (context) => PatientRecordScreen(),
          '/patientHistory': (context) => PatientHistory(),
          '/dataVisualization': (context) => DataVisualization(),
          '/listOfPatients': (context) => ListOfPatients(),
          '/patientsAppointments': (context) => PatientAppointments(),
        },
      ),
    );
  }
}
