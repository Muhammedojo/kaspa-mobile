// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFarmerCollection on Isar {
  IsarCollection<Farmer> get farmers => this.collection();
}

const FarmerSchema = CollectionSchema(
  name: r'Farmer',
  id: 6642196998099944333,
  properties: {
    r'accountName': PropertySchema(
      id: 0,
      name: r'accountName',
      type: IsarType.string,
    ),
    r'accountNumber': PropertySchema(
      id: 1,
      name: r'accountNumber',
      type: IsarType.string,
    ),
    r'address': PropertySchema(
      id: 2,
      name: r'address',
      type: IsarType.string,
    ),
    r'age': PropertySchema(
      id: 3,
      name: r'age',
      type: IsarType.string,
    ),
    r'bankDetails': PropertySchema(
      id: 4,
      name: r'bankDetails',
      type: IsarType.object,
      target: r'BankDetail',
    ),
    r'bankId': PropertySchema(
      id: 5,
      name: r'bankId',
      type: IsarType.long,
    ),
    r'bvn': PropertySchema(
      id: 6,
      name: r'bvn',
      type: IsarType.string,
    ),
    r'cooperative': PropertySchema(
      id: 7,
      name: r'cooperative',
      type: IsarType.object,
      target: r'CooperativeData',
    ),
    r'cooperativeCode': PropertySchema(
      id: 8,
      name: r'cooperativeCode',
      type: IsarType.string,
    ),
    r'crop': PropertySchema(
      id: 9,
      name: r'crop',
      type: IsarType.longList,
    ),
    r'farmerFarms': PropertySchema(
      id: 10,
      name: r'farmerFarms',
      type: IsarType.objectList,
      target: r'FarmerPlots',
    ),
    r'firstName': PropertySchema(
      id: 11,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'folioId': PropertySchema(
      id: 12,
      name: r'folioId',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 13,
      name: r'gender',
      type: IsarType.string,
    ),
    r'isBlacklisted': PropertySchema(
      id: 14,
      name: r'isBlacklisted',
      type: IsarType.bool,
    ),
    r'isVerified': PropertySchema(
      id: 15,
      name: r'isVerified',
      type: IsarType.bool,
    ),
    r'lastName': PropertySchema(
      id: 16,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'lga': PropertySchema(
      id: 17,
      name: r'lga',
      type: IsarType.object,
      target: r'LgaData',
    ),
    r'livestock': PropertySchema(
      id: 18,
      name: r'livestock',
      type: IsarType.longList,
    ),
    r'nin': PropertySchema(
      id: 19,
      name: r'nin',
      type: IsarType.string,
    ),
    r'nokAddress': PropertySchema(
      id: 20,
      name: r'nokAddress',
      type: IsarType.string,
    ),
    r'nokDetails': PropertySchema(
      id: 21,
      name: r'nokDetails',
      type: IsarType.object,
      target: r'NokData',
    ),
    r'nokName': PropertySchema(
      id: 22,
      name: r'nokName',
      type: IsarType.string,
    ),
    r'nokPhoneNumber': PropertySchema(
      id: 23,
      name: r'nokPhoneNumber',
      type: IsarType.string,
    ),
    r'nokRelationship': PropertySchema(
      id: 24,
      name: r'nokRelationship',
      type: IsarType.string,
    ),
    r'otherNames': PropertySchema(
      id: 25,
      name: r'otherNames',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 26,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'pk': PropertySchema(
      id: 27,
      name: r'pk',
      type: IsarType.long,
    ),
    r'registrationDate': PropertySchema(
      id: 28,
      name: r'registrationDate',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 29,
      name: r'title',
      type: IsarType.string,
    ),
    r'ward': PropertySchema(
      id: 30,
      name: r'ward',
      type: IsarType.object,
      target: r'WardData',
    ),
    r'wardId': PropertySchema(
      id: 31,
      name: r'wardId',
      type: IsarType.long,
    )
  },
  estimateSize: _farmerEstimateSize,
  serialize: _farmerSerialize,
  deserialize: _farmerDeserialize,
  deserializeProp: _farmerDeserializeProp,
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
    r'FarmerPlots': FarmerPlotsSchema,
    r'CooperativeData': CooperativeDataSchema,
    r'NokData': NokDataSchema,
    r'BankDetail': BankDetailSchema,
    r'BankData': BankDataSchema,
    r'LgaData': LgaDataSchema,
    r'WardData': WardDataSchema
  },
  getId: _farmerGetId,
  getLinks: _farmerGetLinks,
  attach: _farmerAttach,
  version: '3.1.0+1',
);

int _farmerEstimateSize(
  Farmer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accountName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.accountNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.age;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bankDetails;
    if (value != null) {
      bytesCount += 3 +
          BankDetailSchema.estimateSize(
              value, allOffsets[BankDetail]!, allOffsets);
    }
  }
  {
    final value = object.bvn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cooperative;
    if (value != null) {
      bytesCount += 3 +
          CooperativeDataSchema.estimateSize(
              value, allOffsets[CooperativeData]!, allOffsets);
    }
  }
  {
    final value = object.cooperativeCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.crop;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.farmerFarms;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FarmerPlots]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FarmerPlotsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.firstName;
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
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lga;
    if (value != null) {
      bytesCount += 3 +
          LgaDataSchema.estimateSize(value, allOffsets[LgaData]!, allOffsets);
    }
  }
  {
    final value = object.livestock;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.nin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokDetails;
    if (value != null) {
      bytesCount += 3 +
          NokDataSchema.estimateSize(value, allOffsets[NokData]!, allOffsets);
    }
  }
  {
    final value = object.nokName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokPhoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nokRelationship;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.otherNames;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.registrationDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ward;
    if (value != null) {
      bytesCount += 3 +
          WardDataSchema.estimateSize(value, allOffsets[WardData]!, allOffsets);
    }
  }
  return bytesCount;
}

