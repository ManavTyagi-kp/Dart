// This file is about classes in dart

// classes are a blueprint of information or logic
void main(List<String> args){
   const baap = Person('Sardar Khan', 56);
   print('${baap.name} : ${baap.age}');

   const bhai = Person.onlyName(32);
   print('${bhai.name} : ${bhai.age}');

   var dada = Person.def();
   print('${dada.name} : ${dada.age}');

   var faizal = Person.badla(name: 'Faizal', age: 28);
   print('${faizal.name} : ${faizal.age}');

   var minister = Person.minister();
   print('${minister.name}: ${minister.age}');

   var minister2 = Person.minister(name: 'JP Singh', age: 32);
   print('${minister2.name}: ${minister2.age}');

   var emp = Emp('Employee', 45, 'SDE');
   print(emp.name);
   print(emp.age);
   print(emp.job);
}

class Person{
  final String name;
  final int age;

  const Person(this.name, this.age);

  const Person.onlyName(this.age)
      : name = 'Danish';

  Person.def()
    : name = 'Shahid',
      age = 88;
  
  Person.badla({
    required this.name,
    required this.age,
  });

  Person.minister({
    String? name,
    int? age,
  }) : name = name ?? 'Ramadheer',
  age = age ?? 65;

}

// Sub-classing or Inheritance
class Emp extends Person{
  String job;
  Emp(String name, int age, this.job):super(name, age);
}


