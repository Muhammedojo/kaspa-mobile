// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_visit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFarmVisitCollection on Isar {
  IsarCollection<FarmVisit> get farmVisits => this.collection();
}

const FarmVisitSchema = CollectionSchema(
  name: r'FarmVisit',
  id: 5302282623022387605,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'crop': PropertySchema(
      id: 1,
      name: r'crop',
      type: IsarType.object,
      target: r'CropData',
    ),
    r'cropId': PropertySchema(
      id: 2,
      name: r'cropId',
      type: IsarType.long,
    ),
    r'farmCrops': PropertySchema(
      id: 3,
      name: r'farmCrops',
      type: IsarType.objectList,
      target: r'FarmCrop',
    ),
    r'farmId': PropertySchema(
      id: 4,
      name: r'farmId',
      type: IsarType.long,
    ),
    r'farmerName': PropertySchema(
      id: 5,
      name: r'farmerName',
      type: IsarType.string,
    ),
    r'folioId': PropertySchema(
      id: 6,
      name: r'folioId',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 7,
      name: r'latitude',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 8,
      name: r'longitude',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'noOfHectares': PropertySchema(
      id: 10,
      name: r'noOfHectares',
      type: IsarType.long,
    ),
    r'ownershipType': PropertySchema(
      id: 11,
      name: r'ownershipType',
      type: IsarType.string,
    ),
    r'pk': PropertySchema(
      id: 12,
      name: r'pk',
      type: IsarType.long,
    ),
    r'sizeInHa': PropertySchema(
      id: 13,
      name: r'sizeInHa',
      type: IsarType.string,
    )
  },
  estimateSize: _farmVisitEstimateSize,
  serialize: _farmVisitSerialize,
  deserialize: _farmVisitDeserialize,
  deserializeProp: _farmVisitDeserializeProp,
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
    r'FarmCrop': FarmCropSchema,
    r'CropData': CropDataSchema,
    r'ProductObject': ProductObjectSchema
  },
  getId: _farmVisitGetId,
  getLinks: _farmVisitGetLinks,
  attach: _farmVisitAttach,
  version: '3.1.0+1',
);