void _farmerSerialize(
  Farmer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountName);
  writer.writeString(offsets[1], object.accountNumber);
  writer.writeString(offsets[2], object.address);
  writer.writeString(offsets[3], object.age);
  writer.writeObject<BankDetail>(
    offsets[4],
    allOffsets,
    BankDetailSchema.serialize,
    object.bankDetails,
  );
  writer.writeLong(offsets[5], object.bankId);
  writer.writeString(offsets[6], object.bvn);
  writer.writeObject<CooperativeData>(
    offsets[7],
    allOffsets,
    CooperativeDataSchema.serialize,
    object.cooperative,
  );
  writer.writeString(offsets[8], object.cooperativeCode);
  writer.writeLongList(offsets[9], object.crop);
  writer.writeObjectList<FarmerPlots>(
    offsets[10],
    allOffsets,
    FarmerPlotsSchema.serialize,
    object.farmerFarms,
  );
  writer.writeString(offsets[11], object.firstName);
  writer.writeString(offsets[12], object.folioId);
  writer.writeString(offsets[13], object.gender);
  writer.writeBool(offsets[14], object.isBlacklisted);
  writer.writeBool(offsets[15], object.isVerified);
  writer.writeString(offsets[16], object.lastName);
  writer.writeObject<LgaData>(
    offsets[17],
    allOffsets,
    LgaDataSchema.serialize,
    object.lga,
  );
  writer.writeLongList(offsets[18], object.livestock);
  writer.writeString(offsets[19], object.nin);
  writer.writeString(offsets[20], object.nokAddress);
  writer.writeObject<NokData>(
    offsets[21],
    allOffsets,
    NokDataSchema.serialize,
    object.nokDetails,
  );
  writer.writeString(offsets[22], object.nokName);
  writer.writeString(offsets[23], object.nokPhoneNumber);
  writer.writeString(offsets[24], object.nokRelationship);
  writer.writeString(offsets[25], object.otherNames);
  writer.writeString(offsets[26], object.phoneNumber);
  writer.writeLong(offsets[27], object.pk);
  writer.writeString(offsets[28], object.registrationDate);
  writer.writeString(offsets[29], object.title);
  writer.writeObject<WardData>(
    offsets[30],
    allOffsets,
    WardDataSchema.serialize,
    object.ward,
  );
  writer.writeLong(offsets[31], object.wardId);
}

