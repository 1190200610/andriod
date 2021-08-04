import 'Person.dart';

class Student extends Person {
  var stuId;

  Student(name, age, gender, this.stuId) : super(name, age, gender);

  @override
  String toString() {
    // TODO: implement toString
    return "This student id is $stuId, the name is $name";
  }
}
