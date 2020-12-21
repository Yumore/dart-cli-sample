/*
 * @Author: Nathaniel
 * @Date: 2020-12-21 15:00:21
 */
import 'dart:async';
import 'dart:html';
import 'dart:convert';

UListElement wordList = querySelector('#wordList');

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
}

Future<void> makeRequest(Event _) async {
  const path = 'https://dart.dev/f/portmanteaux.json';
  final httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

// 请求完成
void requestComplete(HttpRequest request) {
  switch (request.status) {
    case 200:
      processResponse(request.responseText);
      return;
    default:
      final li = LIElement()..text = 'Request failed, status=${request.status}';
      wordList.children.add(li);
  }
}

// 处理请求结果将数据以ul-li的形式写入wordList节点
void processResponse(String jsonString) {
  for (final portmanteau in json.decode(jsonString)) {
    wordList.children.add(LIElement()..text = portmanteau);
  }
}
