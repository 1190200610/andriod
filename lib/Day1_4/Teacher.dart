import 'Person.dart';

/// 子类/////////////////////////////////////////////
class Teacher extends Person{
  var stuffId;
  Teacher(this.stuffId):super("a",12,"male");
  @override
  String toString(){
    return "This student id is: $stuffId,the default name is ${super.name}, the age is $age";
  }
}