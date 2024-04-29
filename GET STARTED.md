# Flutterメモ

## 環境構築

[Get Started for macOS](https://docs.flutter.dev/get-started/install/macos)

### 1. Xcodeをインストールする

1. App StoreでXcodeをインストール

1. ライセンスに同意する

```cli
% sudo softwareupdate --install-rosetta --agree-to-license
Password:
By using the agreetolicense option, you are agreeing that you have run this tool with the license only option and have read and agreed to the terms.
If you do not agree, press CTRL-C and cancel this process immediately.
2024-04-29 14:58:35.150 softwareupdate[27137:71503] Package Authoring Error: 052-77538: Package reference com.apple.pkg.RosettaUpdateAuto is missing installKBytes attribute
Install of Rosetta 2 finished successfully
```

1. Xcodeを設定する

```cli
% sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
Password:
```

```cli
% sudo xcodebuild -license
・・・
agree
You can review the license in Xcode’s About window, or at: /Applications/Xcode.app/Contents/Resources/en.lproj/License.rtf
```

```cli
% xcodebuild -downloadPlatform iOS
All requested platforms are downloaded
```

```cli
% open -a Simulator
```

### 2. CocoaPodsをインストールする

1. CocoaPodsをインストール

動き出すまで時間がかかる

```cli
% sudo gem install cocoapods
Fetching addressable-2.8.6.gem
Fetching nap-1.1.0.gem
Fetching ruby-macho-2.5.1.gem
Fetching colored2-3.1.2.gem
Fetching gh_inspector-1.1.3.gem
Fetching escape-0.0.4.gem
Fetching fourflusher-2.3.1.gem
Fetching public_suffix-4.0.7.gem
Fetching rexml-3.2.6.gem
Fetching nanaimo-0.3.0.gem
Fetching claide-1.1.0.gem
Fetching atomos-0.1.3.gem
Fetching xcodeproj-1.24.0.gem
Fetching molinillo-0.8.0.gem
Fetching cocoapods-try-1.2.0.gem
Fetching netrc-0.11.0.gem
Fetching cocoapods-trunk-1.6.0.gem
Fetching cocoapods-search-1.0.1.gem
Fetching cocoapods-plugins-1.0.0.gem
Fetching cocoapods-downloader-2.1.gem
Fetching cocoapods-deintegrate-1.0.5.gem
Fetching ffi-1.16.3.gem
Fetching ethon-0.16.0.gem
Fetching typhoeus-1.4.1.gem
Fetching concurrent-ruby-1.2.3.gem
Fetching httpclient-2.8.3.gem
Fetching algoliasearch-1.27.5.gem
Fetching fuzzy_match-2.0.4.gem
Fetching drb-2.2.1.gem
Fetching base64-0.2.0.gem
Fetching connection_pool-2.4.1.gem
Fetching tzinfo-2.0.6.gem
Fetching i18n-1.14.4.gem
Fetching activesupport-7.1.3.2.gem
Fetching cocoapods-core-1.15.2.gem
Fetching cocoapods-1.15.2.gem
Successfully installed public_suffix-4.0.7
Successfully installed addressable-2.8.6
Successfully installed ruby-macho-2.5.1
Successfully installed nap-1.1.0
Successfully installed gh_inspector-1.1.3
Successfully installed fourflusher-2.3.1
Successfully installed escape-0.0.4
Successfully installed colored2-3.1.2
Successfully installed rexml-3.2.6
Successfully installed nanaimo-0.3.0
Successfully installed claide-1.1.0
Successfully installed atomos-0.1.3
Successfully installed xcodeproj-1.24.0
Successfully installed molinillo-0.8.0
Successfully installed cocoapods-try-1.2.0
Successfully installed netrc-0.11.0
Successfully installed cocoapods-trunk-1.6.0
Successfully installed cocoapods-search-1.0.1
Successfully installed cocoapods-plugins-1.0.0
Successfully installed cocoapods-downloader-2.1
Successfully installed cocoapods-deintegrate-1.0.5
Building native extensions. This could take a while...
Successfully installed ffi-1.16.3
Successfully installed ethon-0.16.0
Successfully installed typhoeus-1.4.1
Successfully installed concurrent-ruby-1.2.3
Successfully installed httpclient-2.8.3
A new major version is available for Algolia! Please now use the https://rubygems.org/gems/algolia gem to get the latest features.
Successfully installed algoliasearch-1.27.5
Successfully installed fuzzy_match-2.0.4
ERROR:  Error installing cocoapods:
	The last version of drb (>= 0) to support your Ruby & RubyGems was 2.0.6. Try installing it with `gem install drb -v 2.0.6` and then running the current command again
	drb requires Ruby version >= 2.7.0. The current ruby version is 2.6.10.210.
```

```cli
% sudo gem install drb -v 2.0.6
Password:
Fetching drb-2.0.6.gem
Fetching ruby2_keywords-0.0.5.gem
Successfully installed ruby2_keywords-0.0.5
Successfully installed drb-2.0.6
Parsing documentation for ruby2_keywords-0.0.5
Installing ri documentation for ruby2_keywords-0.0.5
Parsing documentation for drb-2.0.6
Installing ri documentation for drb-2.0.6
Done installing documentation for ruby2_keywords, drb after 0 seconds
2 gems installed
```

```cli
% sudo gem install cocoapods
Successfully installed base64-0.2.0
Successfully installed connection_pool-2.4.1
Successfully installed tzinfo-2.0.6
Successfully installed i18n-1.14.4
ERROR:  Error installing cocoapods:
	The last version of activesupport (>= 5.0, < 8) to support your Ruby & RubyGems was 6.1.7.7. Try installing it with `gem install activesupport -v 6.1.7.7` and then running the current command again
	activesupport requires Ruby version >= 2.7.0. The current ruby version is 2.6.10.210.
```

```cli
% gem install activesupport -v 6.1.7.7
Fetching activesupport-6.1.7.7.gem
Fetching zeitwerk-2.6.13.gem
Successfully installed zeitwerk-2.6.13
Successfully installed activesupport-6.1.7.7
Parsing documentation for zeitwerk-2.6.13
Installing ri documentation for zeitwerk-2.6.13
Parsing documentation for activesupport-6.1.7.7
Installing ri documentation for activesupport-6.1.7.7
Done installing documentation for zeitwerk, activesupport after 2 seconds
2 gems installed
```

```cli
% sudo gem install cocoapods
Successfully installed cocoapods-core-1.15.2
Successfully installed cocoapods-1.15.2
Parsing documentation for cocoapods-core-1.15.2
Installing ri documentation for cocoapods-core-1.15.2
Parsing documentation for cocoapods-1.15.2
Installing ri documentation for cocoapods-1.15.2
Done installing documentation for cocoapods-core, cocoapods after 3 seconds
2 gems installed
```

1. CocoaPodsの環境変数を設定する

```~/.zshenv
export PATH=$HOME/.gem/bin:$PATH
```

### 2. Android Studioをインストールする

1. Android Studioをインストール

[Android Studio](https://developer.android.com/studio?hl=ja)

1. SDK Managerを開き、下記の5つをインストールする

    - Android SDK Platform, API 34.0.0
    - Android SDK Command-line Tools
    - Android SDK Build-Tools
    - Android SDK Platform-Tools
    - Android Emulator

1. 

### 3. Flutterをインストールする

1. Flutter SDKをインストールする
    1. VS Codeに[Flutter拡張機能](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)をインストール
    1. コマンドパレットを開く(Command + Shift + P)
    1. 'flutter'を検索
    1. 'Flutter: New Project.'を選択
    1. SDKをクローンしてくるディレクトリを選択する

GitリポジトリなのでSDKバージョンを指定したいときは、Gitタグをチェックアウトする。

1. Flutterの環境変数を設定する

```~/.zprofile
# Flutter
export PATH=$HOME/git/flutter/bin:$PATH
```

1. ターミナルを再起動する

1. flutter doctorを通す

```cli
% flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.19.6, on macOS 14.4.1 23E224 darwin-arm64, locale
    ja-JP)
[!] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor
      --android-licenses
[✓] Xcode - develop for iOS and macOS (Xcode 15.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.2)
[✓] VS Code (version 1.82.2)
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 1 category.
```

```cli
% flutter doctor --android-licenses
yを繰り返す
```

```cli
% flutter doctor                   
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.19.6, on macOS 14.4.1 23E224 darwin-arm64, locale
    ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 15.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.2)
[✓] VS Code (version 1.82.2)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

### 4. 新規アプリの作成

1. コマンドパレットを開く(Command + Shift + P)
1. 'flutter'を検索
1. 'Flutter: New Project'を選択
1. 'Application'を選択
1. アプリケーションを作成するフォルダを選択する

### 5. シュミレータを開く

1. コマンドパレットを開く(Command + Shift + P)
1. 'flutter'を検索
1. 'Flutter: Select Device'を選択
1. 起動するシュミレータを選択

### 6. 実行するデバイスを選択し、デバッグ実行する

1. VS Codeのウィンドウ右下、フッターバーでデバイスを選択する
1. VS Codeのサイドバー'実行とデバッグ'を選択し、実行する
