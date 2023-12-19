// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatResponseImpl _$$CatResponseImplFromJson(Map<String, dynamic> json) =>
    _$CatResponseImpl(
      breeds: (json['breeds'] as List<dynamic>?)
          ?.map((e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$CatResponseImplToJson(_$CatResponseImpl instance) =>
    <String, dynamic>{
      'breeds': instance.breeds,
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$BreedImpl _$$BreedImplFromJson(Map<String, dynamic> json) => _$BreedImpl(
      weight: json['weight'] == null
          ? null
          : Weight.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      cfaUrl: json['cfaUrl'] as String?,
      vetstreetUrl: json['vetstreetUrl'] as String?,
      vcahospitalsUrl: json['vcahospitalsUrl'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      countryCodes: json['countryCodes'] as String?,
      countryCode: json['countryCode'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      indoor: json['indoor'] as int?,
      lap: json['lap'] as int?,
      altNames: json['altNames'] as String?,
      adaptability: json['adaptability'] as int?,
      affectionLevel: json['affectionLevel'] as int?,
      childFriendly: json['childFriendly'] as int?,
      dogFriendly: json['dogFriendly'] as int?,
      energyLevel: json['energyLevel'] as int?,
      grooming: json['grooming'] as int?,
      healthIssues: json['healthIssues'] as int?,
      intelligence: json['intelligence'] as int?,
      sheddingLevel: json['sheddingLevel'] as int?,
      socialNeeds: json['socialNeeds'] as int?,
      strangerFriendly: json['strangerFriendly'] as int?,
      vocalisation: json['vocalisation'] as int?,
      experimental: json['experimental'] as int?,
      hairless: json['hairless'] as int?,
      natural: json['natural'] as int?,
      rare: json['rare'] as int?,
      rex: json['rex'] as int?,
      suppressedTail: json['suppressedTail'] as int?,
      shortLegs: json['shortLegs'] as int?,
      wikipediaUrl: json['wikipediaUrl'] as String?,
      hypoallergenic: json['hypoallergenic'] as int?,
      referenceImageId: json['referenceImageId'] as String?,
    );

Map<String, dynamic> _$$BreedImplToJson(_$BreedImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'cfaUrl': instance.cfaUrl,
      'vetstreetUrl': instance.vetstreetUrl,
      'vcahospitalsUrl': instance.vcahospitalsUrl,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'countryCodes': instance.countryCodes,
      'countryCode': instance.countryCode,
      'description': instance.description,
      'lifeSpan': instance.lifeSpan,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'altNames': instance.altNames,
      'adaptability': instance.adaptability,
      'affectionLevel': instance.affectionLevel,
      'childFriendly': instance.childFriendly,
      'dogFriendly': instance.dogFriendly,
      'energyLevel': instance.energyLevel,
      'grooming': instance.grooming,
      'healthIssues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'sheddingLevel': instance.sheddingLevel,
      'socialNeeds': instance.socialNeeds,
      'strangerFriendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressedTail': instance.suppressedTail,
      'shortLegs': instance.shortLegs,
      'wikipediaUrl': instance.wikipediaUrl,
      'hypoallergenic': instance.hypoallergenic,
      'referenceImageId': instance.referenceImageId,
    };

_$WeightImpl _$$WeightImplFromJson(Map<String, dynamic> json) => _$WeightImpl(
      imperial: json['imperial'] as String?,
      metric: json['metric'] as String?,
    );

Map<String, dynamic> _$$WeightImplToJson(_$WeightImpl instance) =>
    <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
