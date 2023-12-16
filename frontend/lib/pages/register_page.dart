import 'package:flutter/material.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _ConfirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 247, 247),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
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
            Text(
              'Pharmacy App',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xff17A4A1),
                fontFamily: 'Pacifico',
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
              hintText: 'Email',
              controller: _emailController,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Enter Password',
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Confirm Password',
              controller: _ConfirmPasswordController,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'REGISTER',
              width: double.infinity,
              height: 60,
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
    );
  }
}
