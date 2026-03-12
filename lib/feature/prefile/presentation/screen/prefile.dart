import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Prefile extends StatelessWidget {
  const Prefile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('my prefile'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 10,

                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/Background (2).png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Alex Johnson',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff0F172A),
                ),
              ),
              Text(
                'alex.j@example.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff64748B),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.red),
                  title: Text('Edit Prefile'),
                  trailing: Icon(Icons.arrow_back_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.lock, color: Colors.red),
                  title: Text('Change Passwword'),
                  trailing: Icon(Icons.arrow_back_ios),
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications, color: Colors.red),
                  title: Text('Notiffication Settings '),
                  trailing: Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 150,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                    ),
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
