import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shbc/home_screen.dart';

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

    _nav() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    }

    var submit = Material(
      elevation: 4,
      color: Colors.green,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        child: const Text('Login'),
        onPressed: () async {
          try {
            final credential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passController.text,
            );
            _nav();
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              Fluttertoast.showToast(
                  msg: "No user found for that email.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (e.code == 'wrong-password') {
              Fluttertoast.showToast(
                  msg: "Wrong password provided for that user.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
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
