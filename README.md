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
```shell
brew install dart
flutter
brew install protobuf
protoc --version
# Dart plugin for the protocol compiler
pub global activate protoc_plugin
# 此处建议将其加到环境变量，我的在.bash_profile写着
export PATH="$PATH:$HOME/.pub-cache/bin"
# 获取grpc-sample
git clone https://github.com/grpc/grpc-dart
cd grpc-dart/example/helloworld
pub get
dart bin/server.dart
# 在另一个终端运行
dart bin/client.dart
```

## 修改代码重新运行

```shell
# nano protos/helloworld.proto
// The greeting service definition.
service Greeter {
  // Sends a greeting
  rpc SayHello (HelloRequest) returns (HelloReply) {}
  // Sends another greeting
  // 定义方法
  rpc SayHelloAgain (HelloRequest) returns (HelloReply) {}
}

// The request message containing the user's name.
message HelloRequest {
  string name = 1;
}

// The response message containing the greetings
message HelloReply {
  string message = 1;
}

protoc --dart_out=grpc:lib/src/generated -Iprotos protos/helloworld.proto

# nano bin/server.dart
class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello, ${request.name}!';
  }

  @override
  Future<HelloReply> sayHelloAgain(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello again, ${request.name}!';
  }
}

# nano bin/client.dart
Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = GreeterClient(channel);

  final name = args.isNotEmpty ? args[0] : 'world';

  try {
    var response = await stub.sayHello(HelloRequest()..name = name);
    print('Greeter client received: ${response.message}');
    response = await stub.sayHelloAgain(HelloRequest()..name = name);
    print('Greeter client received: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}

dart bin/server.dart
# 在另一个终端运行
dart bin/client.dart Alice
```



## 实现gRPC

```shell
cd grpc-dart/example/route_guide
protoc -I protos/ protos/route_guide.proto --dart_out=grpc:lib/src/generated
dart /bin/server.dart
# 在另一个终端运行
dart /bin/client.dart
```



Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).
