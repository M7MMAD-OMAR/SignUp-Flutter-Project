import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/main.dart';

class SinUp extends StatefulWidget {
  const SinUp({Key? key}) : super(key: key);

  @override
  _SinUpState createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {
  String _email = "";
  String _password = "";

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SinUp Page"),
        ),
        body: Container(
          padding: const EdgeInsets.only(right: 80, left: 80),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: "enter your email",
                  label: Text("Email"),
                ),
                controller: _emailController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "enter your password",
                  label: Text("Password"),
                ),
                controller: _passwordController,
              ),

              Builder(
                builder: (ctx) =>
                    ElevatedButton(
                        onPressed: () async {
                          final prfs = await SharedPreferences.getInstance();
                          prfs.setString('email', _emailController.text);
                          prfs.setString('password', _passwordController.text);

                          Navigator.of(ctx).pushReplacement(
                              MaterialPageRoute(builder: (_) =>  MyApp()));
                        },
                        child: const Text("Sign Up"),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