int _farmVisitEstimateSize(
  FarmVisit object,
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
    final value = object.crop;
    if (value != null) {
      bytesCount += 3 +
          CropDataSchema.estimateSize(value, allOffsets[CropData]!, allOffsets);
    }
  }
  bytesCount += 3 + object.farmCrops.length * 3;
  {
    final offsets = allOffsets[FarmCrop]!;
    for (var i = 0; i < object.farmCrops.length; i++) {
      final value = object.farmCrops[i];
      bytesCount += FarmCropSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.farmerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.folioId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.latitude;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.longitude;
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
    final value = object.ownershipType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sizeInHa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmVisitSerialize(
  FarmVisit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeObject<CropData>(
    offsets[1],
    allOffsets,
    CropDataSchema.serialize,
    object.crop,
  );
  writer.writeLong(offsets[2], object.cropId);
  writer.writeObjectList<FarmCrop>(
    offsets[3],
    allOffsets,
    FarmCropSchema.serialize,
    object.farmCrops,
  );
  writer.writeLong(offsets[4], object.farmId);
  writer.writeString(offsets[5], object.farmerName);
  writer.writeString(offsets[6], object.folioId);
  writer.writeString(offsets[7], object.latitude);
  writer.writeString(offsets[8], object.longitude);
  writer.writeString(offsets[9], object.name);
  writer.writeLong(offsets[10], object.noOfHectares);
  writer.writeString(offsets[11], object.ownershipType);
  writer.writeLong(offsets[12], object.pk);
  writer.writeString(offsets[13], object.sizeInHa);
}

FarmVisit _farmVisitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmVisit();
  object.address = reader.readStringOrNull(offsets[0]);
  object.crop = reader.readObjectOrNull<CropData>(
    offsets[1],
    CropDataSchema.deserialize,
    allOffsets,
  );
  object.cropId = reader.readLongOrNull(offsets[2]);
  object.farmCrops = reader.readObjectList<FarmCrop>(
        offsets[3],
        FarmCropSchema.deserialize,
        allOffsets,
        FarmCrop(),
      ) ??
      [];
  object.farmId = reader.readLongOrNull(offsets[4]);
  object.farmerName = reader.readStringOrNull(offsets[5]);
  object.folioId = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.latitude = reader.readStringOrNull(offsets[7]);
  object.longitude = reader.readStringOrNull(offsets[8]);
  object.name = reader.readStringOrNull(offsets[9]);
  object.noOfHectares = reader.readLongOrNull(offsets[10]);
  object.ownershipType = reader.readStringOrNull(offsets[11]);
  object.pk = reader.readLong(offsets[12]);
  object.sizeInHa = reader.readStringOrNull(offsets[13]);
  return object;
}

P _farmVisitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<CropData>(
        offset,
        CropDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<FarmCrop>(
            offset,
            FarmCropSchema.deserialize,
            allOffsets,
            FarmCrop(),
          ) ??
          []) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmVisitGetId(FarmVisit object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _farmVisitGetLinks(FarmVisit object) {
  return [];
}

void _farmVisitAttach(IsarCollection<dynamic> col, Id id, FarmVisit object) {
  object.id = id;
}

extension FarmVisitByIndex on IsarCollection<FarmVisit> {
  Future<FarmVisit?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  FarmVisit? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<FarmVisit?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<FarmVisit?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(FarmVisit object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(FarmVisit object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<FarmVisit> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<FarmVisit> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension FarmVisitQueryWhereSort
    on QueryBuilder<FarmVisit, FarmVisit, QWhere> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }
}

extension FarmVisitQueryWhere
    on QueryBuilder<FarmVisit, FarmVisit, QWhereClause> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> idBetween(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> pkNotEqualTo(int pk) {
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterWhereClause> pkBetween(
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

extension FarmVisitQueryFilter
    on QueryBuilder<FarmVisit, FarmVisit, QFilterCondition> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressEqualTo(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressGreaterThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressLessThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressBetween(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressStartsWith(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressEndsWith(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressContains(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressMatches(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crop',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crop',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cropId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cropId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cropId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cropId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cropId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> cropIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cropId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmCropsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmCropsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmCropsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmCropsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmCropsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmCropsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmCrops',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmerName',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmerName',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      farmerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmerName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'folioId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'folioId',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'folioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'folioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'folioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> folioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folioId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      folioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'folioId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'latitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> latitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      latitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      longitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'longitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> longitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      longitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameContains(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      noOfHectaresIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noOfHectares',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      noOfHectaresIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noOfHectares',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> noOfHectaresEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noOfHectares',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      noOfHectaresGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noOfHectares',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      noOfHectaresLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noOfHectares',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> noOfHectaresBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noOfHectares',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownershipType',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownershipType',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownershipType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownershipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownershipType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownershipType',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      ownershipTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownershipType',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> pkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> pkGreaterThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> pkBetween(
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

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sizeInHa',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      sizeInHaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sizeInHa',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sizeInHa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sizeInHa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sizeInHa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> sizeInHaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeInHa',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition>
      sizeInHaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sizeInHa',
        value: '',
      ));
    });
  }
}

extension FarmVisitQueryObject
    on QueryBuilder<FarmVisit, FarmVisit, QFilterCondition> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> crop(
      FilterQuery<CropData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'crop');
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterFilterCondition> farmCropsElement(
      FilterQuery<FarmCrop> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'farmCrops');
    });
  }
}

extension FarmVisitQueryLinks
    on QueryBuilder<FarmVisit, FarmVisit, QFilterCondition> {}

extension FarmVisitQuerySortBy on QueryBuilder<FarmVisit, FarmVisit, QSortBy> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByCropIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFarmerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerName', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFarmerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerName', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByFolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByNoOfHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfHectares', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByNoOfHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfHectares', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByOwnershipType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownershipType', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByOwnershipTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownershipType', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortBySizeInHa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInHa', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> sortBySizeInHaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInHa', Sort.desc);
    });
  }
}

extension FarmVisitQuerySortThenBy
    on QueryBuilder<FarmVisit, FarmVisit, QSortThenBy> {
  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByCropIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFarmerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerName', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFarmerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerName', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByFolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByNoOfHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfHectares', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByNoOfHectaresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfHectares', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByOwnershipType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownershipType', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByOwnershipTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownershipType', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenBySizeInHa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInHa', Sort.asc);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QAfterSortBy> thenBySizeInHaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeInHa', Sort.desc);
    });
  }
}

extension FarmVisitQueryWhereDistinct
    on QueryBuilder<FarmVisit, FarmVisit, QDistinct> {
  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByCropId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cropId');
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId');
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByFarmerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByFolioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'folioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByNoOfHectares() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noOfHectares');
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByOwnershipType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownershipType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<FarmVisit, FarmVisit, QDistinct> distinctBySizeInHa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sizeInHa', caseSensitive: caseSensitive);
    });
  }
}

extension FarmVisitQueryProperty
    on QueryBuilder<FarmVisit, FarmVisit, QQueryProperty> {
  QueryBuilder<FarmVisit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<FarmVisit, CropData?, QQueryOperations> cropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crop');
    });
  }

  QueryBuilder<FarmVisit, int?, QQueryOperations> cropIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cropId');
    });
  }

  QueryBuilder<FarmVisit, List<FarmCrop>, QQueryOperations>
      farmCropsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmCrops');
    });
  }

  QueryBuilder<FarmVisit, int?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> farmerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmerName');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> folioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'folioId');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FarmVisit, int?, QQueryOperations> noOfHectaresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noOfHectares');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> ownershipTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownershipType');
    });
  }

  QueryBuilder<FarmVisit, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<FarmVisit, String?, QQueryOperations> sizeInHaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sizeInHa');
    });
  }
}
