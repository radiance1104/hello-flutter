# README

- [ウィジェットカタログ](https://docs.flutter.dev/ui/widgets)

## ウィジェットの種類

### StatelessWidget

状態を持たないウィジェット

```dart
import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessWidget')
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // パディング
        child: Text('sample'),
      ),
    );
  }
}
```

### StatefulWidget

```dart
import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPage();
}

class _StatefulPage extends State<StatefulPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

## 標準のウィジェット

### ボタン

#### ElevatedButton

影のある若干立体的なボタン

```dart
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
)
```

#### OutlinedButton

枠線のある平べったいボタン

```dart
OutlinedButton(
    style: OutlinedButton.styleFrom(
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
```

### ウィジェットを並べる

#### Column

子要素を縦方向に並べて表示する

```dart
Column(
  children: [
    Text('上'),
    Text('中'),
    Text('下'),
  ]
)
```

#### Row

子要素を横方向に並べて表示する

```dart
Row(
  children: [
    Text('左'),
    Text('中'),
    Text('右'),
  ]
)
```

### テキストフィールド

#### TextField

TextFieldを利用するには専用のControllerインスタンスをState内に保持しなければならない。

```dart
class _LoginPage extends State<LoginPage> {
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: _userIdController,
          // キーボードの種別
          keyboardType: TextInputType.emailAddress,
          // 文字種の制限
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))
          ],
          // 見た目
          decoration: const InputDecoration(
            labelText: 'ユーザID',
            hintText: 'ユーザIDを入力',
            border: OutlineInputBorder(),
          ),
          // 変更イベント
          onChanged: (String text) {
          },
        ),
      )
    )
  }
}
```

TextFieldで入力された文字列は、割り当てたコントローラから読み取れる。

```dart
print("login with userId: ${_userIdController.text}");
```

#### TextFormField

バリデータの機能を持つテキストフィールド。

### チェックボックス

```dart
class _LoginPage extends State<LoginPage> {
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
      body: Center(
        child: Row(
          children: [
            Checkbox(
              value: _isVisiblePassword,
              onChanged: _handleChangeCheckBox,
            ),
            const Text('パスワードを表示'),
          ],
        ),
      ),
    );
  }
}
```

### 画像の表示

1. 画像ファイルを配置

2. `pubspec.yaml`にファイルを指定

    ```pubspec.yaml
      assets:
        - assets/images/login/bluebird_fired_text.png
    ```

3. ウィジェットで表示

    サイズ指定したい場合は、SizedBoxで囲み、fit属性を指定する。
    オリジナルサイズで表示する場合、これらは不要。

    ```dart
    SizedBox(
      width: 120,
      height: 120,
      child: Image.asset(
        'assets/images/login/bluebird_fired_text.png',
        fit: BoxFit.contain,
      ),
    ),
    ```

### スペーサー

#### SizedBox

縦方向や横方向に指定サイズのスペースを空ける

```dart
const SizedBox(width: 20),
const SizedBox(height: 20),
```

#### Spacer

同じchildren内のウィジェットを端まで寄せるほど最大量スペースを空ける。
Column内で使えば縦方向、Row内で使えば横方向にスペースが空く。

```dart
const Spacer(),
```

## 多言語化対応

1. flutter_localizationプラグインをインストール

    ```cli
    flutter pub add flutter_localization 
    ```

2. intlプラグインをインストール

    ```cli
    flutter pub add flutter_localizations --sdk=flutter
    ```

    インストールが成功したら、pubspec.yamlに書き込まれる

    ```pubspec.yaml
    dependencies:
      flutter_localizations:
        sdk: flutter
    ```

3. 多言語の設定

    ```cli
    flutter pub add intl:any
    ```

    インストールが成功したら、pubspec.yamlに書き込まれる

    ```pubspec.yaml
    dependencies:
      intl: any
    ```

4. MaterialAppに多言語設定を追記する

    ```main.dart
    import 'package:flutter_localizations/flutter_localizations.dart';
    ```

    ```main.dart
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
    );
    ```

5. generateフラグを立てる

    pubspec.yamlにgenerateを追記する
    ※dependencies内ではない

    ```pubspec.yaml
    flutter:
      generate: true
    ```

6. プロジェクトルートに`l10n.yaml`ファイルを追加する

    ```l10n.yaml
    arb-dir: lib/l10n
    template-arb-file: app_en.arb
    output-localization-file: app_localizations.dart
    ```

7. 言語ファイルを作成する

    `lib/l10n`フォルダを作成し、各言語ファイルを配置する

    ```lib/l10n/app_en.arb
    {
      "loginUserId": "User id",
      "loginPassword": "Password",
      "loginButton": "Log in"
    }
    ```

    ```lib/l10n/app_ja.arb
    {
      "loginUserId": "ユーザID",
      "loginPassword": "パスワード",
      "loginButton": "ログイン"
    }
    ```

8. コードを自動生成する

    下記のコマンドを実行することで、arbファイルを元にdartファイルが自動生成される。  
    このコマンドはarbファイルを変更するたびに実施すること。

    ```cli
    flutter pub get
    ```

    `.dart_tool/flutter_gen/gen_l10n`内に下記のようなファイルが自動生成される

    ```.dart_tool/flutter_gen/gen_l10n/app_localizations_en.dart
    import 'app_localizations.dart';

    /// The translations for English (`en`).
    class AppLocalizationsEn extends AppLocalizations {
      AppLocalizationsEn([String locale = 'en']) : super(locale);

      @override
      String get loginUserId => 'User id';

      @override
      String get loginPassword => 'Password';

      @override
      String get loginButton => 'Log in';
    }
    ```

9. MaterialAppにAppLocalizationsを追記する

    ```dart
    import 'package:flutter_gen/gen_l10n/app_localizations.dart';
    ```

    ```dart
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
    );
    ```

10. 各ウィジェットでテキストを読み込む

    ```dart
    import 'package:flutter_gen/gen_l10n/app_localizations.dart';
    ```

    ```dart
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // 以下のようにしてStringを読み込む
          title: Text(AppLocalizations.of(context)!.loginTitle),
        ),
      );
    }
    ```
