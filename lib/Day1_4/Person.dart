/// 面向对象
abstract class Person {
  var name;
  var age;
  var gender;

  Person(this.name, this.age, this.gender);

  @override
  String toString() {
    return 'Person{name: $name, age: $age, gender: $gender}';
  }

  addAge() {
    age++;
  }
}

class PrintSomething<T extends Person> {
  printing(T p) {
    p.addAge();
    print(p.toString());
  }
}


