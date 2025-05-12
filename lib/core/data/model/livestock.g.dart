// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livestock.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLivestockCollection on Isar {
  IsarCollection<Livestock> get livestocks => this.collection();
}

const LivestockSchema = CollectionSchema(
  name: r'Livestock',
  id: -2839913023256082721,
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
    r'errorMessage': PropertySchema(
      id: 3,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'hasSynced': PropertySchema(
      id: 4,
      name: r'hasSynced',
      type: IsarType.bool,
    ),
    r'lastPulledTime': PropertySchema(
      id: 5,
      name: r'lastPulledTime',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'pk': PropertySchema(
      id: 7,
      name: r'pk',
      type: IsarType.long,
    ),
    r'unit': PropertySchema(
      id: 8,
      name: r'unit',
      type: IsarType.string,
    ),
    r'updated': PropertySchema(
      id: 9,
      name: r'updated',
      type: IsarType.string,
    ),
    r'variety': PropertySchema(
      id: 10,
      name: r'variety',
      type: IsarType.string,
    )
  },
  estimateSize: _livestockEstimateSize,
  serialize: _livestockSerialize,
  deserialize: _livestockDeserialize,
  deserializeProp: _livestockDeserializeProp,
  idName: r'id',
  indexes: {
    r'pk': IndexSchema(
      id: -4985078949141874687,
      name: r'pk',
      unique: true,
      replace: true,
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
  getId: _livestockGetId,
  getLinks: _livestockGetLinks,
  attach: _livestockAttach,
  version: '3.1.0+1',
);

int _livestockEstimateSize(
  Livestock object,
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
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unit;
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
  {
    final value = object.variety;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _livestockSerialize(
  Livestock object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.created);
  writer.writeLong(offsets[1], object.createdInEpsilon);
  writer.writeString(offsets[2], object.createdOffline);
  writer.writeString(offsets[3], object.errorMessage);
  writer.writeBool(offsets[4], object.hasSynced);
  writer.writeString(offsets[5], object.lastPulledTime);
  writer.writeString(offsets[6], object.name);
  writer.writeLong(offsets[7], object.pk);
  writer.writeString(offsets[8], object.unit);
  writer.writeString(offsets[9], object.updated);
  writer.writeString(offsets[10], object.variety);
}

Livestock _livestockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Livestock();
  object.created = reader.readStringOrNull(offsets[0]);
  object.createdInEpsilon = reader.readLongOrNull(offsets[1]);
  object.createdOffline = reader.readStringOrNull(offsets[2]);
  object.errorMessage = reader.readStringOrNull(offsets[3]);
  object.hasSynced = reader.readBoolOrNull(offsets[4]);
  object.id = id;
  object.lastPulledTime = reader.readStringOrNull(offsets[5]);
  object.name = reader.readStringOrNull(offsets[6]);
  object.pk = reader.readLong(offsets[7]);
  object.unit = reader.readStringOrNull(offsets[8]);
  object.updated = reader.readStringOrNull(offsets[9]);
  object.variety = reader.readStringOrNull(offsets[10]);
  return object;
}

P _livestockDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _livestockGetId(Livestock object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _livestockGetLinks(Livestock object) {
  return [];
}

void _livestockAttach(IsarCollection<dynamic> col, Id id, Livestock object) {
  object.id = id;
}

extension LivestockByIndex on IsarCollection<Livestock> {
  Future<Livestock?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  Livestock? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<Livestock?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<Livestock?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(Livestock object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(Livestock object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<Livestock> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<Livestock> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension LivestockQueryWhereSort
    on QueryBuilder<Livestock, Livestock, QWhere> {
  QueryBuilder<Livestock, Livestock, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhere> anyCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdInEpsilon'),
      );
    });
  }
}

extension LivestockQueryWhere
    on QueryBuilder<Livestock, Livestock, QWhereClause> {
  QueryBuilder<Livestock, Livestock, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> idBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> pkNotEqualTo(int pk) {
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> pkBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [null],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'created',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdEqualTo(
      String? created) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [created],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdNotEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause>
      createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [null],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause>
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdInEpsilonEqualTo(
      int? createdInEpsilon) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [createdInEpsilon],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause>
      createdInEpsilonNotEqualTo(int? createdInEpsilon) {
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause>
      createdInEpsilonGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause>
      createdInEpsilonLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> createdInEpsilonBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [null],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updated',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> updatedEqualTo(
      String? updated) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [updated],
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterWhereClause> updatedNotEqualTo(
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

extension LivestockQueryFilter
    on QueryBuilder<Livestock, Livestock, QFilterCondition> {
  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdStartsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdEndsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdContains(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdMatches(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> createdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdInEpsilonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdInEpsilonEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdInEpsilon',
        value: value,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdInEpsilonBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineEndsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdOffline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdOffline',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      createdOfflineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> errorMessageEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> errorMessageBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageStartsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageEndsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> errorMessageMatches(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> hasSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      hasSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> hasSyncedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeEndsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastPulledTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastPulledTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      lastPulledTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> pkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> pkGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> pkBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedEqualTo(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedGreaterThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedLessThan(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedBetween(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedStartsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedEndsWith(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedContains(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedMatches(
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

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> updatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      updatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'variety',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'variety',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variety',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'variety',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'variety',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition> varietyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variety',
        value: '',
      ));
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterFilterCondition>
      varietyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'variety',
        value: '',
      ));
    });
  }
}

extension LivestockQueryObject
    on QueryBuilder<Livestock, Livestock, QFilterCondition> {}

extension LivestockQueryLinks
    on QueryBuilder<Livestock, Livestock, QFilterCondition> {}

extension LivestockQuerySortBy on QueryBuilder<Livestock, Livestock, QSortBy> {
  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy>
      sortByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByVariety() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variety', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> sortByVarietyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variety', Sort.desc);
    });
  }
}

extension LivestockQuerySortThenBy
    on QueryBuilder<Livestock, Livestock, QSortThenBy> {
  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy>
      thenByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByVariety() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variety', Sort.asc);
    });
  }

  QueryBuilder<Livestock, Livestock, QAfterSortBy> thenByVarietyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variety', Sort.desc);
    });
  }
}

extension LivestockQueryWhereDistinct
    on QueryBuilder<Livestock, Livestock, QDistinct> {
  QueryBuilder<Livestock, Livestock, QDistinct> distinctByCreated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdInEpsilon');
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByCreatedOffline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdOffline',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByErrorMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSynced');
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByLastPulledTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPulledTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByUpdated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updated', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Livestock, Livestock, QDistinct> distinctByVariety(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variety', caseSensitive: caseSensitive);
    });
  }
}

extension LivestockQueryProperty
    on QueryBuilder<Livestock, Livestock, QQueryProperty> {
  QueryBuilder<Livestock, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Livestock, int?, QQueryOperations> createdInEpsilonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdInEpsilon');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> createdOfflineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdOffline');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<Livestock, bool?, QQueryOperations> hasSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSynced');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> lastPulledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPulledTime');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Livestock, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updated');
    });
  }

  QueryBuilder<Livestock, String?, QQueryOperations> varietyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variety');
    });
  }
}
