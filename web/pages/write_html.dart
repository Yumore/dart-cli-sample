/*
 * @Author: Nathaniel
 * @Date: 2020-12-21 15:25:31
 */
import 'dart:html';

InputElement toDoInput;
UListElement toDoList;
ButtonElement deleteAll;
void main() {
  querySelector('#writeData').text =
      "这是从dart写入的数据,<style='color:red'>必须要有#</color>";
  toDoInput = querySelector('#to-do-input');
  toDoList = querySelector('#to-do-list');
  toDoInput.onChange.listen(addToDoItem);
}

// 添加元素到节点
void addToDoItem(Event e) {
  var newToDo = new LIElement();
  newToDo.text = toDoInput.value;
  toDoInput.value = '';
  toDoList.children.add(newToDo);
}
