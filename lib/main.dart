import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/sinUp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prfs = await SharedPreferences.getInstance();
  String? _email = prfs.getString("email");
  String? _password = prfs.getString("password");

  runApp(_email != null && _password != null ? MyApp() : SinUp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: const [
             Text("Main Page, Fuck You!!"),
          ],
        ),
      ),
    );
  }
}
