import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Models/token_model.dart';
import 'package:project/pages/login_page.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  Future<void> logout(BuildContext context) async {
    try {
      String? loginToken = await UserPreferences.getLoginToken();
      var response = await http.post(
        Uri.parse('http://192.168.1.104:8000/api/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $loginToken'
        },
      );

      print("Logout status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        // Clear the login token from shared preferences
        await UserPreferences.deleteLoginToken();
        print('Logout successful. Login token removed.');

        // Navigate to the login page or any other desired page after logout
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        throw Exception('Failed to log out');
      }
    } catch (e) {
      print('Exception occurred during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      appBar: AppBar(
        backgroundColor: Color(0xff17A4A1),
        title: Text('Log Out'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'If you want to log out press this botten',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff17A4A1),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                logout(context);
              },
              color: Color(0xff1DC2D6),
              child: Text('Log Out'),
            )
          ],
        ),
      ),
    );
  }
}
