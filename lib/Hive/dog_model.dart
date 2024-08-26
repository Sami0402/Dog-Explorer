import 'package:hive/hive.dart';

part 'dog_model.g.dart';

@HiveType(typeId: 0)
class DogModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String breed;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String lifespan;

  @HiveField(5)
  final String origin;

  DogModel( 
   {
    required this.description, 
    required this.lifespan,
     required this.origin,
    required this.name,
    required this.breed,
    required this.image,
  
  });
}
