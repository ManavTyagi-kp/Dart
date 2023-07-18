void main(List<String> arguments){
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
    x=foo;
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
  return (int i) => addBy + i;
}
