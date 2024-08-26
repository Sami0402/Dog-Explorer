import 'dog_model.dart';

class DogList {
  List<Dog> dogs;

  DogList({required this.dogs});

  factory DogList.fromJson(List<dynamic> json) {
    List<Dog> dogList = json.map((i) => Dog.fromJson(i)).toList();
    return DogList(dogs: dogList);
  }
}
