import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  DateTime start = new DateTime.now();
  print("开始时间：$start");
  int i, j, k;
  for (i = 0; i < 3; i++) {
    for(j = 0; j < 3; j++)
      taskA();
    for(k = 0; k < 5; k++)
      taskB();
  }
  DateTime end = new DateTime.now();
  print("结束时间：$end");
}

taskA() async {
  await Future.delayed(Duration(seconds: 0), delayTaskA);
}

taskB() async {
  print("Task B is running");
  await Future.delayed(Duration(seconds: 0), delayTaskB);
}

delayTaskA() {
  print("Task A is running");
  sleep(Duration(seconds: 2));
}

delayTaskB() {
  print("Task B is running");
  sleep(Duration(seconds: 1));
}
