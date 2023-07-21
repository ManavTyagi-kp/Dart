import 'setters.dart' as trucks;

void main(List<String> args){
  final veh = trucks.Vehicle();
  veh.drive(speed: 50);
  final v = Vehicle(4);
  print(v);
  print(v.toString());
  final car = Car();
  print(car);
  final bike = Cycle();
  print(bike);
  print(v.car); 
}

class Vehicle{
  final int wheelCount;
  const Vehicle(this.wheelCount);
  String get car {
    print('getter Called');
    return 'getter';
  }
  @override
  String toString(){
    return '$runtimeType with $wheelCount wheels';
  }


}

class Car extends Vehicle{
  const Car():super(4);
  // const Car(super.wheelCount);  **This is also Valid**

}

class Cycle extends Vehicle{
  const Cycle():super(2);
  // const Car(super.wheelCount);  **This is also Valid**

}

// difference between getter and creating a constructor is
// in a constructor a value is called only after constructing
// an instance of the class
// and in getter, the called value is calculated everytime the
// getter is called.