import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // パスワードを表示するか
  bool _isVisiblePassword = false;

  // チェックボックスの変更イベント
  void _handleChangeCheckBox(bool? isChecked) {
    // Stateの更新はsetState内で行う必要がある
    setState(() {
      _isVisiblePassword = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.loginTitle),
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
                // キーボードの種別
                keyboardType: TextInputType.emailAddress,
                // 文字種の制限
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                ],
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.loginUserId,
                  hintText: AppLocalizations.of(context)!.loginUserIdPlaceholder,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
  
              // パスワード
              TextField(
                controller: _passwordController,
                // キーボードの種別
                keyboardType: TextInputType.visiblePassword,
                // 文字種の制限
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
                ],
                // 伏字にする
                obscureText: !_isVisiblePassword,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.loginPassword,
                  hintText: AppLocalizations.of(context)!.loginPasswordPlaceholder,
                  border: const OutlineInputBorder(),
                ),
              ),
  
              // パスワードを表示
              Row(
                children: [
                  Checkbox(
                    value: _isVisiblePassword,
                    onChanged: _handleChangeCheckBox,
                  ),
                  Text(AppLocalizations.of(context)!.loginVisiblePassword),
                ],
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
                child: Text(AppLocalizations.of(context)!.loginButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
