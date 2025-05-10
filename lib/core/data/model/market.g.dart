// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMarketCollection on Isar {
  IsarCollection<Market> get markets => this.collection();
}

const MarketSchema = CollectionSchema(
  name: r'Market',
  id: 7822782226548105936,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'created': PropertySchema(
      id: 1,
      name: r'created',
      type: IsarType.string,
    ),
    r'createdInEpsilon': PropertySchema(
      id: 2,
      name: r'createdInEpsilon',
      type: IsarType.long,
    ),
    r'createdOffline': PropertySchema(
      id: 3,
      name: r'createdOffline',
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
    r'marketDays': PropertySchema(
      id: 7,
      name: r'marketDays',
      type: IsarType.string,
    ),
    r'marketType': PropertySchema(
      id: 8,
      name: r'marketType',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'pk': PropertySchema(
      id: 10,
      name: r'pk',
      type: IsarType.long,
    ),
    r'productData': PropertySchema(
      id: 11,
      name: r'productData',
      type: IsarType.object,
      target: r'ProductData',
    ),
    r'size': PropertySchema(
      id: 12,
      name: r'size',
      type: IsarType.string,
    ),
    r'updated': PropertySchema(
      id: 13,
      name: r'updated',
      type: IsarType.string,
    )
  },
  estimateSize: _marketEstimateSize,
  serialize: _marketSerialize,
  deserialize: _marketDeserialize,
  deserializeProp: _marketDeserializeProp,
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
  embeddedSchemas: {r'ProductData': ProductDataSchema},
  getId: _marketGetId,
  getLinks: _marketGetLinks,
  attach: _marketAttach,
  version: '3.1.0+1',
);

int _marketEstimateSize(
  Market object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.marketDays;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marketType;
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
    final value = object.productData;
    if (value != null) {
      bytesCount += 3 +
          ProductDataSchema.estimateSize(
              value, allOffsets[ProductData]!, allOffsets);
    }
  }
  {
    final value = object.size;
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

void _marketSerialize(
  Market object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.created);
  writer.writeLong(offsets[2], object.createdInEpsilon);
  writer.writeString(offsets[3], object.createdOffline);
  writer.writeString(offsets[4], object.errorMessage);
  writer.writeBool(offsets[5], object.hasSynced);
  writer.writeString(offsets[6], object.lastPulledTime);
  writer.writeString(offsets[7], object.marketDays);
  writer.writeString(offsets[8], object.marketType);
  writer.writeString(offsets[9], object.name);
  writer.writeLong(offsets[10], object.pk);
  writer.writeObject<ProductData>(
    offsets[11],
    allOffsets,
    ProductDataSchema.serialize,
    object.productData,
  );
  writer.writeString(offsets[12], object.size);
  writer.writeString(offsets[13], object.updated);
}

Market _marketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Market();
  object.address = reader.readStringOrNull(offsets[0]);
  object.created = reader.readStringOrNull(offsets[1]);
  object.createdInEpsilon = reader.readLongOrNull(offsets[2]);
  object.createdOffline = reader.readStringOrNull(offsets[3]);
  object.errorMessage = reader.readStringOrNull(offsets[4]);
  object.hasSynced = reader.readBoolOrNull(offsets[5]);
  object.id = id;
  object.lastPulledTime = reader.readStringOrNull(offsets[6]);
  object.marketDays = reader.readStringOrNull(offsets[7]);
  object.marketType = reader.readStringOrNull(offsets[8]);
  object.name = reader.readStringOrNull(offsets[9]);
  object.pk = reader.readLong(offsets[10]);
  object.productData = reader.readObjectOrNull<ProductData>(
    offsets[11],
    ProductDataSchema.deserialize,
    allOffsets,
  );
  object.size = reader.readStringOrNull(offsets[12]);
  object.updated = reader.readStringOrNull(offsets[13]);
  return object;
}

P _marketDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readObjectOrNull<ProductData>(
        offset,
        ProductDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _marketGetId(Market object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _marketGetLinks(Market object) {
  return [];
}

void _marketAttach(IsarCollection<dynamic> col, Id id, Market object) {
  object.id = id;
}

extension MarketByIndex on IsarCollection<Market> {
  Future<Market?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  Market? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<Market?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<Market?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(Market object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(Market object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<Market> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<Market> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension MarketQueryWhereSort on QueryBuilder<Market, Market, QWhere> {
  QueryBuilder<Market, Market, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Market, Market, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }

  QueryBuilder<Market, Market, QAfterWhere> anyCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdInEpsilon'),
      );
    });
  }
}

