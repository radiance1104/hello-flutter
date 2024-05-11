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
          TextField(
            // コントローラの割り当て
            controller: _userIdController,
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
