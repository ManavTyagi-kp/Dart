import 'api_maintainers.dart';
void main(List<String> args){
  var v = Vehicle();
  print(v.speed);
  v._speed = -1;
  print(v._speed);
  v.drive(speed: 50);
}

class Vehicle{
  int _speed = 0;
  int get speed => _speed;
  set newspeed (int newSpeed) {
    if(newSpeed < 0){
      throw Exception("Speed can't be below 0");
    }
    _speed = newSpeed;
  }

  void drive({required int speed}){
    newspeed = speed;
    print('Accelerating to: $speed km/h');
  }
}

interface class Test implements Toy{
  @override
  String play(String toy) {
    // TODO: implement play
    throw UnimplementedError();
  }

}

