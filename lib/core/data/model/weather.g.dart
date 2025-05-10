// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeatherCollection on Isar {
  IsarCollection<Weather> get weathers => this.collection();
}

const WeatherSchema = CollectionSchema(
  name: r'Weather',
  id: 1917014909070542811,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.string,
    ),
    r'createdInEpsilon': PropertySchema(
      id: 1,
      name: r'createdInEpsilon',
      type: IsarType.long,
    ),
    r'createdOffline': PropertySchema(
      id: 2,
      name: r'createdOffline',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 4,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'hasSynced': PropertySchema(
      id: 5,
      name: r'hasSynced',
      type: IsarType.bool,
    ),
    r'lastPulledTime': PropertySchema(
      id: 6,
      name: r'lastPulledTime',
      type: IsarType.string,
    ),
    r'lgaId': PropertySchema(
      id: 7,
      name: r'lgaId',
      type: IsarType.long,
    ),
    r'pk': PropertySchema(
      id: 8,
      name: r'pk',
      type: IsarType.long,
    ),
    r'precipProbMean': PropertySchema(
      id: 9,
      name: r'precipProbMean',
      type: IsarType.double,
    ),
    r'precipSum': PropertySchema(
      id: 10,
      name: r'precipSum',
      type: IsarType.double,
    ),
    r'sunrise': PropertySchema(
      id: 11,
      name: r'sunrise',
      type: IsarType.string,
    ),
    r'sunset': PropertySchema(
      id: 12,
      name: r'sunset',
      type: IsarType.string,
    ),
    r'tempMax': PropertySchema(
      id: 13,
      name: r'tempMax',
      type: IsarType.double,
    ),
    r'tempMean': PropertySchema(
      id: 14,
      name: r'tempMean',
      type: IsarType.double,
    ),
    r'tempMin': PropertySchema(
      id: 15,
      name: r'tempMin',
      type: IsarType.double,
    ),
    r'updated': PropertySchema(
      id: 16,
      name: r'updated',
      type: IsarType.string,
    ),
    r'weatherCode': PropertySchema(
      id: 17,
      name: r'weatherCode',
      type: IsarType.long,
    ),
    r'windSpeedMax': PropertySchema(
      id: 18,
      name: r'windSpeedMax',
      type: IsarType.double,
    )
  },
  estimateSize: _weatherEstimateSize,
  serialize: _weatherSerialize,
  deserialize: _weatherDeserialize,
  deserializeProp: _weatherDeserializeProp,
  idName: r'id',
  indexes: {
    r'pk': IndexSchema(
      id: -4985078949141874687,
      name: r'pk',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pk',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'created': IndexSchema(
      id: 9089682803336859617,
      name: r'created',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'created',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdInEpsilon': IndexSchema(
      id: 7613178208104782269,
      name: r'createdInEpsilon',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdInEpsilon',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updated': IndexSchema(
      id: -2318325077866435473,
      name: r'updated',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updated',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _weatherGetId,
  getLinks: _weatherGetLinks,
  attach: _weatherAttach,
  version: '3.1.0+1',
);

int _weatherEstimateSize(
  Weather object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.created;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdOffline;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastPulledTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sunrise;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sunset;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updated;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weatherSerialize(
  Weather object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.created);
  writer.writeLong(offsets[1], object.createdInEpsilon);
  writer.writeString(offsets[2], object.createdOffline);
  writer.writeString(offsets[3], object.date);
  writer.writeString(offsets[4], object.errorMessage);
  writer.writeBool(offsets[5], object.hasSynced);
  writer.writeString(offsets[6], object.lastPulledTime);
  writer.writeLong(offsets[7], object.lgaId);
  writer.writeLong(offsets[8], object.pk);
  writer.writeDouble(offsets[9], object.precipProbMean);
  writer.writeDouble(offsets[10], object.precipSum);
  writer.writeString(offsets[11], object.sunrise);
  writer.writeString(offsets[12], object.sunset);
  writer.writeDouble(offsets[13], object.tempMax);
  writer.writeDouble(offsets[14], object.tempMean);
  writer.writeDouble(offsets[15], object.tempMin);
  writer.writeString(offsets[16], object.updated);
  writer.writeLong(offsets[17], object.weatherCode);
  writer.writeDouble(offsets[18], object.windSpeedMax);
}

Weather _weatherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weather();
  object.created = reader.readStringOrNull(offsets[0]);
  object.createdInEpsilon = reader.readLongOrNull(offsets[1]);
  object.createdOffline = reader.readStringOrNull(offsets[2]);
  object.date = reader.readStringOrNull(offsets[3]);
  object.errorMessage = reader.readStringOrNull(offsets[4]);
  object.hasSynced = reader.readBoolOrNull(offsets[5]);
  object.id = id;
  object.lastPulledTime = reader.readStringOrNull(offsets[6]);
  object.lgaId = reader.readLongOrNull(offsets[7]);
  object.pk = reader.readLong(offsets[8]);
  object.precipProbMean = reader.readDoubleOrNull(offsets[9]);
  object.precipSum = reader.readDoubleOrNull(offsets[10]);
  object.sunrise = reader.readStringOrNull(offsets[11]);
  object.sunset = reader.readStringOrNull(offsets[12]);
  object.tempMax = reader.readDoubleOrNull(offsets[13]);
  object.tempMean = reader.readDoubleOrNull(offsets[14]);
  object.tempMin = reader.readDoubleOrNull(offsets[15]);
  object.updated = reader.readStringOrNull(offsets[16]);
  object.weatherCode = reader.readLongOrNull(offsets[17]);
  object.windSpeedMax = reader.readDoubleOrNull(offsets[18]);
  return object;
}

P _weatherDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weatherGetId(Weather object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _weatherGetLinks(Weather object) {
  return [];
}

void _weatherAttach(IsarCollection<dynamic> col, Id id, Weather object) {
  object.id = id;
}

extension WeatherByIndex on IsarCollection<Weather> {
  Future<Weather?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  Weather? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<Weather?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<Weather?> getAllByPkSync(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'pk', values);
  }

  Future<int> deleteAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'pk', values);
  }

  int deleteAllByPkSync(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'pk', values);
  }

  Future<Id> putByPk(Weather object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(Weather object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<Weather> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<Weather> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension WeatherQueryWhereSort on QueryBuilder<Weather, Weather, QWhere> {
  QueryBuilder<Weather, Weather, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhere> anyCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdInEpsilon'),
      );
    });
  }
}

