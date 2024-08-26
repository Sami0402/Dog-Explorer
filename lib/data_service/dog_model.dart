class Dog {
  int? id;
  String? name;
  String? breedGroup;
  String? size;
  String? lifespan;
  String? origin;
  String? temperament;
  List<String>? colors;
  String? description;
  String? image;

  Dog(
      {this.id,
      this.name,
      this.breedGroup,
      this.size,
      this.lifespan,
      this.origin,
      this.temperament,
      this.colors,
      this.description,
      this.image});

  Dog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    breedGroup = json['breed_group'];
    size = json['size'];
    lifespan = json['lifespan'];
    origin = json['origin'];
    temperament = json['temperament'];
    colors = json['colors'].cast<String>();
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['breed_group'] = this.breedGroup;
    data['size'] = this.size;
    data['lifespan'] = this.lifespan;
    data['origin'] = this.origin;
    data['temperament'] = this.temperament;
    data['colors'] = this.colors;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
