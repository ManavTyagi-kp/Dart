// inherited 🚫 //can extend in the same library
// implemented ✅
// construct ✅
interface class Toy {
  String play(String toy) {
    return "I'm playing with $toy";
  }

  void stopPlay(){
  }
}

class InterFuckingFace implements Toy {
  @override
  String play(String toy) {
    // TODO: implement play
    throw UnimplementedError();
  }
  
  @override
  void stopPlay() {
    // TODO: implement stopPlay
  }
}

base class BaseClass {
  void baseMethod([String? name]) {
    print('Hi $name, this is base class');
  }
}

// inherited ✅
// implemented ✅
// construct 🚫
abstract class Abs {
  void method(String str);
  void method2(String lname) {
    print('method2');
  }
}

void main(List<String> args) {
  // *** ERROR ****
  // Abstract classes can't be instantiated.
  // Try creating an instance of a concrete subtype.
  // Seal().sealMethod(name: 'manav');

  BaseClass().baseMethod('manav');

  // *** ERROR ****
  // Abstract classes can't be instantiated.
  // Try creating an instance of a concrete subtype.
  // Abs().method('name');

  Extender().method('manav');

  FinalClass().finalMethod('manav');
}

// inherited 🚫
// implemented 🚫
// construct 🚫
sealed class Seal {
  void sealMethod({required String? name}) {
    print('Hi $name, this is sealed class');
  }
}

// inherited ✅
// implemented ✅
// construct ✅
// mix-in ✅
mixin class Mix {
  void mixMethod(String name) {
    print('Hi $name, this is method1 in mixin class');
  }

  void mixMethod2(String name) {
    print('Hi $name, this is method2 in mixin class');
  }
}

class Mixer with Mix {
  @override
  void mixMethod(String name) {
    // TODO: implement mixMethod
    super.mixMethod(name);
  }
}

// inherited 🚫
// implemented 🚫
// construct ✅
final class FinalClass {
  void finalMethod(String name) {
    print('Hi $name, this is a method in final class');
  }
}

class Extender implements Abs {
  @override
  void method(String name) {
    print('Hi $name, this is extended class for abstract class');
  }

  @override
  void method2(String lname) {
    // TODO: implement method2
  }
}

// class Implementer implements Toy {
//   @override
//   String play(String toy) {
//     // TODO: implement play
//     throw UnimplementedError();
//   }
// }

// *** ERROR ****
// The type 'ExtendFinal' must be 'base', 'final' or 'sealed' 
// because the supertype 'FinalClass' is 'final'.
// class ExtendFinal extends FinalClass{

// }
