import 'package:flutter/material.dart';
import 'package:frontend/pages/register_page.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();

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
              controller: _emailController,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'Medicine');
                },
                child: CustomButton(
                  text: 'LOGIN',
                  width: double.infinity,
                  height: 60,
                )),
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
    );
  }
}
