/*
 * @Author: Nathaniel
 * @Date: 2020-12-21 14:48:00
 */
import 'dart:async';
import 'dart:convert';
import 'dart:html';

UListElement wordList = querySelector('#wordList');

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
}

Future<void> makeRequest(Event _) async {
  const path = 'https://dart.dev/f/portmanteaux.json';
  try {
    // Make the GET request
    final jsonString = await HttpRequest.getString(path);
    // The request succeeded. Process the JSON.
    processResponse(jsonString);
  } catch (e) {
    // The GET request failed. Handle the error.
    print('Couldn\'t open $path');
    wordList.children.add(LIElement()..text = 'Request failed.');
  }
}

void processResponse(String jsonString) {
  for (final portmanteau in json.decode(jsonString)) {
    wordList.children.add(LIElement()..text = portmanteau);
  }
}
