import 'package:flutter/material.dart';
import 'mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 55, 121, 55),
          onPrimary: Colors.white,
          secondary: Colors.grey,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Color.fromARGB(255, 55, 121, 55)),
          bodyLarge: TextStyle(color: Color.fromARGB(255, 55, 121, 55)),
          bodyMedium: TextStyle(color: Color.fromARGB(255, 55, 121, 55)),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/upnLogo.png',
                height: 80.0,
              ),
              usernameField(),
              passwordField(),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 8),
          TextFormField(
            onChanged: (value) {
              username = value;
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: const TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white),
          ),
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          Color textColor;
          Color backgroundColor;

          if (username == 'admin' && password == 'admin') {
            setState(() {
              text = 'Login Berhasil !';
              isLoginSuccess = true;
            });
            textColor = const Color.fromARGB(255, 55, 121, 55);
            backgroundColor = Colors.white;

            // Navigate to main page on success
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainPage()), // Updated
            );
          } else {
            setState(() {
              text = 'Login Gagal!';
              isLoginSuccess = false;
            });
            textColor = Colors.white;
            backgroundColor = const Color.fromARGB(255, 55, 121, 55);
          }

          SnackBar snackBar = SnackBar(
            content: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            backgroundColor: backgroundColor,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
