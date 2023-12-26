import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/Components/custom_text_field.dart';
import 'package:frontend/models/token_model.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();
  final TextEditingController rol_idController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> register(BuildContext context, name, String email, String pass,
      String passConfir, String rol_id) async {
    Map<String, String> requestBody = {
      'name': name,
      'email': email,
      'password': pass,
      'password_confirmation': passConfir,
      'role_id': rol_id
    };
    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.104:8000/api/register'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      print("status code is ${response.statusCode}");

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        String token = json['data']['token'];
        await UserPreferences.saveRegisterToken(token);
        print('token is saved');
        print(token);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print('Exception occurred: $e');
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
                  backgroundImage:
                      AssetImage('assets/photo_2023-12-04_12-24-38.jpg'),
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
                    'Register',
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
                hintText: 'name',
                controller: nameController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Enter Password',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Confirm Password',
                controller: ConfirmPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'rol id',
                controller: rol_idController,
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print('pressed');
                  if (formKey.currentState!.validate()) {
                    register(
                        context,
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        ConfirmPasswordController.text,
                        rol_idController.text);
                  } else {
                    print("Not Validated");
                  }
                },
                child: Text('REGISTER'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already have an account?',
                    style: TextStyle(
                      color: Color(0xff17A4A1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ' Login',
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