extension WeatherQueryWhere on QueryBuilder<Weather, Weather, QWhereClause> {
  QueryBuilder<Weather, Weather, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> pkNotEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pk',
              lower: [],
              upper: [pk],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pk',
              lower: [pk],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pk',
              lower: [pk],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pk',
              lower: [],
              upper: [pk],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> pkGreaterThan(
    int pk, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pk',
        lower: [pk],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> pkLessThan(
    int pk, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pk',
        lower: [],
        upper: [pk],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> pkBetween(
    int lowerPk,
    int upperPk, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pk',
        lower: [lowerPk],
        includeLower: includeLower,
        upper: [upperPk],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [null],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'created',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdEqualTo(
      String? created) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [created],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdNotEqualTo(
      String? created) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'created',
              lower: [],
              upper: [created],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'created',
              lower: [created],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'created',
              lower: [created],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'created',
              lower: [],
              upper: [created],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [null],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause>
      createdInEpsilonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdInEpsilon',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonEqualTo(
      int? createdInEpsilon) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [createdInEpsilon],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonNotEqualTo(
      int? createdInEpsilon) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdInEpsilon',
              lower: [],
              upper: [createdInEpsilon],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdInEpsilon',
              lower: [createdInEpsilon],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdInEpsilon',
              lower: [createdInEpsilon],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdInEpsilon',
              lower: [],
              upper: [createdInEpsilon],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonGreaterThan(
    int? createdInEpsilon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdInEpsilon',
        lower: [createdInEpsilon],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonLessThan(
    int? createdInEpsilon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdInEpsilon',
        lower: [],
        upper: [createdInEpsilon],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> createdInEpsilonBetween(
    int? lowerCreatedInEpsilon,
    int? upperCreatedInEpsilon, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdInEpsilon',
        lower: [lowerCreatedInEpsilon],
        includeLower: includeLower,
        upper: [upperCreatedInEpsilon],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [null],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updated',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> updatedEqualTo(
      String? updated) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [updated],
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterWhereClause> updatedNotEqualTo(
      String? updated) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updated',
              lower: [],
              upper: [updated],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updated',
              lower: [updated],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updated',
              lower: [updated],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updated',
              lower: [],
              upper: [updated],
              includeUpper: false,
            ));
      }
    });
  }
}

