import 'package:pruyeba_tecnica_pragma/domain/entities/cat_breed.dart';

class CatBreedModel {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String intelligence;
  final String weightImperial;
  final String weightMetric;
  final String cfaUrl;
  final String vetstreetUrl;
  final String vcahospitalsUrl;
  final String temperament;
  final String lifeSpan;
  final bool indoor;
  final bool lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final bool experimental;
  final bool hairless;
  final bool natural;
  final bool rare;
  final bool rex;
  final bool suppressedTail;
  final bool shortLegs;
  final String wikipediaUrl;
  final bool hypoallergenic;
  final String referenceImageId;

  CatBreedModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.intelligence,
    required this.weightImperial,
    required this.weightMetric,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    return CatBreedModel(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      description: json['description'],
      intelligence: json['intelligence'].toString(),
      weightImperial: json['weight']['imperial'] ?? '',
      weightMetric: json['weight']['metric'] ?? '',
      cfaUrl: json['cfa_url'] ?? '',
      vetstreetUrl: json['vetstreet_url'] ?? '',
      vcahospitalsUrl: json['vcahospitals_url'] ?? '',
      temperament: json['temperament'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      indoor: json['indoor'] == 1,
      lap: json['lap'] == 1,
      altNames: json['alt_names'] ?? '',
      adaptability: json['adaptability'] ?? 0,
      affectionLevel: json['affection_level'] ?? 0,
      childFriendly: json['child_friendly'] ?? 0,
      dogFriendly: json['dog_friendly'] ?? 0,
      energyLevel: json['energy_level'] ?? 0,
      grooming: json['grooming'] ?? 0,
      healthIssues: json['health_issues'] ?? 0,
      sheddingLevel: json['shedding_level'] ?? 0,
      socialNeeds: json['social_needs'] ?? 0,
      strangerFriendly: json['stranger_friendly'] ?? 0,
      vocalisation: json['vocalisation'] ?? 0,
      experimental: json['experimental'] == 1,
      hairless: json['hairless'] == 1,
      natural: json['natural'] == 1,
      rare: json['rare'] == 1,
      rex: json['rex'] == 1,
      suppressedTail: json['suppressed_tail'] == 1,
      shortLegs: json['short_legs'] == 1,
      wikipediaUrl: json['wikipedia_url'] ?? '',
      hypoallergenic: json['hypoallergenic'] == 1,
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }

  CatBreed toEntity() {
    return CatBreed(
      id: id,
      name: name,
      origin: origin,
      description: description,
      intelligence: intelligence,
      weightImperial: weightImperial,
      weightMetric: weightMetric,
      cfaUrl: cfaUrl,
      vetstreetUrl: vetstreetUrl,
      vcahospitalsUrl: vcahospitalsUrl,
      temperament: temperament,
      lifeSpan: lifeSpan,
      indoor: indoor,
      lap: lap,
      altNames: altNames,
      adaptability: adaptability,
      affectionLevel: affectionLevel,
      childFriendly: childFriendly,
      dogFriendly: dogFriendly,
      energyLevel: energyLevel,
      grooming: grooming,
      healthIssues: healthIssues,
      sheddingLevel: sheddingLevel,
      socialNeeds: socialNeeds,
      strangerFriendly: strangerFriendly,
      vocalisation: vocalisation,
      experimental: experimental,
      hairless: hairless,
      natural: natural,
      rare: rare,
      rex: rex,
      suppressedTail: suppressedTail,
      shortLegs: shortLegs,
      wikipediaUrl: wikipediaUrl,
      hypoallergenic: hypoallergenic,
      referenceImageId: referenceImageId,
    );
  }
}
