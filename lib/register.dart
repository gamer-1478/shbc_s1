import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shbc/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController nameController = TextEditingController();

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController conPassController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var nameTextField = TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) => {nameController.text = value},
      decoration: InputDecoration(
          hintText: 'Name',
          prefixIcon: const Icon(Icons.person_rounded),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
    );

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

    var conPassTextField = TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (value) => {conPassController.text = value},
      decoration: InputDecoration(
          hintText: 'Confirm Password',
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Icons.lock),
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
        child: const Text('Register'),
        onPressed: () async {
          if (conPassController.text == passController.text) {
            try {
              final credential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passController.text,
              );
              _nav();
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                Fluttertoast.showToast(
                    msg: "The password provided is too weak",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (e.code == 'email-already-in-use') {
                Fluttertoast.showToast(
                    msg: "The account already exists for that email.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            } catch (e) {
              print(e);
            }
          } else {
            Fluttertoast.showToast(
                msg: "Confirm password and password do not match",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            nameTextField,
            const Padding(padding: EdgeInsets.all(15)),
            emailTextField,
            const Padding(padding: EdgeInsets.all(15)),
            passTextField,
            const Padding(padding: EdgeInsets.all(15)),
            conPassTextField,
            const Padding(padding: EdgeInsets.all(15)),
            submit,
          ],
        ),
      )),
    );
  }
}
