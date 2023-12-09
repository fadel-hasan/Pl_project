import 'package:flutter/material.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
                color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Email',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Password',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'REGISTER',
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
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' Login',
                  style: TextStyle(
                    color: Color(0XffC7EDE6),
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
