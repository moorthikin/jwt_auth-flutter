import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
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
    ));
  }
}
