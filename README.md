A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## 创建项目并运行
   ``` shell
   dart create -t console-full dart_cli_sample
   cd dart_cli_sample
   dart run
   ```
### 编译成正式成品
```shell
 dart compile exe bin/dart_cli_sample.dart
```
## 安装dart-server环境
brew install dart
flutter
brew install protobuf
protoc --version
// Dart plugin for the protocol compiler
pub global activate protoc_plugin


Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