extension WeatherQueryFilter
    on QueryBuilder<Weather, Weather, QFilterCondition> {
  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'created',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'created',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdInEpsilonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdInEpsilonEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdInEpsilon',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdInEpsilonGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdInEpsilon',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdInEpsilonLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdInEpsilon',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdInEpsilonBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdInEpsilon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdOfflineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdOfflineGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdOffline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdOfflineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> createdOfflineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdOffline',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdOfflineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      createdOfflineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hasSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hasSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hasSyncedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      lastPulledTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      lastPulledTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPulledTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      lastPulledTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lastPulledTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastPulledTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      lastPulledTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      lastPulledTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lgaId',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lgaId',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lgaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lgaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lgaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lgaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lgaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> pkEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> pkGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> pkLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> pkBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipProbMeanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipProbMean',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      precipProbMeanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipProbMean',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipProbMeanEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipProbMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      precipProbMeanGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipProbMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipProbMeanLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipProbMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipProbMeanBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipProbMean',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipSum',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipSum',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> precipSumBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunrise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunrise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunriseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunrise',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sunset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sunset',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> sunsetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sunset',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempMax',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempMax',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempMean',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempMean',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempMean',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMeanBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempMean',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempMin',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempMin',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> tempMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updated',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> updatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherCode',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherCode',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> weatherCodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> windSpeedMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windSpeedMax',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      windSpeedMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windSpeedMax',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> windSpeedMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windSpeedMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> windSpeedMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windSpeedMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> windSpeedMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windSpeedMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> windSpeedMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windSpeedMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WeatherQueryObject
    on QueryBuilder<Weather, Weather, QFilterCondition> {}

extension WeatherQueryLinks
    on QueryBuilder<Weather, Weather, QFilterCondition> {}

extension WeatherQuerySortBy on QueryBuilder<Weather, Weather, QSortBy> {
  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByLgaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lgaId', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByLgaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lgaId', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPrecipProbMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipProbMean', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPrecipProbMeanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipProbMean', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPrecipSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipSum', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByPrecipSumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipSum', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortBySunriseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortBySunset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunset', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortBySunsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunset', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMax', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMax', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMean', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMeanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMean', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMin', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByTempMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMin', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByWeatherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCode', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByWeatherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCode', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByWindSpeedMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeedMax', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> sortByWindSpeedMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeedMax', Sort.desc);
    });
  }
}

extension WeatherQuerySortThenBy
    on QueryBuilder<Weather, Weather, QSortThenBy> {
  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByLgaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lgaId', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByLgaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lgaId', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPrecipProbMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipProbMean', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPrecipProbMeanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipProbMean', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPrecipSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipSum', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByPrecipSumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precipSum', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenBySunrise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenBySunriseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunrise', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenBySunset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunset', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenBySunsetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sunset', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMax', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMax', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMean', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMeanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMean', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMin', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByTempMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempMin', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByWeatherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCode', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByWeatherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCode', Sort.desc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByWindSpeedMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeedMax', Sort.asc);
    });
  }

  QueryBuilder<Weather, Weather, QAfterSortBy> thenByWindSpeedMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'windSpeedMax', Sort.desc);
    });
  }
}

extension WeatherQueryWhereDistinct
    on QueryBuilder<Weather, Weather, QDistinct> {
  QueryBuilder<Weather, Weather, QDistinct> distinctByCreated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdInEpsilon');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByCreatedOffline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdOffline',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByErrorMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSynced');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByLastPulledTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPulledTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByLgaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lgaId');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByPrecipProbMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipProbMean');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByPrecipSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precipSum');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctBySunrise(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunrise', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctBySunset(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sunset', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByTempMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempMax');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByTempMean() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempMean');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByTempMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempMin');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByUpdated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updated', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByWeatherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherCode');
    });
  }

  QueryBuilder<Weather, Weather, QDistinct> distinctByWindSpeedMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'windSpeedMax');
    });
  }
}

extension WeatherQueryProperty
    on QueryBuilder<Weather, Weather, QQueryProperty> {
  QueryBuilder<Weather, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Weather, int?, QQueryOperations> createdInEpsilonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdInEpsilon');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> createdOfflineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdOffline');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<Weather, bool?, QQueryOperations> hasSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSynced');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> lastPulledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPulledTime');
    });
  }

  QueryBuilder<Weather, int?, QQueryOperations> lgaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lgaId');
    });
  }

  QueryBuilder<Weather, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> precipProbMeanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipProbMean');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> precipSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precipSum');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> sunriseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunrise');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> sunsetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunset');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> tempMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempMax');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> tempMeanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempMean');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> tempMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempMin');
    });
  }

  QueryBuilder<Weather, String?, QQueryOperations> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updated');
    });
  }

  QueryBuilder<Weather, int?, QQueryOperations> weatherCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherCode');
    });
  }

  QueryBuilder<Weather, double?, QQueryOperations> windSpeedMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'windSpeedMax');
    });
  }
}
