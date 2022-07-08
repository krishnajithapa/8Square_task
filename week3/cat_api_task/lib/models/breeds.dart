class Breed {
  Weight? weight;
  String? id;
  String? name;
  String? origin;
  String? temperament;

  String? description;
  String? lifeSpan;
  int? adaptability;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? natural;
  String? wikipediaUrl;
  String? referenceImageId;
  Image? image;

  Breed(
      {this.weight,
      this.id,
      this.name,
      this.origin,
      this.temperament,
      this.description,
      this.lifeSpan,
      this.adaptability,
      this.childFriendly,
      this.dogFriendly,
      this.energyLevel,
      this.healthIssues,
      this.intelligence,
      this.sheddingLevel,
      this.socialNeeds,
      this.natural,
      this.wikipediaUrl,
      this.referenceImageId,
      this.image});

  Breed.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    origin = json['origin'];
    temperament = json['temperament'];
    description = json['description'];
    lifeSpan = json['life_span'];
    adaptability = json['adaptability'];
    childFriendly = json['child_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    healthIssues = json['health_issues'];
    intelligence = json['intelligence'];
    sheddingLevel = json['shedding_level'];
    socialNeeds = json['social_needs'];
    natural = json['natural'];
    wikipediaUrl = json['wikipedia_url'];
    referenceImageId = json['reference_image_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['origin'] = origin;
    data['temperament'] = temperament;
    data['description'] = description;
    data['life_span'] = lifeSpan;
    data['adaptability'] = adaptability;
    data['child_friendly'] = childFriendly;
    data['dog_friendly'] = dogFriendly;
    data['energy_level'] = energyLevel;
    data['health_issues'] = healthIssues;
    data['intelligence'] = intelligence;
    data['shedding_level'] = sheddingLevel;
    data['social_needs'] = socialNeeds;
    data['natural'] = natural;
    data['wikipedia_url'] = wikipediaUrl;
    data['reference_image_id'] = referenceImageId;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imperial'] = imperial;
    data['metric'] = metric;
    return data;
  }
}

class Image {
  String? id;
  int? width;
  int? height;
  String? url;

  Image({this.id, this.width, this.height, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}
