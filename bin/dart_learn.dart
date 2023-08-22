import 'dart:mirrors';

import 'package:dart_learn/dart_learn.dart' as dart_learn;

import 'api_maintainers.dart';

// TODO:  calling a class as a function. Important

// Every app must have a top-level main() function,
// which serves as the entrypoint to the app.
// The main() function returns void and has an optional List<String> parameter for arguments.
void main(List<String> arguments) {
  // print('Hello world: ${dart_learn.calculate()}!');
  funVar();
  // consttructor calling
  final myObject = Fraction(12, 4);
  print('${myObject._numerator}');
  print('${myObject._rational}');
  Musician().genre();
  //Musician().usingGenre();

  Fraction fraction2 = Fraction.fromDecimal(2.0);
  print('Constructor Example: ${fraction2._rational}');

  // Using alias name to define
  // number with fun1 function
  TypedefSampleFun number = fun1;
  // Calling number
  number(1, 2);

  // Redefining number
  // with fun2 function
  number = fun2;
  // Calling number
  number(3, 4);

  FactoryConst._default();

  //Functions().namedParam(name: 'manav', age: 18, roll: 25);
  //Functions().optionalPositionalParam('tyagi', 23);

  // void printElement(int element){
  //   print(element);
  // }
  //   var list = [1, 6, 3];
  //   list.forEach(printElement);
}

class Toppings<t extends Object> {
  Toppings();
  var toppings = <dynamic>['onion', 'tomato'];
  Toppings.topping(this.toppings);
}

//CONSTRUCTORS
// optional named constructors cannot be private
// Fraction({this._numerator, this._denominator}) **Doesn't compile**
// above code doesn't compile
// Fraction([this._numerator, this._denominator]) **Compiles**
// However, you can have private positional parameters
class Fraction {
  final int _numerator;
  final int _denominator;
  late final double _rational;

  Fraction(this._numerator, this._denominator) {
    // Future<double> _rational = Future.delayed(Duration(seconds: 6), (){
    // return _numerator/_denominator;});

    _rational = _numerator / _denominator;
  }

  // Named Constructors
  // They are the only alternative to have multiple constructors
  // since dart has no method overload
  Fraction.zero()
      : _numerator = 0,
        _denominator = 1;

  // ANOTHER EXAMPLE
  Fraction.fromDecimal(double decimal)
      : _numerator = decimal.toInt(),
        _denominator = 1,
        _rational = decimal;

  // Redirecting constructor
  // can be used to implement constructors that does the same thing
  // as another constructor. can be used to avoid code duplication
  Fraction.oneHalf() : this(1, 2);
  Fraction.whole(int val) : this(val, 1);
  // Fraction.oneHalf is just another way to call Fraction.
  // But this method avoids code repetion.
  // This feature can be very useful when combined with named constructors
  // END
}

class FactoryConst {
  // Factory Contructor
  // The "factory" keyword returns an instance of the given class that's not necessarily a new one.
  // It can be useful when:
  // > You want to return an instance of a class instead of the class itself
  // > You want to implement a singleton (the Singleton pattern) //??????????
  // > you want to return an instance from the cache

  // Factory constructors are like static methods(???) and so you don't have access to "this"
  // There cannot be a factory and a "normal" constructor with the same name.

  var data = <int>[1, 2, 3, 4];
  //static final _objects = List<BigObject>.add("obj", 5, ${data})();
  static final List<BigObject> objects = [];
  factory FactoryConst(BigObject obj) {
    if (!objects.contains(obj)) {
      objects.add(obj);
    }

    return FactoryConst._default();
  }

  FactoryConst._default() {
    print("Example of Factory Constructor");
  }
}

class BigObject {
  late final String name;
  late final int size;
  late final List<int> data;

  BigObject(this.name, this.size, this.data) {
    // Additional initialization or logic can be added here
  }
  BigObject.add(String name, int size, List<int> data) : this(name, size, data);
}

// initializer list
// the following can be used if you wanted to
// keep private constructors name hidden, i.e
// call them with a different name.
// Initializer list are executed before the body
// and thus variables are immediately initialized.
// No need for nullable types or late.
class Initializer {
  int _secret;
  double _stillSecret;

  Initializer(int age, double money)
      : _secret = age,
        _stillSecret = money;
}

// CLASS MODIFIERS FOR API MAINTAINERS
// "Mix-In Modifier"
// Mixins are a way of defining code that can be reused in multiple class hierarchies
// "with" keyword is used to use Mixins
mixin Musical {
  void genre() {
    print("genre presented here");
  }
}

class Musician with Musical {
  @override
  void genre() {
    print("genre in mixin");
    usingGenre();
  }

  void usingGenre() {
    super.genre();
  }
}

//Sealed modifier
sealed class Amigo {}

class Lucky extends Amigo {}

class Dusty extends Amigo {}

class Ned extends Amigo {}

// class SealedExample {
//   String lastName(Amigo amigo) =>
//   switch (amigo){
//     case Lucky _ => 'Day';
//     case Dusty _ => 'Bottoms';
//     case Ned _ => 'Day';
//   }
// }

// Dart program to show the usage of typedef

// Defining alias name
typedef TypedefSampleFun(int a, int b);

// Defining Geek1 function
fun1(int a, int b) {
  print("This is Geek1");
  print("$a and $b are lucky geek numbers !!");
}

// Defining Geek2 function
fun2(int a, int b) {
  print("This is Geek2");
  print("$a + $b is equal to ${a + b}.");
}

void funVar() {
  var value; //this is preferred
  String name; // expilit type casting is not preferred

  // var pizza = List<List<Toppings>>();
  var newList = <int>[1, 2, 4];
  var t = Toppings<int>.topping(newList);
  for (var topping in t.toppings) {
    print('$topping');
  }
}
