import 'package:flutter/material.dart';
import 'login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Role'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(role: 'Patient'),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/patient_logo.png', height: 100),
                    SizedBox(height: 10),
                    Text('Patient'),
                  ],
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(role: 'Admin'),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/admin_logo.png', height: 100),
                    SizedBox(height: 10),
                    Text('Admin'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
