//* This file has the model used to get the data from the API
class CatBreed {
  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String intelligence;
  final String referenceImageId;
  final String? actualURL;

  CatBreed({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.intelligence,
    required this.referenceImageId,
    this.actualURL,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      intelligence: json['intelligence'].toString(),
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'temperament': temperament,
      'origin': origin,
      'intelligence': intelligence,
      'reference_image_id': referenceImageId,
    };
  }

  CatBreed copyWith({String? actualURL}) {
    return CatBreed(
      id: id,
      name: name,
      description: description,
      temperament: temperament,
      origin: origin,
      intelligence: intelligence,
      referenceImageId: referenceImageId,
      actualURL: actualURL ?? this.actualURL,
    );
  }
}
