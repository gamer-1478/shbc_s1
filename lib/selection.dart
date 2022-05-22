import 'package:flutter/material.dart';
import 'package:shbc/login.dart';
import 'package:shbc/register.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final navToLogin = Material(
      color: Colors.green,
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()))
        },
        child: const Text('Login'),
      ),
    );

    final navToRegister = Material(
      color: Colors.blue,
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()))
        },
        child: const Text('Register'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Login/Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            navToLogin,
            const Padding(padding: EdgeInsets.all(15)),
            navToRegister,
          ]),
        ),
      ),
    );
  }
}
