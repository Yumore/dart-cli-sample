/*
 * @Author: Nathaniel
 * @Date: 2020-12-21 14:26:50
 */
import 'dart:html';

Iterable<String> thingsTodo() sync* {
  var actions = ['Walk', 'Wash', 'Feed'];
  var pets = ['cats', 'dogs'];

  for (var action in actions) {
    for (var pet in pets) {
      if (pet == 'cats' && action != 'Feed') continue;
      yield '$action the $pet';
    }
  }
}

void addTodoItem(String item) {
  print(item);

  var listElement = LIElement();
  listElement.text = item;
  todoList.children.add(listElement);
}

UListElement todoList;

void main() {
  todoList = querySelector('#todolist');
  thingsTodo().forEach(addTodoItem);
}
