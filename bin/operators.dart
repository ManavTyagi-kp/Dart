// fswatch -o bin/ | xargs -n1 -I{} sh -c 'clear; dart bin/sampleApp.dart'
// above is a fswatch command, it helps in monitoring your file.
import 'dart:io';
void main(){

  // we are studying examples of operators in dart
  print('hello');

  //operator precedence
  // In operator table, each operator has higher precedence than 
  // the operators in the row that follow it


  // Arithematic Operator
  print('This is Arithematic Operator');
  assert(2+3 == 6, '');
  print('2 + 3 == ${2 + 3}');
  print('2 - 3 == ${2 - 3}');
  print('2 * 3 == ${2 * 3}');
  stdout.write('5 / 2 == '); print(5 / 2); // returns double 
  stdout.write('5 ~/ 2 == '); print(5 ~/ 2); // returns int 
  stdout.write('5 % 2 == '); print(5 % 2);
  

  /// Type test operator
  /// as     Typecast
  /// is     True if the object has specified type
  /// is!    True if the object doesn't have specified type
  
  //Person person = Person('Manav');
  Employee employee = Employee('Tyagi','SDE');
  // employee = person as Employee;
  (employee as Person).fname = 'Bob';
  // employee.fname = 'Tyagi';
  print(employee.fname);

  //print(employee);


  // BITWISE OPERATORS
  print("Bitwise Operators");
  var x = 20, y = 5;
  print("x & y = ${x & y}"); // Binary AND operator
  print("x | y = ${x | y}"); // Binary OR operator
  print("x ^ y = ${x ^ y}"); // Binary XOR operator
  print("~x = ${(~x)}");     // One's Compliment
  print("x << 2 = ${x << 2}"); // Left Shitft
  print("y >> 2 = ${y >> 2}"); // Right Shift

}
class Employee extends Person{
  String jobTitle;
  // Employee(String firstName, this.jobTitle): super(firstName);
  Employee(String fname, this.jobTitle): super(fname);
  // Employee(this.jobTitle);

  // factory Employee.fromPerson(Person person, String jobTitle){
  //   return Employee(person.fname, jobTitle);
  // }
}
class Person{
  String fname;
  // set name(String n){
  //   fname = n;
  // }
  // String get name{
  //   return fname;
  // }
  
  Person(this.fname);
  // Person.firstName(String onlyName):
  //     name = onlyName,
  //     age = 18;
}