Farmer _farmerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Farmer();
  object.accountName = reader.readStringOrNull(offsets[0]);
  object.accountNumber = reader.readStringOrNull(offsets[1]);
  object.address = reader.readStringOrNull(offsets[2]);
  object.age = reader.readStringOrNull(offsets[3]);
  object.bankDetails = reader.readObjectOrNull<BankDetail>(
    offsets[4],
    BankDetailSchema.deserialize,
    allOffsets,
  );
  object.bankId = reader.readLongOrNull(offsets[5]);
  object.bvn = reader.readStringOrNull(offsets[6]);
  object.cooperative = reader.readObjectOrNull<CooperativeData>(
    offsets[7],
    CooperativeDataSchema.deserialize,
    allOffsets,
  );
  object.cooperativeCode = reader.readStringOrNull(offsets[8]);
  object.crop = reader.readLongList(offsets[9]);
  object.farmerFarms = reader.readObjectList<FarmerPlots>(
    offsets[10],
    FarmerPlotsSchema.deserialize,
    allOffsets,
    FarmerPlots(),
  );
  object.firstName = reader.readStringOrNull(offsets[11]);
  object.folioId = reader.readStringOrNull(offsets[12]);
  object.gender = reader.readStringOrNull(offsets[13]);
  object.id = id;
  object.isBlacklisted = reader.readBoolOrNull(offsets[14]);
  object.isVerified = reader.readBoolOrNull(offsets[15]);
  object.lastName = reader.readStringOrNull(offsets[16]);
  object.lga = reader.readObjectOrNull<LgaData>(
    offsets[17],
    LgaDataSchema.deserialize,
    allOffsets,
  );
  object.livestock = reader.readLongList(offsets[18]);
  object.nin = reader.readStringOrNull(offsets[19]);
  object.nokAddress = reader.readStringOrNull(offsets[20]);
  object.nokDetails = reader.readObjectOrNull<NokData>(
    offsets[21],
    NokDataSchema.deserialize,
    allOffsets,
  );
  object.nokName = reader.readStringOrNull(offsets[22]);
  object.nokPhoneNumber = reader.readStringOrNull(offsets[23]);
  object.nokRelationship = reader.readStringOrNull(offsets[24]);
  object.otherNames = reader.readStringOrNull(offsets[25]);
  object.phoneNumber = reader.readStringOrNull(offsets[26]);
  object.pk = reader.readLong(offsets[27]);
  object.registrationDate = reader.readStringOrNull(offsets[28]);
  object.title = reader.readStringOrNull(offsets[29]);
  object.ward = reader.readObjectOrNull<WardData>(
    offsets[30],
    WardDataSchema.deserialize,
    allOffsets,
  );
  object.wardId = reader.readLongOrNull(offsets[31]);
  return object;
}

