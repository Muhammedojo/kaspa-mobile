// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlotCollection on Isar {
  IsarCollection<Plot> get plots => this.collection();
}

const PlotSchema = CollectionSchema(
  name: r'Plot',
  id: -6891091333884084029,
  properties: {
    r'cultivated': PropertySchema(
      id: 0,
      name: r'cultivated',
      type: IsarType.double,
    ),
    r'fallowHectares': PropertySchema(
      id: 1,
      name: r'fallowHectares',
      type: IsarType.double,
    ),
    r'pk': PropertySchema(
      id: 2,
      name: r'pk',
      type: IsarType.long,
    ),
    r'totalHectares': PropertySchema(
      id: 3,
      name: r'totalHectares',
      type: IsarType.double,
    )
  },
  estimateSize: _plotEstimateSize,
  serialize: _plotSerialize,
  deserialize: _plotDeserialize,
  deserializeProp: _plotDeserializeProp,
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
  embeddedSchemas: {},
  getId: _plotGetId,
  getLinks: _plotGetLinks,
  attach: _plotAttach,
  version: '3.1.0+1',
);

int _plotEstimateSize(
  Plot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _plotSerialize(
  Plot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cultivated);
  writer.writeDouble(offsets[1], object.fallowHectares);
  writer.writeLong(offsets[2], object.pk);
  writer.writeDouble(offsets[3], object.totalHectares);
}

Plot _plotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plot(
    cultivated: reader.readDoubleOrNull(offsets[0]),
    fallowHectares: reader.readDoubleOrNull(offsets[1]),
    totalHectares: reader.readDoubleOrNull(offsets[3]),
  );
  object.id = id;
  object.pk = reader.readLong(offsets[2]);
  return object;
}

P _plotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plotGetId(Plot object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _plotGetLinks(Plot object) {
  return [];
}

void _plotAttach(IsarCollection<dynamic> col, Id id, Plot object) {
  object.id = id;
}

extension PlotByIndex on IsarCollection<Plot> {
  Future<Plot?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  Plot? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<Plot?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<Plot?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(Plot object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(Plot object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<Plot> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<Plot> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension PlotQueryWhereSort on QueryBuilder<Plot, Plot, QWhere> {
  QueryBuilder<Plot, Plot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Plot, Plot, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }
}

extension PlotQueryWhere on QueryBuilder<Plot, Plot, QWhereClause> {
  QueryBuilder<Plot, Plot, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Plot, Plot, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Plot, Plot, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Plot, Plot, QAfterWhereClause> idBetween(
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

  QueryBuilder<Plot, Plot, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterWhereClause> pkNotEqualTo(int pk) {
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

  QueryBuilder<Plot, Plot, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<Plot, Plot, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<Plot, Plot, QAfterWhereClause> pkBetween(
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

extension PlotQueryFilter on QueryBuilder<Plot, Plot, QFilterCondition> {
  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cultivated',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cultivated',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cultivated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cultivated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cultivated',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> cultivatedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cultivated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fallowHectares',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fallowHectares',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fallowHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fallowHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fallowHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> fallowHectaresBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fallowHectares',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> pkEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> pkGreaterThan(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> pkBetween(
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

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalHectares',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalHectares',
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalHectares',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Plot, Plot, QAfterFilterCondition> totalHectaresBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalHectares',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlotQueryObject on QueryBuilder<Plot, Plot, QFilterCondition> {}

extension PlotQueryLinks on QueryBuilder<Plot, Plot, QFilterCondition> {}

extension PlotQuerySortBy on QueryBuilder<Plot, Plot, QSortBy> {
  QueryBuilder<Plot, Plot, QAfterSortBy> sortByCultivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cultivated', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByCultivatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cultivated', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByFallowHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fallowHectares', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByFallowHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fallowHectares', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByTotalHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHectares', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> sortByTotalHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHectares', Sort.desc);
    });
  }
}

extension PlotQuerySortThenBy on QueryBuilder<Plot, Plot, QSortThenBy> {
  QueryBuilder<Plot, Plot, QAfterSortBy> thenByCultivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cultivated', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByCultivatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cultivated', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByFallowHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fallowHectares', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByFallowHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fallowHectares', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByTotalHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHectares', Sort.asc);
    });
  }

  QueryBuilder<Plot, Plot, QAfterSortBy> thenByTotalHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHectares', Sort.desc);
    });
  }
}

extension PlotQueryWhereDistinct on QueryBuilder<Plot, Plot, QDistinct> {
  QueryBuilder<Plot, Plot, QDistinct> distinctByCultivated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cultivated');
    });
  }

  QueryBuilder<Plot, Plot, QDistinct> distinctByFallowHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fallowHectares');
    });
  }

  QueryBuilder<Plot, Plot, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<Plot, Plot, QDistinct> distinctByTotalHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHectares');
    });
  }
}

extension PlotQueryProperty on QueryBuilder<Plot, Plot, QQueryProperty> {
  QueryBuilder<Plot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Plot, double?, QQueryOperations> cultivatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cultivated');
    });
  }

  QueryBuilder<Plot, double?, QQueryOperations> fallowHectaresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fallowHectares');
    });
  }

  QueryBuilder<Plot, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<Plot, double?, QQueryOperations> totalHectaresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHectares');
    });
  }
}
