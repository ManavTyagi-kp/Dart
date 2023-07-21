// inherited 🚫
// implemented ✅
// generated ✅
interface class Toy{
  String play(String toy){
    return "I'm playing with $toy";
  }
}

base class BaseClass{
  void baseMethod([String? name]){
    print('Hi $name, this is base class');
  } 
}

// inherited ✅
// implemented 🚫
// generated ✅
abstract class Abs{
  void method(String str);
  void method2(String lname){
    print('method2');
  }
}

void main(List<String> args){
  // Abstract classes can't be instantiated.
  // Try creating an instance of a concrete subtype.
  // Seal().sealMethod(name: 'manav');

  BaseClass().baseMethod('manav');

  // Abstract classes can't be instantiated.
  // Try creating an instance of a concrete subtype.
  // Abs().method('name');

  Extender().method('manav');


}

// inherited 🚫
// implemented 🚫
// generated 🚫
sealed class Seal{
  void sealMethod({required String? name}){
    print('Hi $name, this is sealed class');
  }
}

class Extender extends Abs{
  @override
  void method(String name) {
    print('Hi $name, this is extended class for abstract class');
  }
}

class Implementer implements Toy{
  @override
  String play(String toy) {
    // TODO: implement play
    throw UnimplementedError();
  }

}







