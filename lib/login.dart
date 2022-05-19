import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var emailTextField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => {emailController.text = value},
      decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
    );

    var passTextField = TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (value) => {passController.text = value},
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
    );

    var submit = Material(
      elevation: 4,
      color: Colors.green,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        child: const Text('Login'),
        onPressed: () => {},
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            emailTextField,
            const Padding(padding: EdgeInsets.all(15)),
            passTextField,
            const Padding(padding: EdgeInsets.all(15)),
            submit,
          ],
        ),
      )),
    );
  }
}
