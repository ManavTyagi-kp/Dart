void main(List<String> arguments) async{
    var list = [1, 6, 3];
    list.forEach(Functions().printElement);

    var greeting = Functions().sayHello;
    greeting();

    var add2 = makeAdder(2);
    var add4 = makeAdder(4);

    assert(add2(3) == 5, 'Value does not match');
    assert(add4(3) == 7);

    print(add4(3));

    // CLOSURES
    // Def1: A closure is a function that has access to parent scope, even when the scope has closed
    var str = "I'm studying dart";
    //also an example of Lambda Function
    showStr(){
      str = "I'm practising dart";
      print(str);
    }

    showStr();

    // Def2: A closure is a function object that has access to variables in its lexical scope,
    // even when the function is used outside of its original scope
    closureExample2(){
      var msg = 'This a closure function';
      say(){
        msg = 'This is an inner closure function';
        print(msg);
      }
      return say;
    }

    var speak = closureExample2();
    speak();

    // Testing Functions for Equality
    Function x;

    // Comparing top-level functions.
    x = foo;
    assert(foo == x);

    // Comparing instance methods.
    var v = A(); // Instance #1 of A
    var w = A(); // Instance #2 of A
    var y = w;
    x = w.baz;

    // These closures refer to the same instance (#2),
    // so they're equal.
    assert(y.baz == x);

    // These closures refer to different instances,
    // so they're unequal
    assert(v.baz != w.baz);

    // An iterable can be used in a for-in loop, Example:
    final iterableList = GenFun(['One', 'Two', 'Three']);

    for(final str in iterableList){
      print(str);
    }

    final numbers = getRange(1,10)
    .where((value) => value % 2 == 0);

    final recursiveNum = getrangeRecursive(1, 10);

    numbers.forEach((element) => print('Recursive $element'));

    numbers.forEach((element) => print('Non Recursive: $element'));

    // printing values fetched from the Async function
    var variable = heavyTask(10);
    print(variable);
    try {
      fetchVal(1, 10).listen((element) => print('Async Fun: $element'));
      } catch(e){
          print(e);
      }

}

// Generator Functions
// Iterable, Iterator, Yield and yield*


// ____________________________________________________
// |         |                  |                      |
// |         |  Single value    |  Zero or more values |
// |_________|__________________|______________________|
// |         |                  |                      |
// |  Sync   |  int             |   Iterable<int>      |
// |_________|__________________|______________________|
// |         |                  |                      |
// |  Async  |  Future<int>     |   Stream<int>        |
// |_________|__________________|______________________|

// ****Synchronous:****
//  A synchronous function produces output on demand immediately
class GenFun extends Iterable<String> {
  GenFun(this.generatives);
  final List<String> generatives;

  Iterator<String> get iterator =>
      generatives.iterator;
}

// Iterables with sync* and yield
// sync* is used to tell dart that the function is going
// to produce multiple values on demand
Iterable<int> getRange(int start, int finish) sync*{
  for(int i = start; i<= finish; i++){
    yield i;
  }
  
}

// A recursive function to get range
// using yield in a recursive fuunction will reduce efficienct
// as the code will yield 9 times in the first go if start is
// 1 and finish is 10, it will yield 8 times in the second run,
// 7 times in the third and so on
// Using iterable: You will have to loop over the iterable returned
// by the inner call to getRange, just so you can yield values one
// at a time.

// To tackle this:
// "yield*" is used. "yield*" can yield a whole iterable one value
// at a time. No loop required
Iterable<int> getrangeRecursive(int start, int finish) sync*{
  if(start <= finish){
    yield start;

    // Without "yield*":
    // for(final val in getrangeRecursive(start + 1, finish)) {
    //   yield val;
    // }

    // With "yield*":
    yield* getrangeRecursive(start + 1, finish);
  }
}

// ***Asynchronous***
// Async generators are similar to synchronous generators
// the only difference being that they return Stream<?>
// and they can yield values when they decide they're ready
// For Example: If you make a function to that runs a loop to add until
// a very large number is not acheived.
// if you needed just one number, you could do it using Future and then
// But, if you needed multiple numbers in a stream. That's exactly where
// you can use Async generators.
Future<int> heavyTask(int val) {
  var count = 1;
  for(var i = 0; i <= val; i++){
    count += 1;
  }
  return Future.value(count);
}

Stream<int> fetchVal(int start, int finish) async* {
  for(int i = start; i <= finish; i++){
    print(i);
    yield await heavyTask(i);
  }
}

// Testing Functions for Equality
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {}
}

// Examples of FUNCTIONS
class Functions{

  // Named parameters
  // Named parameters are optional unless they’re explicitly marked as required.
  // When defining a function, use {param1, param2, …} to specify named parameters. 
  // If you don’t provide a default value or mark a named parameter as required, 
  // their types must be nullable as their default value will be null
  void namedParam({required String? name, required int? age, int? roll}){
    print('$name $age $roll');
  }

  // Optional Positional Params
  // Wrapping a set of function parameters in []
  // marks them as optional positional parameters.
  // If you don’t provide a default value, 
  // their types must be nullable as their default value will be null:
  void optionalPositionalParam(String name, int age, [int? roll]){
    print('Oprional Param: $name $age $roll');
  }

  // Functions as first-class objects
  // You can pass a function as a parameter to another function
  void printElement(int element){
    print(element);
  }

  // Assigning a function to a variable
  void sayHello() {
    print("Hello!");
  }
  // define in main function outside class to make it work 
  
}


// Lexical Closures
Function makeAdder(int addBy){
  //print(addBy+1);
  return (int i) => addBy + i;
}
