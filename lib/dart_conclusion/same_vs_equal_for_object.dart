/// [Same vs Equal ] :So there is a difference between objects being the same, and objects being equal.

/// [Comparing objects in Dart]
/// The most obvious way to compare two objects is of course the == operator.
/// [the == operator]: This will in fact check for [equality].
/// To check if two objects are [the same] instance, we should use [identical()] .

/// [identical(obj1,obj2)]  : Check whether two references are to the same object

/// When we want two instances to be considered [equal], we must [override == operator and hashcode] on that class.

enum Color { blue, green, red }

enum Make { audi, jaguar, tesla }

class Car extends Object{
  final Color color;
  final Make make;
  final int year;

  const Car({
    required this.color,
    required this.make,
    required this.year,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Car &&
          runtimeType == other.runtimeType &&
          make == other.make &&
          year == other.year &&
          color == other.color;

  @override
  int get hashCode => color.hashCode ^ year.hashCode ^ make.hashCode;
}

class CarModel extends Car {
  CarModel({required super.color, required super.make, required super.year});
  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      color: map['color'],
      make: map['make'],
      year: map['year'],
    );
  }
}



void main() {


  // car1 and car2 as the refrence for the same object
  Car car1 = const Car(color: Color.blue, make: Make.audi, year: 2022);
  Car car2 = const Car(color: Color.blue, make: Make.audi, year: 2022);


  print(car1.hashCode);
  print(car2.hashCode);
  print(car1 == car2); // true
  print(identical(car1, car2)); // true

  /// Create three instances that are not the same, using [toSet()].
  /// check hashcode and == then return one instance.
  List<CarModel> carModels =
      List<CarModel>.from((listOfMap).map((e) => CarModel.fromMap(e)))
          .toSet()
          .toList(); //1

  print(carModels.length);
}

List<Map<String, dynamic>> listOfMap = const [
  {
    'color': Color.blue,
    'make': Make.audi,
    'year': 2022,
  },
  {
    'color': Color.blue,
    'make': Make.audi,
    'year': 2022,
  },
  {
    'color': Color.blue,
    'make': Make.audi,
    'year': 2022,
  },
];
