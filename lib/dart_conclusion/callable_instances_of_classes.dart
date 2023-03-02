// dart callable_Instances_of_classes.dart
void main() {
  Person person =
      Person(age: 30, fullName: 'Mahney Elbana', userName: 'mahney');
  print(person());
}

class Person {
  final String userName;
  final int age;
  final String fullName;

  Person({required this.userName, required this.age, required this.fullName});

  String call() {
    return ("""
    the user name is $userName
    the age is $age 
    the full name is $fullName
""");
  }
}