extension MarketQueryWhere on QueryBuilder<Market, Market, QWhereClause> {
  QueryBuilder<Market, Market, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Market, Market, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> idBetween(
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

  QueryBuilder<Market, Market, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> pkNotEqualTo(int pk) {
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

  QueryBuilder<Market, Market, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<Market, Market, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<Market, Market, QAfterWhereClause> pkBetween(
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

  QueryBuilder<Market, Market, QAfterWhereClause> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [null],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'created',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdEqualTo(
      String? created) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'created',
        value: [created],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdNotEqualTo(
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

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [null],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdInEpsilon',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonEqualTo(
      int? createdInEpsilon) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdInEpsilon',
        value: [createdInEpsilon],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonNotEqualTo(
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

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonGreaterThan(
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

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonLessThan(
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

  QueryBuilder<Market, Market, QAfterWhereClause> createdInEpsilonBetween(
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

  QueryBuilder<Market, Market, QAfterWhereClause> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [null],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updated',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> updatedEqualTo(
      String? updated) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updated',
        value: [updated],
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterWhereClause> updatedNotEqualTo(
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

extension MarketQueryFilter on QueryBuilder<Market, Market, QFilterCondition> {
  QueryBuilder<Market, Market, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'created',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdContains(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'created',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdInEpsilonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
      createdInEpsilonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdInEpsilon',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdInEpsilonEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdInEpsilon',
        value: value,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdInEpsilonLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdInEpsilonBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
      createdOfflineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdOffline',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineContains(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> createdOfflineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
      createdOfflineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdOffline',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageContains(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> hasSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> hasSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasSynced',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> hasSyncedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
      lastPulledTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPulledTime',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeContains(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> lastPulledTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition>
      lastPulledTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastPulledTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketDays',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketDays',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marketDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marketDays',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketDays',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marketDays',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marketType',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marketType',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marketType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marketType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketType',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> marketTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marketType',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> pkEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> pkGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> pkBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> productDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productData',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> productDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productData',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> sizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updated',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedEqualTo(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedGreaterThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedLessThan(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedBetween(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedStartsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedEndsWith(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedContains(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedMatches(
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

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updated',
        value: '',
      ));
    });
  }

  QueryBuilder<Market, Market, QAfterFilterCondition> updatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updated',
        value: '',
      ));
    });
  }
}

extension MarketQueryObject on QueryBuilder<Market, Market, QFilterCondition> {
  QueryBuilder<Market, Market, QAfterFilterCondition> productData(
      FilterQuery<ProductData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'productData');
    });
  }
}

extension MarketQueryLinks on QueryBuilder<Market, Market, QFilterCondition> {}

extension MarketQuerySortBy on QueryBuilder<Market, Market, QSortBy> {
  QueryBuilder<Market, Market, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByMarketDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketDays', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByMarketDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketDays', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByMarketType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketType', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByMarketTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketType', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> sortByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }
}

extension MarketQuerySortThenBy on QueryBuilder<Market, Market, QSortThenBy> {
  QueryBuilder<Market, Market, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreatedInEpsilonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdInEpsilon', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreatedOffline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByCreatedOfflineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdOffline', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByHasSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSynced', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByLastPulledTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByLastPulledTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPulledTime', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByMarketDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketDays', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByMarketDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketDays', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByMarketType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketType', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByMarketTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketType', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.asc);
    });
  }

  QueryBuilder<Market, Market, QAfterSortBy> thenByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updated', Sort.desc);
    });
  }
}

extension MarketQueryWhereDistinct on QueryBuilder<Market, Market, QDistinct> {
  QueryBuilder<Market, Market, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByCreated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByCreatedInEpsilon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdInEpsilon');
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByCreatedOffline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdOffline',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByErrorMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByHasSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSynced');
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByLastPulledTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPulledTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByMarketDays(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marketDays', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByMarketType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marketType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctBySize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Market, Market, QDistinct> distinctByUpdated(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updated', caseSensitive: caseSensitive);
    });
  }
}

extension MarketQueryProperty on QueryBuilder<Market, Market, QQueryProperty> {
  QueryBuilder<Market, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Market, int?, QQueryOperations> createdInEpsilonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdInEpsilon');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> createdOfflineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdOffline');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<Market, bool?, QQueryOperations> hasSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSynced');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> lastPulledTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPulledTime');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> marketDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marketDays');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> marketTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marketType');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Market, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<Market, ProductData?, QQueryOperations> productDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productData');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<Market, String?, QQueryOperations> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updated');
    });
  }
}
