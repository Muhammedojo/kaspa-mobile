// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDashboardDataCollection on Isar {
  IsarCollection<DashboardData> get dashboardDatas => this.collection();
}

const DashboardDataSchema = CollectionSchema(
  name: r'DashboardData',
  id: 7850998569344872301,
  properties: {
    r'cooperatives': PropertySchema(
      id: 0,
      name: r'cooperatives',
      type: IsarType.object,
      target: r'CooperativeStats',
    ),
    r'farmers': PropertySchema(
      id: 1,
      name: r'farmers',
      type: IsarType.object,
      target: r'FarmerStats',
    ),
    r'pk': PropertySchema(
      id: 2,
      name: r'pk',
      type: IsarType.long,
    )
  },
  estimateSize: _dashboardDataEstimateSize,
  serialize: _dashboardDataSerialize,
  deserialize: _dashboardDataDeserialize,
  deserializeProp: _dashboardDataDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {
    r'FarmerStats': FarmerStatsSchema,
    r'CooperativeStats': CooperativeStatsSchema
  },
  getId: _dashboardDataGetId,
  getLinks: _dashboardDataGetLinks,
  attach: _dashboardDataAttach,
  version: '3.1.0+1',
);

int _dashboardDataEstimateSize(
  DashboardData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      CooperativeStatsSchema.estimateSize(
          object.cooperatives, allOffsets[CooperativeStats]!, allOffsets);
  bytesCount += 3 +
      FarmerStatsSchema.estimateSize(
          object.farmers, allOffsets[FarmerStats]!, allOffsets);
  return bytesCount;
}

void _dashboardDataSerialize(
  DashboardData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CooperativeStats>(
    offsets[0],
    allOffsets,
    CooperativeStatsSchema.serialize,
    object.cooperatives,
  );
  writer.writeObject<FarmerStats>(
    offsets[1],
    allOffsets,
    FarmerStatsSchema.serialize,
    object.farmers,
  );
  writer.writeLong(offsets[2], object.pk);
}

DashboardData _dashboardDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DashboardData(
    cooperatives: reader.readObjectOrNull<CooperativeStats>(
          offsets[0],
          CooperativeStatsSchema.deserialize,
          allOffsets,
        ) ??
        CooperativeStats(),
    farmers: reader.readObjectOrNull<FarmerStats>(
          offsets[1],
          FarmerStatsSchema.deserialize,
          allOffsets,
        ) ??
        FarmerStats(),
  );
  object.id = id;
  object.pk = reader.readLong(offsets[2]);
  return object;
}

P _dashboardDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CooperativeStats>(
            offset,
            CooperativeStatsSchema.deserialize,
            allOffsets,
          ) ??
          CooperativeStats()) as P;
    case 1:
      return (reader.readObjectOrNull<FarmerStats>(
            offset,
            FarmerStatsSchema.deserialize,
            allOffsets,
          ) ??
          FarmerStats()) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dashboardDataGetId(DashboardData object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _dashboardDataGetLinks(DashboardData object) {
  return [];
}

void _dashboardDataAttach(
    IsarCollection<dynamic> col, Id id, DashboardData object) {
  object.id = id;
}

extension DashboardDataByIndex on IsarCollection<DashboardData> {
  Future<DashboardData?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  DashboardData? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<DashboardData?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<DashboardData?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(DashboardData object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(DashboardData object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<DashboardData> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<DashboardData> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension DashboardDataQueryWhereSort
    on QueryBuilder<DashboardData, DashboardData, QWhere> {
  QueryBuilder<DashboardData, DashboardData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }
}

extension DashboardDataQueryWhere
    on QueryBuilder<DashboardData, DashboardData, QWhereClause> {
  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> idBetween(
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

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> pkEqualTo(
      int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> pkNotEqualTo(
      int pk) {
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

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterWhereClause> pkBetween(
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
}

extension DashboardDataQueryFilter
    on QueryBuilder<DashboardData, DashboardData, QFilterCondition> {
  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> pkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition>
      pkGreaterThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> pkBetween(
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
}

extension DashboardDataQueryObject
    on QueryBuilder<DashboardData, DashboardData, QFilterCondition> {
  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition>
      cooperatives(FilterQuery<CooperativeStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cooperatives');
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterFilterCondition> farmers(
      FilterQuery<FarmerStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'farmers');
    });
  }
}

extension DashboardDataQueryLinks
    on QueryBuilder<DashboardData, DashboardData, QFilterCondition> {}

extension DashboardDataQuerySortBy
    on QueryBuilder<DashboardData, DashboardData, QSortBy> {
  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }
}

extension DashboardDataQuerySortThenBy
    on QueryBuilder<DashboardData, DashboardData, QSortThenBy> {
  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<DashboardData, DashboardData, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }
}

extension DashboardDataQueryWhereDistinct
    on QueryBuilder<DashboardData, DashboardData, QDistinct> {
  QueryBuilder<DashboardData, DashboardData, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }
}

extension DashboardDataQueryProperty
    on QueryBuilder<DashboardData, DashboardData, QQueryProperty> {
  QueryBuilder<DashboardData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DashboardData, CooperativeStats, QQueryOperations>
      cooperativesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cooperatives');
    });
  }

  QueryBuilder<DashboardData, FarmerStats, QQueryOperations> farmersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmers');
    });
  }

  QueryBuilder<DashboardData, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FarmerStatsSchema = Schema(
  name: r'FarmerStats',
  id: -2858636128329803049,
  properties: {
    r'female': PropertySchema(
      id: 0,
      name: r'female',
      type: IsarType.long,
    ),
    r'lastMonth': PropertySchema(
      id: 1,
      name: r'lastMonth',
      type: IsarType.long,
    ),
    r'male': PropertySchema(
      id: 2,
      name: r'male',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.long,
    )
  },
  estimateSize: _farmerStatsEstimateSize,
  serialize: _farmerStatsSerialize,
  deserialize: _farmerStatsDeserialize,
  deserializeProp: _farmerStatsDeserializeProp,
);

