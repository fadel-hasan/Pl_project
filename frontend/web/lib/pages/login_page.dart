import 'package:flutter/material.dart';
import 'package:project/widgets/Custom_button.dart';
import 'package:project/widgets/Custom_textField.dart';

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
                    AssetImage('assets/istockphoto-1055083134-1024x1024.webp'),
              ),
            ),
            Text(
              'Warehouse',
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
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
