import 'package:flutter/material.dart';
import 'package:jwt_auth/screens/home.dart';
import 'package:jwt_auth/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter email";
                }
                return null;
              },
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "Email "),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isVisible,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter password";
                }
                return null;
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(isVisible == false
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  border: InputBorder.none,
                  hintText: "Pass word"),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkResponse(
              onTap: () {
                //here you need to wrote your  logic
                if (_formkey.currentState!.validate()) {
                  Authservice _auth = Authservice();

                  final user = _auth.login(emailController.text.toString(),
                      passwordController.text.toString());
                  print(user);
                  if (user! == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(user: user),
                        ));
                  }
                }
              },
              child: Container(
                height: 40,
                width: 150,
                color: Colors.amberAccent,
                child: Center(
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