int _farmerStatsEstimateSize(
  FarmerStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _farmerStatsSerialize(
  FarmerStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.female);
  writer.writeLong(offsets[1], object.lastMonth);
  writer.writeLong(offsets[2], object.male);
  writer.writeLong(offsets[3], object.total);
}

FarmerStats _farmerStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmerStats(
    female: reader.readLongOrNull(offsets[0]),
    lastMonth: reader.readLongOrNull(offsets[1]),
    male: reader.readLongOrNull(offsets[2]),
    total: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _farmerStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FarmerStatsQueryFilter
    on QueryBuilder<FarmerStats, FarmerStats, QFilterCondition> {
  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> femaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'female',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      femaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'female',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> femaleEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'female',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      femaleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'female',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> femaleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'female',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> femaleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'female',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastMonth',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastMonth',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      lastMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> maleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'male',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      maleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'male',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> maleEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'male',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> maleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'male',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> maleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'male',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> maleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'male',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> totalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition>
      totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStats, FarmerStats, QAfterFilterCondition> totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FarmerStatsQueryObject
    on QueryBuilder<FarmerStats, FarmerStats, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CooperativeStatsSchema = Schema(
  name: r'CooperativeStats',
  id: -5148759189718843400,
  properties: {
    r'blacklisted': PropertySchema(
      id: 0,
      name: r'blacklisted',
      type: IsarType.long,
    ),
    r'lastMonth': PropertySchema(
      id: 1,
      name: r'lastMonth',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 2,
      name: r'total',
      type: IsarType.long,
    ),
    r'verified': PropertySchema(
      id: 3,
      name: r'verified',
      type: IsarType.long,
    )
  },
  estimateSize: _cooperativeStatsEstimateSize,
  serialize: _cooperativeStatsSerialize,
  deserialize: _cooperativeStatsDeserialize,
  deserializeProp: _cooperativeStatsDeserializeProp,
);

int _cooperativeStatsEstimateSize(
  CooperativeStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cooperativeStatsSerialize(
  CooperativeStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.blacklisted);
  writer.writeLong(offsets[1], object.lastMonth);
  writer.writeLong(offsets[2], object.total);
  writer.writeLong(offsets[3], object.verified);
}

CooperativeStats _cooperativeStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CooperativeStats(
    blacklisted: reader.readLongOrNull(offsets[0]),
    lastMonth: reader.readLongOrNull(offsets[1]),
    total: reader.readLongOrNull(offsets[2]),
    verified: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _cooperativeStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CooperativeStatsQueryFilter
    on QueryBuilder<CooperativeStats, CooperativeStats, QFilterCondition> {
  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blacklisted',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blacklisted',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blacklisted',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blacklisted',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blacklisted',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      blacklistedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blacklisted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastMonth',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastMonth',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      lastMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verified',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verified',
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verified',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verified',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verified',
        value: value,
      ));
    });
  }

  QueryBuilder<CooperativeStats, CooperativeStats, QAfterFilterCondition>
      verifiedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CooperativeStatsQueryObject
    on QueryBuilder<CooperativeStats, CooperativeStats, QFilterCondition> {}
