import 'package:flutter/material.dart';

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

    var submit = Material(
      elevation: 4,
      color: Colors.green,
      borderRadius: BorderRadius.circular(15),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        child: const Text('Register'),
        onPressed: () => {},
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
