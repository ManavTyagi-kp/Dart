void main(List<String> args) async {
  var val = await complexTask1();
  print(val);
  //Future<int> var3 = ComplexTask3();
  complexTask3('task 3 loaded').then((value) => print(value));

  print('random');

  var val2 = await complexTask2('task 2 loaded');

  print(val2);
}

Future<int> complexTask1() async {
  print('Loading....');
  var total = 0;
  for (var i = 0; i < 10000000000; i++) {
    total += i;
  }
  return Future.value(total);
}

Future<T> complexTask2<T>(var msg) {
  print('task 2 loading...');
  return Future.delayed(
    Duration(seconds: 5),
    () => msg,
  );
}

Future<T> complexTask3<T>(var msg) {
  print('task 3 loading...');
  return Future.delayed(
    Duration(seconds: 10),
    () => msg,
  );
}
