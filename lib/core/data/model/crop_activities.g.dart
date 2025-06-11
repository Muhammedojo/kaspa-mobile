// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_activities.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCropActivitiesCollection on Isar {
  IsarCollection<CropActivities> get cropActivities => this.collection();
}

const CropActivitiesSchema = CollectionSchema(
  name: r'CropActivities',
  id: 4475537918842996404,
  properties: {
    r'activity': PropertySchema(
      id: 0,
      name: r'activity',
      type: IsarType.object,
      target: r'ActivityObject',
    ),
    r'farmCropId': PropertySchema(
      id: 1,
      name: r'farmCropId',
      type: IsarType.long,
    ),
    r'isComplete': PropertySchema(
      id: 2,
      name: r'isComplete',
      type: IsarType.bool,
    ),
    r'pk': PropertySchema(
      id: 3,
      name: r'pk',
      type: IsarType.long,
    )
  },
  estimateSize: _cropActivitiesEstimateSize,
  serialize: _cropActivitiesSerialize,
  deserialize: _cropActivitiesDeserialize,
  deserializeProp: _cropActivitiesDeserializeProp,
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
  embeddedSchemas: {r'ActivityObject': ActivityObjectSchema},
  getId: _cropActivitiesGetId,
  getLinks: _cropActivitiesGetLinks,
  attach: _cropActivitiesAttach,
  version: '3.1.0+1',
);

int _cropActivitiesEstimateSize(
  CropActivities object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activity;
    if (value != null) {
      bytesCount += 3 +
          ActivityObjectSchema.estimateSize(
              value, allOffsets[ActivityObject]!, allOffsets);
    }
  }
  return bytesCount;
}

void _cropActivitiesSerialize(
  CropActivities object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ActivityObject>(
    offsets[0],
    allOffsets,
    ActivityObjectSchema.serialize,
    object.activity,
  );
  writer.writeLong(offsets[1], object.farmCropId);
  writer.writeBool(offsets[2], object.isComplete);
  writer.writeLong(offsets[3], object.pk);
}

CropActivities _cropActivitiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CropActivities();
  object.activity = reader.readObjectOrNull<ActivityObject>(
    offsets[0],
    ActivityObjectSchema.deserialize,
    allOffsets,
  );
  object.farmCropId = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.isComplete = reader.readBoolOrNull(offsets[2]);
  object.pk = reader.readLong(offsets[3]);
  return object;
}

P _cropActivitiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ActivityObject>(
        offset,
        ActivityObjectSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cropActivitiesGetId(CropActivities object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cropActivitiesGetLinks(CropActivities object) {
  return [];
}

void _cropActivitiesAttach(
    IsarCollection<dynamic> col, Id id, CropActivities object) {
  object.id = id;
}

extension CropActivitiesByIndex on IsarCollection<CropActivities> {
  Future<CropActivities?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  CropActivities? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<CropActivities?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<CropActivities?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(CropActivities object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(CropActivities object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<CropActivities> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<CropActivities> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension CropActivitiesQueryWhereSort
    on QueryBuilder<CropActivities, CropActivities, QWhere> {
  QueryBuilder<CropActivities, CropActivities, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }
}

extension CropActivitiesQueryWhere
    on QueryBuilder<CropActivities, CropActivities, QWhereClause> {
  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> idBetween(
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

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> pkEqualTo(
      int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> pkNotEqualTo(
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

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<CropActivities, CropActivities, QAfterWhereClause> pkBetween(
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

extension CropActivitiesQueryFilter
    on QueryBuilder<CropActivities, CropActivities, QFilterCondition> {
  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      activityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activity',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      activityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activity',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmCropId',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmCropId',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmCropId',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmCropId',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmCropId',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      farmCropIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmCropId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
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

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      isCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isComplete',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      isCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isComplete',
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      isCompleteEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition> pkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
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

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition>
      pkLessThan(
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

  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition> pkBetween(
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

extension CropActivitiesQueryObject
    on QueryBuilder<CropActivities, CropActivities, QFilterCondition> {
  QueryBuilder<CropActivities, CropActivities, QAfterFilterCondition> activity(
      FilterQuery<ActivityObject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'activity');
    });
  }
}

extension CropActivitiesQueryLinks
    on QueryBuilder<CropActivities, CropActivities, QFilterCondition> {}

extension CropActivitiesQuerySortBy
    on QueryBuilder<CropActivities, CropActivities, QSortBy> {
  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      sortByFarmCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmCropId', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      sortByFarmCropIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmCropId', Sort.desc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      sortByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      sortByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }
}

extension CropActivitiesQuerySortThenBy
    on QueryBuilder<CropActivities, CropActivities, QSortThenBy> {
  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      thenByFarmCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmCropId', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      thenByFarmCropIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmCropId', Sort.desc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      thenByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy>
      thenByIsCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplete', Sort.desc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<CropActivities, CropActivities, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }
}

extension CropActivitiesQueryWhereDistinct
    on QueryBuilder<CropActivities, CropActivities, QDistinct> {
  QueryBuilder<CropActivities, CropActivities, QDistinct>
      distinctByFarmCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmCropId');
    });
  }

  QueryBuilder<CropActivities, CropActivities, QDistinct>
      distinctByIsComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComplete');
    });
  }

  QueryBuilder<CropActivities, CropActivities, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }
}

extension CropActivitiesQueryProperty
    on QueryBuilder<CropActivities, CropActivities, QQueryProperty> {
  QueryBuilder<CropActivities, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CropActivities, ActivityObject?, QQueryOperations>
      activityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activity');
    });
  }

  QueryBuilder<CropActivities, int?, QQueryOperations> farmCropIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmCropId');
    });
  }

  QueryBuilder<CropActivities, bool?, QQueryOperations> isCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComplete');
    });
  }

  QueryBuilder<CropActivities, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }
}
