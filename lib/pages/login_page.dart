import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ログイン'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // サービスロゴ
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/login/bluebird_fired_text.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // ユーザID
              TextField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  labelText: 'ユーザID',
                  hintText: 'ユーザIDを入力',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
  
              // パスワード
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                  hintText: 'パスワードを入力',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
  
              // ログインボタン
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromWidth(200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  print("login with userId: ${_userIdController.text}, password: ${_passwordController.text}");
                },
                child: const Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
