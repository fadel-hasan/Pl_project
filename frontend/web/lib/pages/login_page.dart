import 'package:flutter/material.dart';
import 'package:project/Models/token_model.dart';
import 'package:project/pages/MedicineListPage.dart';
import 'package:project/widgets/Custom_textField.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login(
      BuildContext context, String email, String password) async {
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };
    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.104:8000/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      print("Login status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        String loginToken = jsonData['data']['token'];

        // Save the token to shared preferences
        await UserPreferences.saveLoginToken(loginToken);
        print('Login successful. login token is saved: $loginToken');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MedicineListPage()),
        );
      } else {
        throw Exception('Failed to log in');
      }
    } catch (e) {
      print('Exception occurred during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Spacer(
                flex: 2,
              ),
              CircleAvatar(
                radius: 122,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage(
                      'assets/istockphoto-1055083134-1024x1024.webp'),
                ),
              ),
              Center(
                child: Text(
                  'Pharmacy App',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color(0xff17A4A1),
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff17A4A1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Email',
                controller: email,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
                controller: password,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineListPage()),
                      );
                    } else {
                      print("Not Validated");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    backgroundColor: Color(0xff1DC2D6),
                    maximumSize: Size(100, 40),
                  ),
                  child: Text('Login')),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont\'t have an account?',
                    style: TextStyle(
                      color: Color(0xff17A4A1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'RegisterPage');
                    },
                    child: Text(
                      ' Register',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
