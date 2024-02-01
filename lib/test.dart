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
  final String serverKey =
      '1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744';

  Future<void> login(BuildContext context) async {
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
        print(decodedResponse);

        if (decodedResponse['api_status'] == 200) {
          final String accessToken = decodedResponse['access_token'];
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomePage()));
        } else {
          final errorMessage = decodedResponse['error_message'] ?? 'Login failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during login: $error'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error during login: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login Page')),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            "assets/images/house.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/home_image.png",
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // White background color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.black), // Black text color
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black), // Black text color
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
               const  SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => login(context),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