P _farmerDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<BankDetail>(
        offset,
        BankDetailSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<CooperativeData>(
        offset,
        CooperativeDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongList(offset)) as P;
    case 10:
      return (reader.readObjectList<FarmerPlots>(
        offset,
        FarmerPlotsSchema.deserialize,
        allOffsets,
        FarmerPlots(),
      )) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readObjectOrNull<LgaData>(
        offset,
        LgaDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 18:
      return (reader.readLongList(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readObjectOrNull<NokData>(
        offset,
        NokDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readObjectOrNull<WardData>(
        offset,
        WardDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmerGetId(Farmer object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _farmerGetLinks(Farmer object) {
  return [];
}

void _farmerAttach(IsarCollection<dynamic> col, Id id, Farmer object) {
  object.id = id;
}

extension FarmerByIndex on IsarCollection<Farmer> {
  Future<Farmer?> getByPk(int pk) {
    return getByIndex(r'pk', [pk]);
  }

  Farmer? getByPkSync(int pk) {
    return getByIndexSync(r'pk', [pk]);
  }

  Future<bool> deleteByPk(int pk) {
    return deleteByIndex(r'pk', [pk]);
  }

  bool deleteByPkSync(int pk) {
    return deleteByIndexSync(r'pk', [pk]);
  }

  Future<List<Farmer?>> getAllByPk(List<int> pkValues) {
    final values = pkValues.map((e) => [e]).toList();
    return getAllByIndex(r'pk', values);
  }

  List<Farmer?> getAllByPkSync(List<int> pkValues) {
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

  Future<Id> putByPk(Farmer object) {
    return putByIndex(r'pk', object);
  }

  Id putByPkSync(Farmer object, {bool saveLinks = true}) {
    return putByIndexSync(r'pk', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPk(List<Farmer> objects) {
    return putAllByIndex(r'pk', objects);
  }

  List<Id> putAllByPkSync(List<Farmer> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'pk', objects, saveLinks: saveLinks);
  }
}

extension FarmerQueryWhereSort on QueryBuilder<Farmer, Farmer, QWhere> {
  QueryBuilder<Farmer, Farmer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterWhere> anyPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'pk'),
      );
    });
  }
}

extension FarmerQueryWhere on QueryBuilder<Farmer, Farmer, QWhereClause> {
  QueryBuilder<Farmer, Farmer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> idBetween(
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

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> pkEqualTo(int pk) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pk',
        value: [pk],
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> pkNotEqualTo(int pk) {
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

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> pkGreaterThan(
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

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> pkLessThan(
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

  QueryBuilder<Farmer, Farmer, QAfterWhereClause> pkBetween(
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

extension FarmerQueryFilter on QueryBuilder<Farmer, Farmer, QFilterCondition> {
  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressEqualTo(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressGreaterThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressLessThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressBetween(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressStartsWith(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressEndsWith(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressContains(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressMatches(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'age',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankDetails',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankDetails',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bvn',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bvn',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bvn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bvn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bvn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bvn',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bvnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bvn',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cooperative',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cooperative',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cooperativeCode',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      cooperativeCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cooperativeCode',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      cooperativeCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cooperativeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cooperativeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cooperativeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperativeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cooperativeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      cooperativeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cooperativeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crop',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crop',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crop',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'crop',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'crop',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'crop',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cropLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'crop',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmerFarms',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmerFarms',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      farmerFarmsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'farmerFarms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'folioId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'folioId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdEqualTo(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdGreaterThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdLessThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdBetween(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdStartsWith(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdEndsWith(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdContains(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdMatches(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'folioId',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> folioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'folioId',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isBlacklistedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBlacklisted',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isBlacklistedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBlacklisted',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isBlacklistedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlacklisted',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isVerifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isVerified',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isVerifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isVerified',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> isVerifiedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVerified',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lgaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lga',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lgaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lga',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'livestock',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'livestock',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'livestock',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      livestockElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'livestock',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'livestock',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'livestock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      livestockLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> livestockLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'livestock',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nin',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nin',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nin',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ninIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nin',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokAddress',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokAddress',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokDetails',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokDetails',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokName',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokPhoneNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      nokPhoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokPhoneNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokPhoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokPhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokPhoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokPhoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokPhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      nokPhoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokPhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nokRelationship',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      nokRelationshipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nokRelationship',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      nokRelationshipGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nokRelationship',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nokRelationship',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nokRelationship',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokRelationshipIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nokRelationship',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      nokRelationshipIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nokRelationship',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherNames',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherNames',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'otherNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'otherNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> otherNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'otherNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> pkEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> pkGreaterThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> pkLessThan(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> pkBetween(
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

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationDate',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      registrationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationDate',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      registrationDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      registrationDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'registrationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> registrationDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'registrationDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      registrationDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition>
      registrationDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'registrationDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ward',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ward',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wardId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wardId',
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wardId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wardId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wardId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> wardIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wardId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FarmerQueryObject on QueryBuilder<Farmer, Farmer, QFilterCondition> {
  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> bankDetails(
      FilterQuery<BankDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bankDetails');
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> cooperative(
      FilterQuery<CooperativeData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cooperative');
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> farmerFarmsElement(
      FilterQuery<FarmerPlots> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'farmerFarms');
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> lga(
      FilterQuery<LgaData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'lga');
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> nokDetails(
      FilterQuery<NokData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nokDetails');
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterFilterCondition> ward(
      FilterQuery<WardData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ward');
    });
  }
}

extension FarmerQueryLinks on QueryBuilder<Farmer, Farmer, QFilterCondition> {}

extension FarmerQuerySortBy on QueryBuilder<Farmer, Farmer, QSortBy> {
  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByBankId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByBankIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankId', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByBvn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bvn', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByBvnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bvn', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByCooperativeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cooperativeCode', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByCooperativeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cooperativeCode', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByFolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByFolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByIsBlacklisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacklisted', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByIsBlacklistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacklisted', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByIsVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerified', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByIsVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerified', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nin', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nin', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokPhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokPhoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokRelationship() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokRelationship', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByNokRelationshipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokRelationship', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByOtherNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherNames', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByOtherNamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherNames', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByRegistrationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByRegistrationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByWardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> sortByWardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardId', Sort.desc);
    });
  }
}

extension FarmerQuerySortThenBy on QueryBuilder<Farmer, Farmer, QSortThenBy> {
  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByBankId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByBankIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankId', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByBvn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bvn', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByBvnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bvn', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByCooperativeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cooperativeCode', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByCooperativeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cooperativeCode', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByFolioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByFolioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'folioId', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByIsBlacklisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacklisted', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByIsBlacklistedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacklisted', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByIsVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerified', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByIsVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVerified', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nin', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nin', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokAddress', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokName', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokPhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokPhoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokRelationship() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokRelationship', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByNokRelationshipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nokRelationship', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByOtherNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherNames', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByOtherNamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherNames', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByRegistrationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByRegistrationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationDate', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByWardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardId', Sort.asc);
    });
  }

  QueryBuilder<Farmer, Farmer, QAfterSortBy> thenByWardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wardId', Sort.desc);
    });
  }
}

extension FarmerQueryWhereDistinct on QueryBuilder<Farmer, Farmer, QDistinct> {
  QueryBuilder<Farmer, Farmer, QDistinct> distinctByAccountName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByAccountNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByAge(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByBankId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankId');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByBvn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bvn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByCooperativeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cooperativeCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByCrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crop');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByFolioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'folioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByIsBlacklisted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlacklisted');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByIsVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVerified');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByLivestock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'livestock');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByNin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByNokAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByNokName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByNokPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokPhoneNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByNokRelationship(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nokRelationship',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByOtherNames(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherNames', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByRegistrationDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farmer, Farmer, QDistinct> distinctByWardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wardId');
    });
  }
}

extension FarmerQueryProperty on QueryBuilder<Farmer, Farmer, QQueryProperty> {
  QueryBuilder<Farmer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Farmer, BankDetail?, QQueryOperations> bankDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankDetails');
    });
  }

  QueryBuilder<Farmer, int?, QQueryOperations> bankIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankId');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> bvnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bvn');
    });
  }

  QueryBuilder<Farmer, CooperativeData?, QQueryOperations>
      cooperativeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cooperative');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> cooperativeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cooperativeCode');
    });
  }

  QueryBuilder<Farmer, List<int>?, QQueryOperations> cropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crop');
    });
  }

  QueryBuilder<Farmer, List<FarmerPlots>?, QQueryOperations>
      farmerFarmsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmerFarms');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> folioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'folioId');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Farmer, bool?, QQueryOperations> isBlacklistedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlacklisted');
    });
  }

  QueryBuilder<Farmer, bool?, QQueryOperations> isVerifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVerified');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<Farmer, LgaData?, QQueryOperations> lgaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lga');
    });
  }

  QueryBuilder<Farmer, List<int>?, QQueryOperations> livestockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'livestock');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> ninProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nin');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> nokAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokAddress');
    });
  }

  QueryBuilder<Farmer, NokData?, QQueryOperations> nokDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokDetails');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> nokNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokName');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> nokPhoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokPhoneNumber');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> nokRelationshipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nokRelationship');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> otherNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherNames');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<Farmer, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> registrationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationDate');
    });
  }

  QueryBuilder<Farmer, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Farmer, WardData?, QQueryOperations> wardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ward');
    });
  }

  QueryBuilder<Farmer, int?, QQueryOperations> wardIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wardId');
    });
  }
}
