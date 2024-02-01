import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kpie_homepage/homepage4_ui.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String serverKey = '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744';

  Future<void> _login() async {
    final String apiUrl = 'https://fashionbiz.org/api/auth';
    final String deviceType = 'phone';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields.addAll({
        'server_key': serverKey,
        'username': _usernameController.text,
        'password': _passwordController.text,
        'device_type': deviceType,
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': serverKey,
      });
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final decodedResponse = json.decode(responseBody);
        //Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
        print(decodedResponse);

        if (decodedResponse['api_status'] == '200') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
        } else {
          print('Login failed. Additional details: $decodedResponse');
        }
      } else {
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      // network or other errors
      print('Error during login: $error');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/home_image.png",
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


