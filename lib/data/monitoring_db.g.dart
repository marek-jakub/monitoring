// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_db.dart';

// ignore_for_file: type=lint
class $LocationEntityTable extends LocationEntity
    with TableInfo<$LocationEntityTable, LocationEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localityMeta =
      const VerificationMeta('locality');
  @override
  late final GeneratedColumn<String> locality = GeneratedColumn<String>(
      'locality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _placeCodeMeta =
      const VerificationMeta('placeCode');
  @override
  late final GeneratedColumn<String> placeCode = GeneratedColumn<String>(
      'place_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
      'latitude', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
      'longitude', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coordinatesAccuracyMeta =
      const VerificationMeta('coordinatesAccuracy');
  @override
  late final GeneratedColumn<String> coordinatesAccuracy =
      GeneratedColumn<String>('coordinates_accuracy', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localeInfoMeta =
      const VerificationMeta('localeInfo');
  @override
  late final GeneratedColumn<String> localeInfo = GeneratedColumn<String>(
      'locale_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ringerId,
        country,
        locality,
        placeCode,
        latitude,
        longitude,
        coordinatesAccuracy,
        localeInfo
      ];
  @override
  String get aliasedName => _alias ?? 'location_entity';
  @override
  String get actualTableName => 'location_entity';
  @override
  VerificationContext validateIntegrity(Insertable<LocationEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('locality')) {
      context.handle(_localityMeta,
          locality.isAcceptableOrUnknown(data['locality']!, _localityMeta));
    } else if (isInserting) {
      context.missing(_localityMeta);
    }
    if (data.containsKey('place_code')) {
      context.handle(_placeCodeMeta,
          placeCode.isAcceptableOrUnknown(data['place_code']!, _placeCodeMeta));
    } else if (isInserting) {
      context.missing(_placeCodeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('coordinates_accuracy')) {
      context.handle(
          _coordinatesAccuracyMeta,
          coordinatesAccuracy.isAcceptableOrUnknown(
              data['coordinates_accuracy']!, _coordinatesAccuracyMeta));
    } else if (isInserting) {
      context.missing(_coordinatesAccuracyMeta);
    }
    if (data.containsKey('locale_info')) {
      context.handle(
          _localeInfoMeta,
          localeInfo.isAcceptableOrUnknown(
              data['locale_info']!, _localeInfoMeta));
    } else if (isInserting) {
      context.missing(_localeInfoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      locality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locality'])!,
      placeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}place_code'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}longitude'])!,
      coordinatesAccuracy: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}coordinates_accuracy'])!,
      localeInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale_info'])!,
    );
  }

  @override
  $LocationEntityTable createAlias(String alias) {
    return $LocationEntityTable(attachedDatabase, alias);
  }
}

class LocationEntityData extends DataClass
    implements Insertable<LocationEntityData> {
  final int id;
  final String ringerId;
  final String country;
  final String locality;
  final String placeCode;
  final String latitude;
  final String longitude;
  final String coordinatesAccuracy;
  final String localeInfo;
  const LocationEntityData(
      {required this.id,
      required this.ringerId,
      required this.country,
      required this.locality,
      required this.placeCode,
      required this.latitude,
      required this.longitude,
      required this.coordinatesAccuracy,
      required this.localeInfo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['country'] = Variable<String>(country);
    map['locality'] = Variable<String>(locality);
    map['place_code'] = Variable<String>(placeCode);
    map['latitude'] = Variable<String>(latitude);
    map['longitude'] = Variable<String>(longitude);
    map['coordinates_accuracy'] = Variable<String>(coordinatesAccuracy);
    map['locale_info'] = Variable<String>(localeInfo);
    return map;
  }

  LocationEntityCompanion toCompanion(bool nullToAbsent) {
    return LocationEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      country: Value(country),
      locality: Value(locality),
      placeCode: Value(placeCode),
      latitude: Value(latitude),
      longitude: Value(longitude),
      coordinatesAccuracy: Value(coordinatesAccuracy),
      localeInfo: Value(localeInfo),
    );
  }

  factory LocationEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      country: serializer.fromJson<String>(json['country']),
      locality: serializer.fromJson<String>(json['locality']),
      placeCode: serializer.fromJson<String>(json['placeCode']),
      latitude: serializer.fromJson<String>(json['latitude']),
      longitude: serializer.fromJson<String>(json['longitude']),
      coordinatesAccuracy:
          serializer.fromJson<String>(json['coordinatesAccuracy']),
      localeInfo: serializer.fromJson<String>(json['localeInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'country': serializer.toJson<String>(country),
      'locality': serializer.toJson<String>(locality),
      'placeCode': serializer.toJson<String>(placeCode),
      'latitude': serializer.toJson<String>(latitude),
      'longitude': serializer.toJson<String>(longitude),
      'coordinatesAccuracy': serializer.toJson<String>(coordinatesAccuracy),
      'localeInfo': serializer.toJson<String>(localeInfo),
    };
  }

  LocationEntityData copyWith(
          {int? id,
          String? ringerId,
          String? country,
          String? locality,
          String? placeCode,
          String? latitude,
          String? longitude,
          String? coordinatesAccuracy,
          String? localeInfo}) =>
      LocationEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        country: country ?? this.country,
        locality: locality ?? this.locality,
        placeCode: placeCode ?? this.placeCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        coordinatesAccuracy: coordinatesAccuracy ?? this.coordinatesAccuracy,
        localeInfo: localeInfo ?? this.localeInfo,
      );
  @override
  String toString() {
    return (StringBuffer('LocationEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('country: $country, ')
          ..write('locality: $locality, ')
          ..write('placeCode: $placeCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('coordinatesAccuracy: $coordinatesAccuracy, ')
          ..write('localeInfo: $localeInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ringerId, country, locality, placeCode,
      latitude, longitude, coordinatesAccuracy, localeInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.country == this.country &&
          other.locality == this.locality &&
          other.placeCode == this.placeCode &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.coordinatesAccuracy == this.coordinatesAccuracy &&
          other.localeInfo == this.localeInfo);
}

class LocationEntityCompanion extends UpdateCompanion<LocationEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> country;
  final Value<String> locality;
  final Value<String> placeCode;
  final Value<String> latitude;
  final Value<String> longitude;
  final Value<String> coordinatesAccuracy;
  final Value<String> localeInfo;
  const LocationEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.country = const Value.absent(),
    this.locality = const Value.absent(),
    this.placeCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.coordinatesAccuracy = const Value.absent(),
    this.localeInfo = const Value.absent(),
  });
  LocationEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String country,
    required String locality,
    required String placeCode,
    required String latitude,
    required String longitude,
    required String coordinatesAccuracy,
    required String localeInfo,
  })  : ringerId = Value(ringerId),
        country = Value(country),
        locality = Value(locality),
        placeCode = Value(placeCode),
        latitude = Value(latitude),
        longitude = Value(longitude),
        coordinatesAccuracy = Value(coordinatesAccuracy),
        localeInfo = Value(localeInfo);
  static Insertable<LocationEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? country,
    Expression<String>? locality,
    Expression<String>? placeCode,
    Expression<String>? latitude,
    Expression<String>? longitude,
    Expression<String>? coordinatesAccuracy,
    Expression<String>? localeInfo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (country != null) 'country': country,
      if (locality != null) 'locality': locality,
      if (placeCode != null) 'place_code': placeCode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (coordinatesAccuracy != null)
        'coordinates_accuracy': coordinatesAccuracy,
      if (localeInfo != null) 'locale_info': localeInfo,
    });
  }

  LocationEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? country,
      Value<String>? locality,
      Value<String>? placeCode,
      Value<String>? latitude,
      Value<String>? longitude,
      Value<String>? coordinatesAccuracy,
      Value<String>? localeInfo}) {
    return LocationEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      country: country ?? this.country,
      locality: locality ?? this.locality,
      placeCode: placeCode ?? this.placeCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      coordinatesAccuracy: coordinatesAccuracy ?? this.coordinatesAccuracy,
      localeInfo: localeInfo ?? this.localeInfo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (locality.present) {
      map['locality'] = Variable<String>(locality.value);
    }
    if (placeCode.present) {
      map['place_code'] = Variable<String>(placeCode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (coordinatesAccuracy.present) {
      map['coordinates_accuracy'] = Variable<String>(coordinatesAccuracy.value);
    }
    if (localeInfo.present) {
      map['locale_info'] = Variable<String>(localeInfo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('country: $country, ')
          ..write('locality: $locality, ')
          ..write('placeCode: $placeCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('coordinatesAccuracy: $coordinatesAccuracy, ')
          ..write('localeInfo: $localeInfo')
          ..write(')'))
        .toString();
  }
}

class $LostRingEntityTable extends LostRingEntity
    with TableInfo<$LostRingEntityTable, LostRingEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LostRingEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schemeCodeMeta =
      const VerificationMeta('schemeCode');
  @override
  late final GeneratedColumn<String> schemeCode = GeneratedColumn<String>(
      'scheme_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringSeriesCodeMeta =
      const VerificationMeta('ringSeriesCode');
  @override
  late final GeneratedColumn<String> ringSeriesCode = GeneratedColumn<String>(
      'ring_series_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<String> idNumber = GeneratedColumn<String>(
      'id_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ringerId, schemeCode, ringSeriesCode, idNumber];
  @override
  String get aliasedName => _alias ?? 'lost_ring_entity';
  @override
  String get actualTableName => 'lost_ring_entity';
  @override
  VerificationContext validateIntegrity(Insertable<LostRingEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('scheme_code')) {
      context.handle(
          _schemeCodeMeta,
          schemeCode.isAcceptableOrUnknown(
              data['scheme_code']!, _schemeCodeMeta));
    } else if (isInserting) {
      context.missing(_schemeCodeMeta);
    }
    if (data.containsKey('ring_series_code')) {
      context.handle(
          _ringSeriesCodeMeta,
          ringSeriesCode.isAcceptableOrUnknown(
              data['ring_series_code']!, _ringSeriesCodeMeta));
    } else if (isInserting) {
      context.missing(_ringSeriesCodeMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LostRingEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LostRingEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      schemeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheme_code'])!,
      ringSeriesCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ring_series_code'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_number'])!,
    );
  }

  @override
  $LostRingEntityTable createAlias(String alias) {
    return $LostRingEntityTable(attachedDatabase, alias);
  }
}

class LostRingEntityData extends DataClass
    implements Insertable<LostRingEntityData> {
  final int id;
  final String ringerId;
  final String schemeCode;
  final String ringSeriesCode;
  final String idNumber;
  const LostRingEntityData(
      {required this.id,
      required this.ringerId,
      required this.schemeCode,
      required this.ringSeriesCode,
      required this.idNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['scheme_code'] = Variable<String>(schemeCode);
    map['ring_series_code'] = Variable<String>(ringSeriesCode);
    map['id_number'] = Variable<String>(idNumber);
    return map;
  }

  LostRingEntityCompanion toCompanion(bool nullToAbsent) {
    return LostRingEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      schemeCode: Value(schemeCode),
      ringSeriesCode: Value(ringSeriesCode),
      idNumber: Value(idNumber),
    );
  }

  factory LostRingEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LostRingEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      schemeCode: serializer.fromJson<String>(json['schemeCode']),
      ringSeriesCode: serializer.fromJson<String>(json['ringSeriesCode']),
      idNumber: serializer.fromJson<String>(json['idNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'schemeCode': serializer.toJson<String>(schemeCode),
      'ringSeriesCode': serializer.toJson<String>(ringSeriesCode),
      'idNumber': serializer.toJson<String>(idNumber),
    };
  }

  LostRingEntityData copyWith(
          {int? id,
          String? ringerId,
          String? schemeCode,
          String? ringSeriesCode,
          String? idNumber}) =>
      LostRingEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        schemeCode: schemeCode ?? this.schemeCode,
        ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
        idNumber: idNumber ?? this.idNumber,
      );
  @override
  String toString() {
    return (StringBuffer('LostRingEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('idNumber: $idNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ringerId, schemeCode, ringSeriesCode, idNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LostRingEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.schemeCode == this.schemeCode &&
          other.ringSeriesCode == this.ringSeriesCode &&
          other.idNumber == this.idNumber);
}

class LostRingEntityCompanion extends UpdateCompanion<LostRingEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> schemeCode;
  final Value<String> ringSeriesCode;
  final Value<String> idNumber;
  const LostRingEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.schemeCode = const Value.absent(),
    this.ringSeriesCode = const Value.absent(),
    this.idNumber = const Value.absent(),
  });
  LostRingEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String schemeCode,
    required String ringSeriesCode,
    required String idNumber,
  })  : ringerId = Value(ringerId),
        schemeCode = Value(schemeCode),
        ringSeriesCode = Value(ringSeriesCode),
        idNumber = Value(idNumber);
  static Insertable<LostRingEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? schemeCode,
    Expression<String>? ringSeriesCode,
    Expression<String>? idNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (schemeCode != null) 'scheme_code': schemeCode,
      if (ringSeriesCode != null) 'ring_series_code': ringSeriesCode,
      if (idNumber != null) 'id_number': idNumber,
    });
  }

  LostRingEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? schemeCode,
      Value<String>? ringSeriesCode,
      Value<String>? idNumber}) {
    return LostRingEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      schemeCode: schemeCode ?? this.schemeCode,
      ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
      idNumber: idNumber ?? this.idNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (schemeCode.present) {
      map['scheme_code'] = Variable<String>(schemeCode.value);
    }
    if (ringSeriesCode.present) {
      map['ring_series_code'] = Variable<String>(ringSeriesCode.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<String>(idNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LostRingEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('idNumber: $idNumber')
          ..write(')'))
        .toString();
  }
}

class $OrderEntityTable extends OrderEntity
    with TableInfo<$OrderEntityTable, OrderEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringSeriesCodeMeta =
      const VerificationMeta('ringSeriesCode');
  @override
  late final GeneratedColumn<String> ringSeriesCode = GeneratedColumn<String>(
      'ring_series_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, ringerId, ringSeriesCode, amount];
  @override
  String get aliasedName => _alias ?? 'order_entity';
  @override
  String get actualTableName => 'order_entity';
  @override
  VerificationContext validateIntegrity(Insertable<OrderEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('ring_series_code')) {
      context.handle(
          _ringSeriesCodeMeta,
          ringSeriesCode.isAcceptableOrUnknown(
              data['ring_series_code']!, _ringSeriesCodeMeta));
    } else if (isInserting) {
      context.missing(_ringSeriesCodeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      ringSeriesCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ring_series_code'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $OrderEntityTable createAlias(String alias) {
    return $OrderEntityTable(attachedDatabase, alias);
  }
}

class OrderEntityData extends DataClass implements Insertable<OrderEntityData> {
  final int id;
  final String ringerId;
  final String ringSeriesCode;
  final int amount;
  const OrderEntityData(
      {required this.id,
      required this.ringerId,
      required this.ringSeriesCode,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['ring_series_code'] = Variable<String>(ringSeriesCode);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  OrderEntityCompanion toCompanion(bool nullToAbsent) {
    return OrderEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      ringSeriesCode: Value(ringSeriesCode),
      amount: Value(amount),
    );
  }

  factory OrderEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      ringSeriesCode: serializer.fromJson<String>(json['ringSeriesCode']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'ringSeriesCode': serializer.toJson<String>(ringSeriesCode),
      'amount': serializer.toJson<int>(amount),
    };
  }

  OrderEntityData copyWith(
          {int? id, String? ringerId, String? ringSeriesCode, int? amount}) =>
      OrderEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('OrderEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ringerId, ringSeriesCode, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.ringSeriesCode == this.ringSeriesCode &&
          other.amount == this.amount);
}

class OrderEntityCompanion extends UpdateCompanion<OrderEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> ringSeriesCode;
  final Value<int> amount;
  const OrderEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.ringSeriesCode = const Value.absent(),
    this.amount = const Value.absent(),
  });
  OrderEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String ringSeriesCode,
    required int amount,
  })  : ringerId = Value(ringerId),
        ringSeriesCode = Value(ringSeriesCode),
        amount = Value(amount);
  static Insertable<OrderEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? ringSeriesCode,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (ringSeriesCode != null) 'ring_series_code': ringSeriesCode,
      if (amount != null) 'amount': amount,
    });
  }

  OrderEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? ringSeriesCode,
      Value<int>? amount}) {
    return OrderEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (ringSeriesCode.present) {
      map['ring_series_code'] = Variable<String>(ringSeriesCode.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $ReportEntityTable extends ReportEntity
    with TableInfo<$ReportEntityTable, ReportEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberOfRingsMeta =
      const VerificationMeta('numberOfRings');
  @override
  late final GeneratedColumn<int> numberOfRings = GeneratedColumn<int>(
      'number_of_rings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfRetrapsMeta =
      const VerificationMeta('numberOfRetraps');
  @override
  late final GeneratedColumn<int> numberOfRetraps = GeneratedColumn<int>(
      'number_of_retraps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numberOfLostRingsMeta =
      const VerificationMeta('numberOfLostRings');
  @override
  late final GeneratedColumn<int> numberOfLostRings = GeneratedColumn<int>(
      'number_of_lost_rings', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ringerId, date, numberOfRings, numberOfRetraps, numberOfLostRings];
  @override
  String get aliasedName => _alias ?? 'report_entity';
  @override
  String get actualTableName => 'report_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ReportEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('number_of_rings')) {
      context.handle(
          _numberOfRingsMeta,
          numberOfRings.isAcceptableOrUnknown(
              data['number_of_rings']!, _numberOfRingsMeta));
    } else if (isInserting) {
      context.missing(_numberOfRingsMeta);
    }
    if (data.containsKey('number_of_retraps')) {
      context.handle(
          _numberOfRetrapsMeta,
          numberOfRetraps.isAcceptableOrUnknown(
              data['number_of_retraps']!, _numberOfRetrapsMeta));
    } else if (isInserting) {
      context.missing(_numberOfRetrapsMeta);
    }
    if (data.containsKey('number_of_lost_rings')) {
      context.handle(
          _numberOfLostRingsMeta,
          numberOfLostRings.isAcceptableOrUnknown(
              data['number_of_lost_rings']!, _numberOfLostRingsMeta));
    } else if (isInserting) {
      context.missing(_numberOfLostRingsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      numberOfRings: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_rings'])!,
      numberOfRetraps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_retraps'])!,
      numberOfLostRings: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}number_of_lost_rings'])!,
    );
  }

  @override
  $ReportEntityTable createAlias(String alias) {
    return $ReportEntityTable(attachedDatabase, alias);
  }
}

class ReportEntityData extends DataClass
    implements Insertable<ReportEntityData> {
  final int id;
  final String ringerId;
  final String date;
  final int numberOfRings;
  final int numberOfRetraps;
  final int numberOfLostRings;
  const ReportEntityData(
      {required this.id,
      required this.ringerId,
      required this.date,
      required this.numberOfRings,
      required this.numberOfRetraps,
      required this.numberOfLostRings});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['date'] = Variable<String>(date);
    map['number_of_rings'] = Variable<int>(numberOfRings);
    map['number_of_retraps'] = Variable<int>(numberOfRetraps);
    map['number_of_lost_rings'] = Variable<int>(numberOfLostRings);
    return map;
  }

  ReportEntityCompanion toCompanion(bool nullToAbsent) {
    return ReportEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      date: Value(date),
      numberOfRings: Value(numberOfRings),
      numberOfRetraps: Value(numberOfRetraps),
      numberOfLostRings: Value(numberOfLostRings),
    );
  }

  factory ReportEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      date: serializer.fromJson<String>(json['date']),
      numberOfRings: serializer.fromJson<int>(json['numberOfRings']),
      numberOfRetraps: serializer.fromJson<int>(json['numberOfRetraps']),
      numberOfLostRings: serializer.fromJson<int>(json['numberOfLostRings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'date': serializer.toJson<String>(date),
      'numberOfRings': serializer.toJson<int>(numberOfRings),
      'numberOfRetraps': serializer.toJson<int>(numberOfRetraps),
      'numberOfLostRings': serializer.toJson<int>(numberOfLostRings),
    };
  }

  ReportEntityData copyWith(
          {int? id,
          String? ringerId,
          String? date,
          int? numberOfRings,
          int? numberOfRetraps,
          int? numberOfLostRings}) =>
      ReportEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        date: date ?? this.date,
        numberOfRings: numberOfRings ?? this.numberOfRings,
        numberOfRetraps: numberOfRetraps ?? this.numberOfRetraps,
        numberOfLostRings: numberOfLostRings ?? this.numberOfLostRings,
      );
  @override
  String toString() {
    return (StringBuffer('ReportEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('date: $date, ')
          ..write('numberOfRings: $numberOfRings, ')
          ..write('numberOfRetraps: $numberOfRetraps, ')
          ..write('numberOfLostRings: $numberOfLostRings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, ringerId, date, numberOfRings, numberOfRetraps, numberOfLostRings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.date == this.date &&
          other.numberOfRings == this.numberOfRings &&
          other.numberOfRetraps == this.numberOfRetraps &&
          other.numberOfLostRings == this.numberOfLostRings);
}

class ReportEntityCompanion extends UpdateCompanion<ReportEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> date;
  final Value<int> numberOfRings;
  final Value<int> numberOfRetraps;
  final Value<int> numberOfLostRings;
  const ReportEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.date = const Value.absent(),
    this.numberOfRings = const Value.absent(),
    this.numberOfRetraps = const Value.absent(),
    this.numberOfLostRings = const Value.absent(),
  });
  ReportEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String date,
    required int numberOfRings,
    required int numberOfRetraps,
    required int numberOfLostRings,
  })  : ringerId = Value(ringerId),
        date = Value(date),
        numberOfRings = Value(numberOfRings),
        numberOfRetraps = Value(numberOfRetraps),
        numberOfLostRings = Value(numberOfLostRings);
  static Insertable<ReportEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? date,
    Expression<int>? numberOfRings,
    Expression<int>? numberOfRetraps,
    Expression<int>? numberOfLostRings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (date != null) 'date': date,
      if (numberOfRings != null) 'number_of_rings': numberOfRings,
      if (numberOfRetraps != null) 'number_of_retraps': numberOfRetraps,
      if (numberOfLostRings != null) 'number_of_lost_rings': numberOfLostRings,
    });
  }

  ReportEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? date,
      Value<int>? numberOfRings,
      Value<int>? numberOfRetraps,
      Value<int>? numberOfLostRings}) {
    return ReportEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      date: date ?? this.date,
      numberOfRings: numberOfRings ?? this.numberOfRings,
      numberOfRetraps: numberOfRetraps ?? this.numberOfRetraps,
      numberOfLostRings: numberOfLostRings ?? this.numberOfLostRings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (numberOfRings.present) {
      map['number_of_rings'] = Variable<int>(numberOfRings.value);
    }
    if (numberOfRetraps.present) {
      map['number_of_retraps'] = Variable<int>(numberOfRetraps.value);
    }
    if (numberOfLostRings.present) {
      map['number_of_lost_rings'] = Variable<int>(numberOfLostRings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('date: $date, ')
          ..write('numberOfRings: $numberOfRings, ')
          ..write('numberOfRetraps: $numberOfRetraps, ')
          ..write('numberOfLostRings: $numberOfLostRings')
          ..write(')'))
        .toString();
  }
}

class $SessionEntityTable extends SessionEntity
    with TableInfo<$SessionEntityTable, SessionEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateAccuracyMeta =
      const VerificationMeta('dateAccuracy');
  @override
  late final GeneratedColumn<String> dateAccuracy = GeneratedColumn<String>(
      'date_accuracy', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES location_entity (id)'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, dateAccuracy, location, ringerId, startTime, endTime];
  @override
  String get aliasedName => _alias ?? 'session_entity';
  @override
  String get actualTableName => 'session_entity';
  @override
  VerificationContext validateIntegrity(Insertable<SessionEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('date_accuracy')) {
      context.handle(
          _dateAccuracyMeta,
          dateAccuracy.isAcceptableOrUnknown(
              data['date_accuracy']!, _dateAccuracyMeta));
    } else if (isInserting) {
      context.missing(_dateAccuracyMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      dateAccuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_accuracy'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $SessionEntityTable createAlias(String alias) {
    return $SessionEntityTable(attachedDatabase, alias);
  }
}

class SessionEntityData extends DataClass
    implements Insertable<SessionEntityData> {
  final int id;
  final String date;
  final String dateAccuracy;
  final int location;
  final String ringerId;
  final String startTime;
  final String endTime;
  const SessionEntityData(
      {required this.id,
      required this.date,
      required this.dateAccuracy,
      required this.location,
      required this.ringerId,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<String>(date);
    map['date_accuracy'] = Variable<String>(dateAccuracy);
    map['location'] = Variable<int>(location);
    map['ringer_id'] = Variable<String>(ringerId);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    return map;
  }

  SessionEntityCompanion toCompanion(bool nullToAbsent) {
    return SessionEntityCompanion(
      id: Value(id),
      date: Value(date),
      dateAccuracy: Value(dateAccuracy),
      location: Value(location),
      ringerId: Value(ringerId),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory SessionEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionEntityData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String>(json['date']),
      dateAccuracy: serializer.fromJson<String>(json['dateAccuracy']),
      location: serializer.fromJson<int>(json['location']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String>(date),
      'dateAccuracy': serializer.toJson<String>(dateAccuracy),
      'location': serializer.toJson<int>(location),
      'ringerId': serializer.toJson<String>(ringerId),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
    };
  }

  SessionEntityData copyWith(
          {int? id,
          String? date,
          String? dateAccuracy,
          int? location,
          String? ringerId,
          String? startTime,
          String? endTime}) =>
      SessionEntityData(
        id: id ?? this.id,
        date: date ?? this.date,
        dateAccuracy: dateAccuracy ?? this.dateAccuracy,
        location: location ?? this.location,
        ringerId: ringerId ?? this.ringerId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  @override
  String toString() {
    return (StringBuffer('SessionEntityData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('dateAccuracy: $dateAccuracy, ')
          ..write('location: $location, ')
          ..write('ringerId: $ringerId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, date, dateAccuracy, location, ringerId, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionEntityData &&
          other.id == this.id &&
          other.date == this.date &&
          other.dateAccuracy == this.dateAccuracy &&
          other.location == this.location &&
          other.ringerId == this.ringerId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class SessionEntityCompanion extends UpdateCompanion<SessionEntityData> {
  final Value<int> id;
  final Value<String> date;
  final Value<String> dateAccuracy;
  final Value<int> location;
  final Value<String> ringerId;
  final Value<String> startTime;
  final Value<String> endTime;
  const SessionEntityCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.dateAccuracy = const Value.absent(),
    this.location = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  SessionEntityCompanion.insert({
    this.id = const Value.absent(),
    required String date,
    required String dateAccuracy,
    required int location,
    required String ringerId,
    required String startTime,
    required String endTime,
  })  : date = Value(date),
        dateAccuracy = Value(dateAccuracy),
        location = Value(location),
        ringerId = Value(ringerId),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<SessionEntityData> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<String>? dateAccuracy,
    Expression<int>? location,
    Expression<String>? ringerId,
    Expression<String>? startTime,
    Expression<String>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (dateAccuracy != null) 'date_accuracy': dateAccuracy,
      if (location != null) 'location': location,
      if (ringerId != null) 'ringer_id': ringerId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  SessionEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? date,
      Value<String>? dateAccuracy,
      Value<int>? location,
      Value<String>? ringerId,
      Value<String>? startTime,
      Value<String>? endTime}) {
    return SessionEntityCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      dateAccuracy: dateAccuracy ?? this.dateAccuracy,
      location: location ?? this.location,
      ringerId: ringerId ?? this.ringerId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (dateAccuracy.present) {
      map['date_accuracy'] = Variable<String>(dateAccuracy.value);
    }
    if (location.present) {
      map['location'] = Variable<int>(location.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionEntityCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('dateAccuracy: $dateAccuracy, ')
          ..write('location: $location, ')
          ..write('ringerId: $ringerId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $RetrapEntityTable extends RetrapEntity
    with TableInfo<$RetrapEntityTable, RetrapEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RetrapEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES session_entity (id)'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringSeriesCodeMeta =
      const VerificationMeta('ringSeriesCode');
  @override
  late final GeneratedColumn<String> ringSeriesCode = GeneratedColumn<String>(
      'ring_series_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringIdNumberMeta =
      const VerificationMeta('ringIdNumber');
  @override
  late final GeneratedColumn<String> ringIdNumber = GeneratedColumn<String>(
      'ring_id_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringSchemeMeta =
      const VerificationMeta('ringScheme');
  @override
  late final GeneratedColumn<String> ringScheme = GeneratedColumn<String>(
      'ring_scheme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryIdMethodMeta =
      const VerificationMeta('primaryIdMethod');
  @override
  late final GeneratedColumn<String> primaryIdMethod = GeneratedColumn<String>(
      'primary_id_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metalRingInfoMeta =
      const VerificationMeta('metalRingInfo');
  @override
  late final GeneratedColumn<String> metalRingInfo = GeneratedColumn<String>(
      'metal_ring_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'age', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexingMethodMeta =
      const VerificationMeta('sexingMethod');
  @override
  late final GeneratedColumn<String> sexingMethod = GeneratedColumn<String>(
      'sexing_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _otherMarksMeta =
      const VerificationMeta('otherMarks');
  @override
  late final GeneratedColumn<String> otherMarks = GeneratedColumn<String>(
      'other_marks', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _catchingMethodMeta =
      const VerificationMeta('catchingMethod');
  @override
  late final GeneratedColumn<String> catchingMethod = GeneratedColumn<String>(
      'catching_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _catchingLuresMeta =
      const VerificationMeta('catchingLures');
  @override
  late final GeneratedColumn<String> catchingLures = GeneratedColumn<String>(
      'catching_lures', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _circumstancesMeta =
      const VerificationMeta('circumstances');
  @override
  late final GeneratedColumn<String> circumstances = GeneratedColumn<String>(
      'circumstances', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _circumstancesPresumedMeta =
      const VerificationMeta('circumstancesPresumed');
  @override
  late final GeneratedColumn<String> circumstancesPresumed =
      GeneratedColumn<String>('circumstances_presumed', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wingLengthMeta =
      const VerificationMeta('wingLength');
  @override
  late final GeneratedColumn<String> wingLength = GeneratedColumn<String>(
      'wing_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thirdPrimaryMeta =
      const VerificationMeta('thirdPrimary');
  @override
  late final GeneratedColumn<String> thirdPrimary = GeneratedColumn<String>(
      'third_primary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wingPointStateMeta =
      const VerificationMeta('wingPointState');
  @override
  late final GeneratedColumn<String> wingPointState = GeneratedColumn<String>(
      'wing_point_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _massMeta = const VerificationMeta('mass');
  @override
  late final GeneratedColumn<String> mass = GeneratedColumn<String>(
      'mass', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moultMeta = const VerificationMeta('moult');
  @override
  late final GeneratedColumn<String> moult = GeneratedColumn<String>(
      'moult', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plumageCodeMeta =
      const VerificationMeta('plumageCode');
  @override
  late final GeneratedColumn<String> plumageCode = GeneratedColumn<String>(
      'plumage_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hindClawMeta =
      const VerificationMeta('hindClaw');
  @override
  late final GeneratedColumn<String> hindClaw = GeneratedColumn<String>(
      'hind_claw', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billLengthMeta =
      const VerificationMeta('billLength');
  @override
  late final GeneratedColumn<String> billLength = GeneratedColumn<String>(
      'bill_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billMethodMeta =
      const VerificationMeta('billMethod');
  @override
  late final GeneratedColumn<String> billMethod = GeneratedColumn<String>(
      'bill_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _headLengthTotalMeta =
      const VerificationMeta('headLengthTotal');
  @override
  late final GeneratedColumn<String> headLengthTotal = GeneratedColumn<String>(
      'head_length_total', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tarsusMeta = const VerificationMeta('tarsus');
  @override
  late final GeneratedColumn<String> tarsus = GeneratedColumn<String>(
      'tarsus', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tarsusMethodMeta =
      const VerificationMeta('tarsusMethod');
  @override
  late final GeneratedColumn<String> tarsusMethod = GeneratedColumn<String>(
      'tarsus_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tailLengthMeta =
      const VerificationMeta('tailLength');
  @override
  late final GeneratedColumn<String> tailLength = GeneratedColumn<String>(
      'tail_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tailDifferenceMeta =
      const VerificationMeta('tailDifference');
  @override
  late final GeneratedColumn<String> tailDifference = GeneratedColumn<String>(
      'tail_difference', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fatScoreMeta =
      const VerificationMeta('fatScore');
  @override
  late final GeneratedColumn<String> fatScore = GeneratedColumn<String>(
      'fat_score', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fatScoreMethodMeta =
      const VerificationMeta('fatScoreMethod');
  @override
  late final GeneratedColumn<String> fatScoreMethod = GeneratedColumn<String>(
      'fat_score_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pectoralMuscleMeta =
      const VerificationMeta('pectoralMuscle');
  @override
  late final GeneratedColumn<String> pectoralMuscle = GeneratedColumn<String>(
      'pectoral_muscle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _broodPatchMeta =
      const VerificationMeta('broodPatch');
  @override
  late final GeneratedColumn<String> broodPatch = GeneratedColumn<String>(
      'brood_patch', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryScoreMeta =
      const VerificationMeta('primaryScore');
  @override
  late final GeneratedColumn<String> primaryScore = GeneratedColumn<String>(
      'primary_score', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryMoultMeta =
      const VerificationMeta('primaryMoult');
  @override
  late final GeneratedColumn<String> primaryMoult = GeneratedColumn<String>(
      'primary_moult', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oldGreaterCovertsMeta =
      const VerificationMeta('oldGreaterCoverts');
  @override
  late final GeneratedColumn<String> oldGreaterCoverts =
      GeneratedColumn<String>('old_greater_coverts', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alulaMeta = const VerificationMeta('alula');
  @override
  late final GeneratedColumn<String> alula = GeneratedColumn<String>(
      'alula', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _carpalCovertMeta =
      const VerificationMeta('carpalCovert');
  @override
  late final GeneratedColumn<String> carpalCovert = GeneratedColumn<String>(
      'carpal_covert', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        ringerId,
        ringSeriesCode,
        ringIdNumber,
        ringScheme,
        condition,
        primaryIdMethod,
        metalRingInfo,
        species,
        age,
        sex,
        sexingMethod,
        otherMarks,
        catchingMethod,
        catchingLures,
        circumstances,
        circumstancesPresumed,
        status,
        time,
        wingLength,
        thirdPrimary,
        wingPointState,
        mass,
        moult,
        plumageCode,
        hindClaw,
        billLength,
        billMethod,
        headLengthTotal,
        tarsus,
        tarsusMethod,
        tailLength,
        tailDifference,
        fatScore,
        fatScoreMethod,
        pectoralMuscle,
        broodPatch,
        primaryScore,
        primaryMoult,
        oldGreaterCoverts,
        alula,
        carpalCovert
      ];
  @override
  String get aliasedName => _alias ?? 'retrap_entity';
  @override
  String get actualTableName => 'retrap_entity';
  @override
  VerificationContext validateIntegrity(Insertable<RetrapEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('ring_series_code')) {
      context.handle(
          _ringSeriesCodeMeta,
          ringSeriesCode.isAcceptableOrUnknown(
              data['ring_series_code']!, _ringSeriesCodeMeta));
    } else if (isInserting) {
      context.missing(_ringSeriesCodeMeta);
    }
    if (data.containsKey('ring_id_number')) {
      context.handle(
          _ringIdNumberMeta,
          ringIdNumber.isAcceptableOrUnknown(
              data['ring_id_number']!, _ringIdNumberMeta));
    } else if (isInserting) {
      context.missing(_ringIdNumberMeta);
    }
    if (data.containsKey('ring_scheme')) {
      context.handle(
          _ringSchemeMeta,
          ringScheme.isAcceptableOrUnknown(
              data['ring_scheme']!, _ringSchemeMeta));
    } else if (isInserting) {
      context.missing(_ringSchemeMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('primary_id_method')) {
      context.handle(
          _primaryIdMethodMeta,
          primaryIdMethod.isAcceptableOrUnknown(
              data['primary_id_method']!, _primaryIdMethodMeta));
    } else if (isInserting) {
      context.missing(_primaryIdMethodMeta);
    }
    if (data.containsKey('metal_ring_info')) {
      context.handle(
          _metalRingInfoMeta,
          metalRingInfo.isAcceptableOrUnknown(
              data['metal_ring_info']!, _metalRingInfoMeta));
    } else if (isInserting) {
      context.missing(_metalRingInfoMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('sexing_method')) {
      context.handle(
          _sexingMethodMeta,
          sexingMethod.isAcceptableOrUnknown(
              data['sexing_method']!, _sexingMethodMeta));
    } else if (isInserting) {
      context.missing(_sexingMethodMeta);
    }
    if (data.containsKey('other_marks')) {
      context.handle(
          _otherMarksMeta,
          otherMarks.isAcceptableOrUnknown(
              data['other_marks']!, _otherMarksMeta));
    } else if (isInserting) {
      context.missing(_otherMarksMeta);
    }
    if (data.containsKey('catching_method')) {
      context.handle(
          _catchingMethodMeta,
          catchingMethod.isAcceptableOrUnknown(
              data['catching_method']!, _catchingMethodMeta));
    } else if (isInserting) {
      context.missing(_catchingMethodMeta);
    }
    if (data.containsKey('catching_lures')) {
      context.handle(
          _catchingLuresMeta,
          catchingLures.isAcceptableOrUnknown(
              data['catching_lures']!, _catchingLuresMeta));
    } else if (isInserting) {
      context.missing(_catchingLuresMeta);
    }
    if (data.containsKey('circumstances')) {
      context.handle(
          _circumstancesMeta,
          circumstances.isAcceptableOrUnknown(
              data['circumstances']!, _circumstancesMeta));
    } else if (isInserting) {
      context.missing(_circumstancesMeta);
    }
    if (data.containsKey('circumstances_presumed')) {
      context.handle(
          _circumstancesPresumedMeta,
          circumstancesPresumed.isAcceptableOrUnknown(
              data['circumstances_presumed']!, _circumstancesPresumedMeta));
    } else if (isInserting) {
      context.missing(_circumstancesPresumedMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('wing_length')) {
      context.handle(
          _wingLengthMeta,
          wingLength.isAcceptableOrUnknown(
              data['wing_length']!, _wingLengthMeta));
    } else if (isInserting) {
      context.missing(_wingLengthMeta);
    }
    if (data.containsKey('third_primary')) {
      context.handle(
          _thirdPrimaryMeta,
          thirdPrimary.isAcceptableOrUnknown(
              data['third_primary']!, _thirdPrimaryMeta));
    } else if (isInserting) {
      context.missing(_thirdPrimaryMeta);
    }
    if (data.containsKey('wing_point_state')) {
      context.handle(
          _wingPointStateMeta,
          wingPointState.isAcceptableOrUnknown(
              data['wing_point_state']!, _wingPointStateMeta));
    } else if (isInserting) {
      context.missing(_wingPointStateMeta);
    }
    if (data.containsKey('mass')) {
      context.handle(
          _massMeta, mass.isAcceptableOrUnknown(data['mass']!, _massMeta));
    } else if (isInserting) {
      context.missing(_massMeta);
    }
    if (data.containsKey('moult')) {
      context.handle(
          _moultMeta, moult.isAcceptableOrUnknown(data['moult']!, _moultMeta));
    } else if (isInserting) {
      context.missing(_moultMeta);
    }
    if (data.containsKey('plumage_code')) {
      context.handle(
          _plumageCodeMeta,
          plumageCode.isAcceptableOrUnknown(
              data['plumage_code']!, _plumageCodeMeta));
    } else if (isInserting) {
      context.missing(_plumageCodeMeta);
    }
    if (data.containsKey('hind_claw')) {
      context.handle(_hindClawMeta,
          hindClaw.isAcceptableOrUnknown(data['hind_claw']!, _hindClawMeta));
    } else if (isInserting) {
      context.missing(_hindClawMeta);
    }
    if (data.containsKey('bill_length')) {
      context.handle(
          _billLengthMeta,
          billLength.isAcceptableOrUnknown(
              data['bill_length']!, _billLengthMeta));
    } else if (isInserting) {
      context.missing(_billLengthMeta);
    }
    if (data.containsKey('bill_method')) {
      context.handle(
          _billMethodMeta,
          billMethod.isAcceptableOrUnknown(
              data['bill_method']!, _billMethodMeta));
    } else if (isInserting) {
      context.missing(_billMethodMeta);
    }
    if (data.containsKey('head_length_total')) {
      context.handle(
          _headLengthTotalMeta,
          headLengthTotal.isAcceptableOrUnknown(
              data['head_length_total']!, _headLengthTotalMeta));
    } else if (isInserting) {
      context.missing(_headLengthTotalMeta);
    }
    if (data.containsKey('tarsus')) {
      context.handle(_tarsusMeta,
          tarsus.isAcceptableOrUnknown(data['tarsus']!, _tarsusMeta));
    } else if (isInserting) {
      context.missing(_tarsusMeta);
    }
    if (data.containsKey('tarsus_method')) {
      context.handle(
          _tarsusMethodMeta,
          tarsusMethod.isAcceptableOrUnknown(
              data['tarsus_method']!, _tarsusMethodMeta));
    } else if (isInserting) {
      context.missing(_tarsusMethodMeta);
    }
    if (data.containsKey('tail_length')) {
      context.handle(
          _tailLengthMeta,
          tailLength.isAcceptableOrUnknown(
              data['tail_length']!, _tailLengthMeta));
    } else if (isInserting) {
      context.missing(_tailLengthMeta);
    }
    if (data.containsKey('tail_difference')) {
      context.handle(
          _tailDifferenceMeta,
          tailDifference.isAcceptableOrUnknown(
              data['tail_difference']!, _tailDifferenceMeta));
    } else if (isInserting) {
      context.missing(_tailDifferenceMeta);
    }
    if (data.containsKey('fat_score')) {
      context.handle(_fatScoreMeta,
          fatScore.isAcceptableOrUnknown(data['fat_score']!, _fatScoreMeta));
    } else if (isInserting) {
      context.missing(_fatScoreMeta);
    }
    if (data.containsKey('fat_score_method')) {
      context.handle(
          _fatScoreMethodMeta,
          fatScoreMethod.isAcceptableOrUnknown(
              data['fat_score_method']!, _fatScoreMethodMeta));
    } else if (isInserting) {
      context.missing(_fatScoreMethodMeta);
    }
    if (data.containsKey('pectoral_muscle')) {
      context.handle(
          _pectoralMuscleMeta,
          pectoralMuscle.isAcceptableOrUnknown(
              data['pectoral_muscle']!, _pectoralMuscleMeta));
    } else if (isInserting) {
      context.missing(_pectoralMuscleMeta);
    }
    if (data.containsKey('brood_patch')) {
      context.handle(
          _broodPatchMeta,
          broodPatch.isAcceptableOrUnknown(
              data['brood_patch']!, _broodPatchMeta));
    } else if (isInserting) {
      context.missing(_broodPatchMeta);
    }
    if (data.containsKey('primary_score')) {
      context.handle(
          _primaryScoreMeta,
          primaryScore.isAcceptableOrUnknown(
              data['primary_score']!, _primaryScoreMeta));
    } else if (isInserting) {
      context.missing(_primaryScoreMeta);
    }
    if (data.containsKey('primary_moult')) {
      context.handle(
          _primaryMoultMeta,
          primaryMoult.isAcceptableOrUnknown(
              data['primary_moult']!, _primaryMoultMeta));
    } else if (isInserting) {
      context.missing(_primaryMoultMeta);
    }
    if (data.containsKey('old_greater_coverts')) {
      context.handle(
          _oldGreaterCovertsMeta,
          oldGreaterCoverts.isAcceptableOrUnknown(
              data['old_greater_coverts']!, _oldGreaterCovertsMeta));
    } else if (isInserting) {
      context.missing(_oldGreaterCovertsMeta);
    }
    if (data.containsKey('alula')) {
      context.handle(
          _alulaMeta, alula.isAcceptableOrUnknown(data['alula']!, _alulaMeta));
    } else if (isInserting) {
      context.missing(_alulaMeta);
    }
    if (data.containsKey('carpal_covert')) {
      context.handle(
          _carpalCovertMeta,
          carpalCovert.isAcceptableOrUnknown(
              data['carpal_covert']!, _carpalCovertMeta));
    } else if (isInserting) {
      context.missing(_carpalCovertMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RetrapEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetrapEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      ringSeriesCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ring_series_code'])!,
      ringIdNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ring_id_number'])!,
      ringScheme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ring_scheme'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      primaryIdMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}primary_id_method'])!,
      metalRingInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}metal_ring_info'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      sexingMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sexing_method'])!,
      otherMarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other_marks'])!,
      catchingMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}catching_method'])!,
      catchingLures: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}catching_lures'])!,
      circumstances: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}circumstances'])!,
      circumstancesPresumed: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}circumstances_presumed'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      wingLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wing_length'])!,
      thirdPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}third_primary'])!,
      wingPointState: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}wing_point_state'])!,
      mass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mass'])!,
      moult: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}moult'])!,
      plumageCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plumage_code'])!,
      hindClaw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hind_claw'])!,
      billLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_length'])!,
      billMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_method'])!,
      headLengthTotal: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}head_length_total'])!,
      tarsus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tarsus'])!,
      tarsusMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tarsus_method'])!,
      tailLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tail_length'])!,
      tailDifference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tail_difference'])!,
      fatScore: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fat_score'])!,
      fatScoreMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fat_score_method'])!,
      pectoralMuscle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}pectoral_muscle'])!,
      broodPatch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brood_patch'])!,
      primaryScore: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_score'])!,
      primaryMoult: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_moult'])!,
      oldGreaterCoverts: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}old_greater_coverts'])!,
      alula: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alula'])!,
      carpalCovert: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}carpal_covert'])!,
    );
  }

  @override
  $RetrapEntityTable createAlias(String alias) {
    return $RetrapEntityTable(attachedDatabase, alias);
  }
}

class RetrapEntityData extends DataClass
    implements Insertable<RetrapEntityData> {
  final int id;
  final int sessionId;
  final String ringerId;
  final String ringSeriesCode;
  final String ringIdNumber;
  final String ringScheme;
  final String condition;
  final String primaryIdMethod;
  final String metalRingInfo;
  final String species;
  final String age;
  final String sex;
  final String sexingMethod;
  final String otherMarks;
  final String catchingMethod;
  final String catchingLures;
  final String circumstances;
  final String circumstancesPresumed;
  final String status;
  final String time;
  final String wingLength;
  final String thirdPrimary;
  final String wingPointState;
  final String mass;
  final String moult;
  final String plumageCode;
  final String hindClaw;
  final String billLength;
  final String billMethod;
  final String headLengthTotal;
  final String tarsus;
  final String tarsusMethod;
  final String tailLength;
  final String tailDifference;
  final String fatScore;
  final String fatScoreMethod;
  final String pectoralMuscle;
  final String broodPatch;
  final String primaryScore;
  final String primaryMoult;
  final String oldGreaterCoverts;
  final String alula;
  final String carpalCovert;
  const RetrapEntityData(
      {required this.id,
      required this.sessionId,
      required this.ringerId,
      required this.ringSeriesCode,
      required this.ringIdNumber,
      required this.ringScheme,
      required this.condition,
      required this.primaryIdMethod,
      required this.metalRingInfo,
      required this.species,
      required this.age,
      required this.sex,
      required this.sexingMethod,
      required this.otherMarks,
      required this.catchingMethod,
      required this.catchingLures,
      required this.circumstances,
      required this.circumstancesPresumed,
      required this.status,
      required this.time,
      required this.wingLength,
      required this.thirdPrimary,
      required this.wingPointState,
      required this.mass,
      required this.moult,
      required this.plumageCode,
      required this.hindClaw,
      required this.billLength,
      required this.billMethod,
      required this.headLengthTotal,
      required this.tarsus,
      required this.tarsusMethod,
      required this.tailLength,
      required this.tailDifference,
      required this.fatScore,
      required this.fatScoreMethod,
      required this.pectoralMuscle,
      required this.broodPatch,
      required this.primaryScore,
      required this.primaryMoult,
      required this.oldGreaterCoverts,
      required this.alula,
      required this.carpalCovert});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['ringer_id'] = Variable<String>(ringerId);
    map['ring_series_code'] = Variable<String>(ringSeriesCode);
    map['ring_id_number'] = Variable<String>(ringIdNumber);
    map['ring_scheme'] = Variable<String>(ringScheme);
    map['condition'] = Variable<String>(condition);
    map['primary_id_method'] = Variable<String>(primaryIdMethod);
    map['metal_ring_info'] = Variable<String>(metalRingInfo);
    map['species'] = Variable<String>(species);
    map['age'] = Variable<String>(age);
    map['sex'] = Variable<String>(sex);
    map['sexing_method'] = Variable<String>(sexingMethod);
    map['other_marks'] = Variable<String>(otherMarks);
    map['catching_method'] = Variable<String>(catchingMethod);
    map['catching_lures'] = Variable<String>(catchingLures);
    map['circumstances'] = Variable<String>(circumstances);
    map['circumstances_presumed'] = Variable<String>(circumstancesPresumed);
    map['status'] = Variable<String>(status);
    map['time'] = Variable<String>(time);
    map['wing_length'] = Variable<String>(wingLength);
    map['third_primary'] = Variable<String>(thirdPrimary);
    map['wing_point_state'] = Variable<String>(wingPointState);
    map['mass'] = Variable<String>(mass);
    map['moult'] = Variable<String>(moult);
    map['plumage_code'] = Variable<String>(plumageCode);
    map['hind_claw'] = Variable<String>(hindClaw);
    map['bill_length'] = Variable<String>(billLength);
    map['bill_method'] = Variable<String>(billMethod);
    map['head_length_total'] = Variable<String>(headLengthTotal);
    map['tarsus'] = Variable<String>(tarsus);
    map['tarsus_method'] = Variable<String>(tarsusMethod);
    map['tail_length'] = Variable<String>(tailLength);
    map['tail_difference'] = Variable<String>(tailDifference);
    map['fat_score'] = Variable<String>(fatScore);
    map['fat_score_method'] = Variable<String>(fatScoreMethod);
    map['pectoral_muscle'] = Variable<String>(pectoralMuscle);
    map['brood_patch'] = Variable<String>(broodPatch);
    map['primary_score'] = Variable<String>(primaryScore);
    map['primary_moult'] = Variable<String>(primaryMoult);
    map['old_greater_coverts'] = Variable<String>(oldGreaterCoverts);
    map['alula'] = Variable<String>(alula);
    map['carpal_covert'] = Variable<String>(carpalCovert);
    return map;
  }

  RetrapEntityCompanion toCompanion(bool nullToAbsent) {
    return RetrapEntityCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      ringerId: Value(ringerId),
      ringSeriesCode: Value(ringSeriesCode),
      ringIdNumber: Value(ringIdNumber),
      ringScheme: Value(ringScheme),
      condition: Value(condition),
      primaryIdMethod: Value(primaryIdMethod),
      metalRingInfo: Value(metalRingInfo),
      species: Value(species),
      age: Value(age),
      sex: Value(sex),
      sexingMethod: Value(sexingMethod),
      otherMarks: Value(otherMarks),
      catchingMethod: Value(catchingMethod),
      catchingLures: Value(catchingLures),
      circumstances: Value(circumstances),
      circumstancesPresumed: Value(circumstancesPresumed),
      status: Value(status),
      time: Value(time),
      wingLength: Value(wingLength),
      thirdPrimary: Value(thirdPrimary),
      wingPointState: Value(wingPointState),
      mass: Value(mass),
      moult: Value(moult),
      plumageCode: Value(plumageCode),
      hindClaw: Value(hindClaw),
      billLength: Value(billLength),
      billMethod: Value(billMethod),
      headLengthTotal: Value(headLengthTotal),
      tarsus: Value(tarsus),
      tarsusMethod: Value(tarsusMethod),
      tailLength: Value(tailLength),
      tailDifference: Value(tailDifference),
      fatScore: Value(fatScore),
      fatScoreMethod: Value(fatScoreMethod),
      pectoralMuscle: Value(pectoralMuscle),
      broodPatch: Value(broodPatch),
      primaryScore: Value(primaryScore),
      primaryMoult: Value(primaryMoult),
      oldGreaterCoverts: Value(oldGreaterCoverts),
      alula: Value(alula),
      carpalCovert: Value(carpalCovert),
    );
  }

  factory RetrapEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetrapEntityData(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      ringSeriesCode: serializer.fromJson<String>(json['ringSeriesCode']),
      ringIdNumber: serializer.fromJson<String>(json['ringIdNumber']),
      ringScheme: serializer.fromJson<String>(json['ringScheme']),
      condition: serializer.fromJson<String>(json['condition']),
      primaryIdMethod: serializer.fromJson<String>(json['primaryIdMethod']),
      metalRingInfo: serializer.fromJson<String>(json['metalRingInfo']),
      species: serializer.fromJson<String>(json['species']),
      age: serializer.fromJson<String>(json['age']),
      sex: serializer.fromJson<String>(json['sex']),
      sexingMethod: serializer.fromJson<String>(json['sexingMethod']),
      otherMarks: serializer.fromJson<String>(json['otherMarks']),
      catchingMethod: serializer.fromJson<String>(json['catchingMethod']),
      catchingLures: serializer.fromJson<String>(json['catchingLures']),
      circumstances: serializer.fromJson<String>(json['circumstances']),
      circumstancesPresumed:
          serializer.fromJson<String>(json['circumstancesPresumed']),
      status: serializer.fromJson<String>(json['status']),
      time: serializer.fromJson<String>(json['time']),
      wingLength: serializer.fromJson<String>(json['wingLength']),
      thirdPrimary: serializer.fromJson<String>(json['thirdPrimary']),
      wingPointState: serializer.fromJson<String>(json['wingPointState']),
      mass: serializer.fromJson<String>(json['mass']),
      moult: serializer.fromJson<String>(json['moult']),
      plumageCode: serializer.fromJson<String>(json['plumageCode']),
      hindClaw: serializer.fromJson<String>(json['hindClaw']),
      billLength: serializer.fromJson<String>(json['billLength']),
      billMethod: serializer.fromJson<String>(json['billMethod']),
      headLengthTotal: serializer.fromJson<String>(json['headLengthTotal']),
      tarsus: serializer.fromJson<String>(json['tarsus']),
      tarsusMethod: serializer.fromJson<String>(json['tarsusMethod']),
      tailLength: serializer.fromJson<String>(json['tailLength']),
      tailDifference: serializer.fromJson<String>(json['tailDifference']),
      fatScore: serializer.fromJson<String>(json['fatScore']),
      fatScoreMethod: serializer.fromJson<String>(json['fatScoreMethod']),
      pectoralMuscle: serializer.fromJson<String>(json['pectoralMuscle']),
      broodPatch: serializer.fromJson<String>(json['broodPatch']),
      primaryScore: serializer.fromJson<String>(json['primaryScore']),
      primaryMoult: serializer.fromJson<String>(json['primaryMoult']),
      oldGreaterCoverts: serializer.fromJson<String>(json['oldGreaterCoverts']),
      alula: serializer.fromJson<String>(json['alula']),
      carpalCovert: serializer.fromJson<String>(json['carpalCovert']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'ringerId': serializer.toJson<String>(ringerId),
      'ringSeriesCode': serializer.toJson<String>(ringSeriesCode),
      'ringIdNumber': serializer.toJson<String>(ringIdNumber),
      'ringScheme': serializer.toJson<String>(ringScheme),
      'condition': serializer.toJson<String>(condition),
      'primaryIdMethod': serializer.toJson<String>(primaryIdMethod),
      'metalRingInfo': serializer.toJson<String>(metalRingInfo),
      'species': serializer.toJson<String>(species),
      'age': serializer.toJson<String>(age),
      'sex': serializer.toJson<String>(sex),
      'sexingMethod': serializer.toJson<String>(sexingMethod),
      'otherMarks': serializer.toJson<String>(otherMarks),
      'catchingMethod': serializer.toJson<String>(catchingMethod),
      'catchingLures': serializer.toJson<String>(catchingLures),
      'circumstances': serializer.toJson<String>(circumstances),
      'circumstancesPresumed': serializer.toJson<String>(circumstancesPresumed),
      'status': serializer.toJson<String>(status),
      'time': serializer.toJson<String>(time),
      'wingLength': serializer.toJson<String>(wingLength),
      'thirdPrimary': serializer.toJson<String>(thirdPrimary),
      'wingPointState': serializer.toJson<String>(wingPointState),
      'mass': serializer.toJson<String>(mass),
      'moult': serializer.toJson<String>(moult),
      'plumageCode': serializer.toJson<String>(plumageCode),
      'hindClaw': serializer.toJson<String>(hindClaw),
      'billLength': serializer.toJson<String>(billLength),
      'billMethod': serializer.toJson<String>(billMethod),
      'headLengthTotal': serializer.toJson<String>(headLengthTotal),
      'tarsus': serializer.toJson<String>(tarsus),
      'tarsusMethod': serializer.toJson<String>(tarsusMethod),
      'tailLength': serializer.toJson<String>(tailLength),
      'tailDifference': serializer.toJson<String>(tailDifference),
      'fatScore': serializer.toJson<String>(fatScore),
      'fatScoreMethod': serializer.toJson<String>(fatScoreMethod),
      'pectoralMuscle': serializer.toJson<String>(pectoralMuscle),
      'broodPatch': serializer.toJson<String>(broodPatch),
      'primaryScore': serializer.toJson<String>(primaryScore),
      'primaryMoult': serializer.toJson<String>(primaryMoult),
      'oldGreaterCoverts': serializer.toJson<String>(oldGreaterCoverts),
      'alula': serializer.toJson<String>(alula),
      'carpalCovert': serializer.toJson<String>(carpalCovert),
    };
  }

  RetrapEntityData copyWith(
          {int? id,
          int? sessionId,
          String? ringerId,
          String? ringSeriesCode,
          String? ringIdNumber,
          String? ringScheme,
          String? condition,
          String? primaryIdMethod,
          String? metalRingInfo,
          String? species,
          String? age,
          String? sex,
          String? sexingMethod,
          String? otherMarks,
          String? catchingMethod,
          String? catchingLures,
          String? circumstances,
          String? circumstancesPresumed,
          String? status,
          String? time,
          String? wingLength,
          String? thirdPrimary,
          String? wingPointState,
          String? mass,
          String? moult,
          String? plumageCode,
          String? hindClaw,
          String? billLength,
          String? billMethod,
          String? headLengthTotal,
          String? tarsus,
          String? tarsusMethod,
          String? tailLength,
          String? tailDifference,
          String? fatScore,
          String? fatScoreMethod,
          String? pectoralMuscle,
          String? broodPatch,
          String? primaryScore,
          String? primaryMoult,
          String? oldGreaterCoverts,
          String? alula,
          String? carpalCovert}) =>
      RetrapEntityData(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        ringerId: ringerId ?? this.ringerId,
        ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
        ringIdNumber: ringIdNumber ?? this.ringIdNumber,
        ringScheme: ringScheme ?? this.ringScheme,
        condition: condition ?? this.condition,
        primaryIdMethod: primaryIdMethod ?? this.primaryIdMethod,
        metalRingInfo: metalRingInfo ?? this.metalRingInfo,
        species: species ?? this.species,
        age: age ?? this.age,
        sex: sex ?? this.sex,
        sexingMethod: sexingMethod ?? this.sexingMethod,
        otherMarks: otherMarks ?? this.otherMarks,
        catchingMethod: catchingMethod ?? this.catchingMethod,
        catchingLures: catchingLures ?? this.catchingLures,
        circumstances: circumstances ?? this.circumstances,
        circumstancesPresumed:
            circumstancesPresumed ?? this.circumstancesPresumed,
        status: status ?? this.status,
        time: time ?? this.time,
        wingLength: wingLength ?? this.wingLength,
        thirdPrimary: thirdPrimary ?? this.thirdPrimary,
        wingPointState: wingPointState ?? this.wingPointState,
        mass: mass ?? this.mass,
        moult: moult ?? this.moult,
        plumageCode: plumageCode ?? this.plumageCode,
        hindClaw: hindClaw ?? this.hindClaw,
        billLength: billLength ?? this.billLength,
        billMethod: billMethod ?? this.billMethod,
        headLengthTotal: headLengthTotal ?? this.headLengthTotal,
        tarsus: tarsus ?? this.tarsus,
        tarsusMethod: tarsusMethod ?? this.tarsusMethod,
        tailLength: tailLength ?? this.tailLength,
        tailDifference: tailDifference ?? this.tailDifference,
        fatScore: fatScore ?? this.fatScore,
        fatScoreMethod: fatScoreMethod ?? this.fatScoreMethod,
        pectoralMuscle: pectoralMuscle ?? this.pectoralMuscle,
        broodPatch: broodPatch ?? this.broodPatch,
        primaryScore: primaryScore ?? this.primaryScore,
        primaryMoult: primaryMoult ?? this.primaryMoult,
        oldGreaterCoverts: oldGreaterCoverts ?? this.oldGreaterCoverts,
        alula: alula ?? this.alula,
        carpalCovert: carpalCovert ?? this.carpalCovert,
      );
  @override
  String toString() {
    return (StringBuffer('RetrapEntityData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('ringerId: $ringerId, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('ringIdNumber: $ringIdNumber, ')
          ..write('ringScheme: $ringScheme, ')
          ..write('condition: $condition, ')
          ..write('primaryIdMethod: $primaryIdMethod, ')
          ..write('metalRingInfo: $metalRingInfo, ')
          ..write('species: $species, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('sexingMethod: $sexingMethod, ')
          ..write('otherMarks: $otherMarks, ')
          ..write('catchingMethod: $catchingMethod, ')
          ..write('catchingLures: $catchingLures, ')
          ..write('circumstances: $circumstances, ')
          ..write('circumstancesPresumed: $circumstancesPresumed, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('wingLength: $wingLength, ')
          ..write('thirdPrimary: $thirdPrimary, ')
          ..write('wingPointState: $wingPointState, ')
          ..write('mass: $mass, ')
          ..write('moult: $moult, ')
          ..write('plumageCode: $plumageCode, ')
          ..write('hindClaw: $hindClaw, ')
          ..write('billLength: $billLength, ')
          ..write('billMethod: $billMethod, ')
          ..write('headLengthTotal: $headLengthTotal, ')
          ..write('tarsus: $tarsus, ')
          ..write('tarsusMethod: $tarsusMethod, ')
          ..write('tailLength: $tailLength, ')
          ..write('tailDifference: $tailDifference, ')
          ..write('fatScore: $fatScore, ')
          ..write('fatScoreMethod: $fatScoreMethod, ')
          ..write('pectoralMuscle: $pectoralMuscle, ')
          ..write('broodPatch: $broodPatch, ')
          ..write('primaryScore: $primaryScore, ')
          ..write('primaryMoult: $primaryMoult, ')
          ..write('oldGreaterCoverts: $oldGreaterCoverts, ')
          ..write('alula: $alula, ')
          ..write('carpalCovert: $carpalCovert')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        sessionId,
        ringerId,
        ringSeriesCode,
        ringIdNumber,
        ringScheme,
        condition,
        primaryIdMethod,
        metalRingInfo,
        species,
        age,
        sex,
        sexingMethod,
        otherMarks,
        catchingMethod,
        catchingLures,
        circumstances,
        circumstancesPresumed,
        status,
        time,
        wingLength,
        thirdPrimary,
        wingPointState,
        mass,
        moult,
        plumageCode,
        hindClaw,
        billLength,
        billMethod,
        headLengthTotal,
        tarsus,
        tarsusMethod,
        tailLength,
        tailDifference,
        fatScore,
        fatScoreMethod,
        pectoralMuscle,
        broodPatch,
        primaryScore,
        primaryMoult,
        oldGreaterCoverts,
        alula,
        carpalCovert
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetrapEntityData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.ringerId == this.ringerId &&
          other.ringSeriesCode == this.ringSeriesCode &&
          other.ringIdNumber == this.ringIdNumber &&
          other.ringScheme == this.ringScheme &&
          other.condition == this.condition &&
          other.primaryIdMethod == this.primaryIdMethod &&
          other.metalRingInfo == this.metalRingInfo &&
          other.species == this.species &&
          other.age == this.age &&
          other.sex == this.sex &&
          other.sexingMethod == this.sexingMethod &&
          other.otherMarks == this.otherMarks &&
          other.catchingMethod == this.catchingMethod &&
          other.catchingLures == this.catchingLures &&
          other.circumstances == this.circumstances &&
          other.circumstancesPresumed == this.circumstancesPresumed &&
          other.status == this.status &&
          other.time == this.time &&
          other.wingLength == this.wingLength &&
          other.thirdPrimary == this.thirdPrimary &&
          other.wingPointState == this.wingPointState &&
          other.mass == this.mass &&
          other.moult == this.moult &&
          other.plumageCode == this.plumageCode &&
          other.hindClaw == this.hindClaw &&
          other.billLength == this.billLength &&
          other.billMethod == this.billMethod &&
          other.headLengthTotal == this.headLengthTotal &&
          other.tarsus == this.tarsus &&
          other.tarsusMethod == this.tarsusMethod &&
          other.tailLength == this.tailLength &&
          other.tailDifference == this.tailDifference &&
          other.fatScore == this.fatScore &&
          other.fatScoreMethod == this.fatScoreMethod &&
          other.pectoralMuscle == this.pectoralMuscle &&
          other.broodPatch == this.broodPatch &&
          other.primaryScore == this.primaryScore &&
          other.primaryMoult == this.primaryMoult &&
          other.oldGreaterCoverts == this.oldGreaterCoverts &&
          other.alula == this.alula &&
          other.carpalCovert == this.carpalCovert);
}

class RetrapEntityCompanion extends UpdateCompanion<RetrapEntityData> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<String> ringerId;
  final Value<String> ringSeriesCode;
  final Value<String> ringIdNumber;
  final Value<String> ringScheme;
  final Value<String> condition;
  final Value<String> primaryIdMethod;
  final Value<String> metalRingInfo;
  final Value<String> species;
  final Value<String> age;
  final Value<String> sex;
  final Value<String> sexingMethod;
  final Value<String> otherMarks;
  final Value<String> catchingMethod;
  final Value<String> catchingLures;
  final Value<String> circumstances;
  final Value<String> circumstancesPresumed;
  final Value<String> status;
  final Value<String> time;
  final Value<String> wingLength;
  final Value<String> thirdPrimary;
  final Value<String> wingPointState;
  final Value<String> mass;
  final Value<String> moult;
  final Value<String> plumageCode;
  final Value<String> hindClaw;
  final Value<String> billLength;
  final Value<String> billMethod;
  final Value<String> headLengthTotal;
  final Value<String> tarsus;
  final Value<String> tarsusMethod;
  final Value<String> tailLength;
  final Value<String> tailDifference;
  final Value<String> fatScore;
  final Value<String> fatScoreMethod;
  final Value<String> pectoralMuscle;
  final Value<String> broodPatch;
  final Value<String> primaryScore;
  final Value<String> primaryMoult;
  final Value<String> oldGreaterCoverts;
  final Value<String> alula;
  final Value<String> carpalCovert;
  const RetrapEntityCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.ringSeriesCode = const Value.absent(),
    this.ringIdNumber = const Value.absent(),
    this.ringScheme = const Value.absent(),
    this.condition = const Value.absent(),
    this.primaryIdMethod = const Value.absent(),
    this.metalRingInfo = const Value.absent(),
    this.species = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
    this.sexingMethod = const Value.absent(),
    this.otherMarks = const Value.absent(),
    this.catchingMethod = const Value.absent(),
    this.catchingLures = const Value.absent(),
    this.circumstances = const Value.absent(),
    this.circumstancesPresumed = const Value.absent(),
    this.status = const Value.absent(),
    this.time = const Value.absent(),
    this.wingLength = const Value.absent(),
    this.thirdPrimary = const Value.absent(),
    this.wingPointState = const Value.absent(),
    this.mass = const Value.absent(),
    this.moult = const Value.absent(),
    this.plumageCode = const Value.absent(),
    this.hindClaw = const Value.absent(),
    this.billLength = const Value.absent(),
    this.billMethod = const Value.absent(),
    this.headLengthTotal = const Value.absent(),
    this.tarsus = const Value.absent(),
    this.tarsusMethod = const Value.absent(),
    this.tailLength = const Value.absent(),
    this.tailDifference = const Value.absent(),
    this.fatScore = const Value.absent(),
    this.fatScoreMethod = const Value.absent(),
    this.pectoralMuscle = const Value.absent(),
    this.broodPatch = const Value.absent(),
    this.primaryScore = const Value.absent(),
    this.primaryMoult = const Value.absent(),
    this.oldGreaterCoverts = const Value.absent(),
    this.alula = const Value.absent(),
    this.carpalCovert = const Value.absent(),
  });
  RetrapEntityCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required String ringerId,
    required String ringSeriesCode,
    required String ringIdNumber,
    required String ringScheme,
    required String condition,
    required String primaryIdMethod,
    required String metalRingInfo,
    required String species,
    required String age,
    required String sex,
    required String sexingMethod,
    required String otherMarks,
    required String catchingMethod,
    required String catchingLures,
    required String circumstances,
    required String circumstancesPresumed,
    required String status,
    required String time,
    required String wingLength,
    required String thirdPrimary,
    required String wingPointState,
    required String mass,
    required String moult,
    required String plumageCode,
    required String hindClaw,
    required String billLength,
    required String billMethod,
    required String headLengthTotal,
    required String tarsus,
    required String tarsusMethod,
    required String tailLength,
    required String tailDifference,
    required String fatScore,
    required String fatScoreMethod,
    required String pectoralMuscle,
    required String broodPatch,
    required String primaryScore,
    required String primaryMoult,
    required String oldGreaterCoverts,
    required String alula,
    required String carpalCovert,
  })  : sessionId = Value(sessionId),
        ringerId = Value(ringerId),
        ringSeriesCode = Value(ringSeriesCode),
        ringIdNumber = Value(ringIdNumber),
        ringScheme = Value(ringScheme),
        condition = Value(condition),
        primaryIdMethod = Value(primaryIdMethod),
        metalRingInfo = Value(metalRingInfo),
        species = Value(species),
        age = Value(age),
        sex = Value(sex),
        sexingMethod = Value(sexingMethod),
        otherMarks = Value(otherMarks),
        catchingMethod = Value(catchingMethod),
        catchingLures = Value(catchingLures),
        circumstances = Value(circumstances),
        circumstancesPresumed = Value(circumstancesPresumed),
        status = Value(status),
        time = Value(time),
        wingLength = Value(wingLength),
        thirdPrimary = Value(thirdPrimary),
        wingPointState = Value(wingPointState),
        mass = Value(mass),
        moult = Value(moult),
        plumageCode = Value(plumageCode),
        hindClaw = Value(hindClaw),
        billLength = Value(billLength),
        billMethod = Value(billMethod),
        headLengthTotal = Value(headLengthTotal),
        tarsus = Value(tarsus),
        tarsusMethod = Value(tarsusMethod),
        tailLength = Value(tailLength),
        tailDifference = Value(tailDifference),
        fatScore = Value(fatScore),
        fatScoreMethod = Value(fatScoreMethod),
        pectoralMuscle = Value(pectoralMuscle),
        broodPatch = Value(broodPatch),
        primaryScore = Value(primaryScore),
        primaryMoult = Value(primaryMoult),
        oldGreaterCoverts = Value(oldGreaterCoverts),
        alula = Value(alula),
        carpalCovert = Value(carpalCovert);
  static Insertable<RetrapEntityData> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<String>? ringerId,
    Expression<String>? ringSeriesCode,
    Expression<String>? ringIdNumber,
    Expression<String>? ringScheme,
    Expression<String>? condition,
    Expression<String>? primaryIdMethod,
    Expression<String>? metalRingInfo,
    Expression<String>? species,
    Expression<String>? age,
    Expression<String>? sex,
    Expression<String>? sexingMethod,
    Expression<String>? otherMarks,
    Expression<String>? catchingMethod,
    Expression<String>? catchingLures,
    Expression<String>? circumstances,
    Expression<String>? circumstancesPresumed,
    Expression<String>? status,
    Expression<String>? time,
    Expression<String>? wingLength,
    Expression<String>? thirdPrimary,
    Expression<String>? wingPointState,
    Expression<String>? mass,
    Expression<String>? moult,
    Expression<String>? plumageCode,
    Expression<String>? hindClaw,
    Expression<String>? billLength,
    Expression<String>? billMethod,
    Expression<String>? headLengthTotal,
    Expression<String>? tarsus,
    Expression<String>? tarsusMethod,
    Expression<String>? tailLength,
    Expression<String>? tailDifference,
    Expression<String>? fatScore,
    Expression<String>? fatScoreMethod,
    Expression<String>? pectoralMuscle,
    Expression<String>? broodPatch,
    Expression<String>? primaryScore,
    Expression<String>? primaryMoult,
    Expression<String>? oldGreaterCoverts,
    Expression<String>? alula,
    Expression<String>? carpalCovert,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (ringerId != null) 'ringer_id': ringerId,
      if (ringSeriesCode != null) 'ring_series_code': ringSeriesCode,
      if (ringIdNumber != null) 'ring_id_number': ringIdNumber,
      if (ringScheme != null) 'ring_scheme': ringScheme,
      if (condition != null) 'condition': condition,
      if (primaryIdMethod != null) 'primary_id_method': primaryIdMethod,
      if (metalRingInfo != null) 'metal_ring_info': metalRingInfo,
      if (species != null) 'species': species,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
      if (sexingMethod != null) 'sexing_method': sexingMethod,
      if (otherMarks != null) 'other_marks': otherMarks,
      if (catchingMethod != null) 'catching_method': catchingMethod,
      if (catchingLures != null) 'catching_lures': catchingLures,
      if (circumstances != null) 'circumstances': circumstances,
      if (circumstancesPresumed != null)
        'circumstances_presumed': circumstancesPresumed,
      if (status != null) 'status': status,
      if (time != null) 'time': time,
      if (wingLength != null) 'wing_length': wingLength,
      if (thirdPrimary != null) 'third_primary': thirdPrimary,
      if (wingPointState != null) 'wing_point_state': wingPointState,
      if (mass != null) 'mass': mass,
      if (moult != null) 'moult': moult,
      if (plumageCode != null) 'plumage_code': plumageCode,
      if (hindClaw != null) 'hind_claw': hindClaw,
      if (billLength != null) 'bill_length': billLength,
      if (billMethod != null) 'bill_method': billMethod,
      if (headLengthTotal != null) 'head_length_total': headLengthTotal,
      if (tarsus != null) 'tarsus': tarsus,
      if (tarsusMethod != null) 'tarsus_method': tarsusMethod,
      if (tailLength != null) 'tail_length': tailLength,
      if (tailDifference != null) 'tail_difference': tailDifference,
      if (fatScore != null) 'fat_score': fatScore,
      if (fatScoreMethod != null) 'fat_score_method': fatScoreMethod,
      if (pectoralMuscle != null) 'pectoral_muscle': pectoralMuscle,
      if (broodPatch != null) 'brood_patch': broodPatch,
      if (primaryScore != null) 'primary_score': primaryScore,
      if (primaryMoult != null) 'primary_moult': primaryMoult,
      if (oldGreaterCoverts != null) 'old_greater_coverts': oldGreaterCoverts,
      if (alula != null) 'alula': alula,
      if (carpalCovert != null) 'carpal_covert': carpalCovert,
    });
  }

  RetrapEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? sessionId,
      Value<String>? ringerId,
      Value<String>? ringSeriesCode,
      Value<String>? ringIdNumber,
      Value<String>? ringScheme,
      Value<String>? condition,
      Value<String>? primaryIdMethod,
      Value<String>? metalRingInfo,
      Value<String>? species,
      Value<String>? age,
      Value<String>? sex,
      Value<String>? sexingMethod,
      Value<String>? otherMarks,
      Value<String>? catchingMethod,
      Value<String>? catchingLures,
      Value<String>? circumstances,
      Value<String>? circumstancesPresumed,
      Value<String>? status,
      Value<String>? time,
      Value<String>? wingLength,
      Value<String>? thirdPrimary,
      Value<String>? wingPointState,
      Value<String>? mass,
      Value<String>? moult,
      Value<String>? plumageCode,
      Value<String>? hindClaw,
      Value<String>? billLength,
      Value<String>? billMethod,
      Value<String>? headLengthTotal,
      Value<String>? tarsus,
      Value<String>? tarsusMethod,
      Value<String>? tailLength,
      Value<String>? tailDifference,
      Value<String>? fatScore,
      Value<String>? fatScoreMethod,
      Value<String>? pectoralMuscle,
      Value<String>? broodPatch,
      Value<String>? primaryScore,
      Value<String>? primaryMoult,
      Value<String>? oldGreaterCoverts,
      Value<String>? alula,
      Value<String>? carpalCovert}) {
    return RetrapEntityCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      ringerId: ringerId ?? this.ringerId,
      ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
      ringIdNumber: ringIdNumber ?? this.ringIdNumber,
      ringScheme: ringScheme ?? this.ringScheme,
      condition: condition ?? this.condition,
      primaryIdMethod: primaryIdMethod ?? this.primaryIdMethod,
      metalRingInfo: metalRingInfo ?? this.metalRingInfo,
      species: species ?? this.species,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      sexingMethod: sexingMethod ?? this.sexingMethod,
      otherMarks: otherMarks ?? this.otherMarks,
      catchingMethod: catchingMethod ?? this.catchingMethod,
      catchingLures: catchingLures ?? this.catchingLures,
      circumstances: circumstances ?? this.circumstances,
      circumstancesPresumed:
          circumstancesPresumed ?? this.circumstancesPresumed,
      status: status ?? this.status,
      time: time ?? this.time,
      wingLength: wingLength ?? this.wingLength,
      thirdPrimary: thirdPrimary ?? this.thirdPrimary,
      wingPointState: wingPointState ?? this.wingPointState,
      mass: mass ?? this.mass,
      moult: moult ?? this.moult,
      plumageCode: plumageCode ?? this.plumageCode,
      hindClaw: hindClaw ?? this.hindClaw,
      billLength: billLength ?? this.billLength,
      billMethod: billMethod ?? this.billMethod,
      headLengthTotal: headLengthTotal ?? this.headLengthTotal,
      tarsus: tarsus ?? this.tarsus,
      tarsusMethod: tarsusMethod ?? this.tarsusMethod,
      tailLength: tailLength ?? this.tailLength,
      tailDifference: tailDifference ?? this.tailDifference,
      fatScore: fatScore ?? this.fatScore,
      fatScoreMethod: fatScoreMethod ?? this.fatScoreMethod,
      pectoralMuscle: pectoralMuscle ?? this.pectoralMuscle,
      broodPatch: broodPatch ?? this.broodPatch,
      primaryScore: primaryScore ?? this.primaryScore,
      primaryMoult: primaryMoult ?? this.primaryMoult,
      oldGreaterCoverts: oldGreaterCoverts ?? this.oldGreaterCoverts,
      alula: alula ?? this.alula,
      carpalCovert: carpalCovert ?? this.carpalCovert,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (ringSeriesCode.present) {
      map['ring_series_code'] = Variable<String>(ringSeriesCode.value);
    }
    if (ringIdNumber.present) {
      map['ring_id_number'] = Variable<String>(ringIdNumber.value);
    }
    if (ringScheme.present) {
      map['ring_scheme'] = Variable<String>(ringScheme.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (primaryIdMethod.present) {
      map['primary_id_method'] = Variable<String>(primaryIdMethod.value);
    }
    if (metalRingInfo.present) {
      map['metal_ring_info'] = Variable<String>(metalRingInfo.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (sexingMethod.present) {
      map['sexing_method'] = Variable<String>(sexingMethod.value);
    }
    if (otherMarks.present) {
      map['other_marks'] = Variable<String>(otherMarks.value);
    }
    if (catchingMethod.present) {
      map['catching_method'] = Variable<String>(catchingMethod.value);
    }
    if (catchingLures.present) {
      map['catching_lures'] = Variable<String>(catchingLures.value);
    }
    if (circumstances.present) {
      map['circumstances'] = Variable<String>(circumstances.value);
    }
    if (circumstancesPresumed.present) {
      map['circumstances_presumed'] =
          Variable<String>(circumstancesPresumed.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (wingLength.present) {
      map['wing_length'] = Variable<String>(wingLength.value);
    }
    if (thirdPrimary.present) {
      map['third_primary'] = Variable<String>(thirdPrimary.value);
    }
    if (wingPointState.present) {
      map['wing_point_state'] = Variable<String>(wingPointState.value);
    }
    if (mass.present) {
      map['mass'] = Variable<String>(mass.value);
    }
    if (moult.present) {
      map['moult'] = Variable<String>(moult.value);
    }
    if (plumageCode.present) {
      map['plumage_code'] = Variable<String>(plumageCode.value);
    }
    if (hindClaw.present) {
      map['hind_claw'] = Variable<String>(hindClaw.value);
    }
    if (billLength.present) {
      map['bill_length'] = Variable<String>(billLength.value);
    }
    if (billMethod.present) {
      map['bill_method'] = Variable<String>(billMethod.value);
    }
    if (headLengthTotal.present) {
      map['head_length_total'] = Variable<String>(headLengthTotal.value);
    }
    if (tarsus.present) {
      map['tarsus'] = Variable<String>(tarsus.value);
    }
    if (tarsusMethod.present) {
      map['tarsus_method'] = Variable<String>(tarsusMethod.value);
    }
    if (tailLength.present) {
      map['tail_length'] = Variable<String>(tailLength.value);
    }
    if (tailDifference.present) {
      map['tail_difference'] = Variable<String>(tailDifference.value);
    }
    if (fatScore.present) {
      map['fat_score'] = Variable<String>(fatScore.value);
    }
    if (fatScoreMethod.present) {
      map['fat_score_method'] = Variable<String>(fatScoreMethod.value);
    }
    if (pectoralMuscle.present) {
      map['pectoral_muscle'] = Variable<String>(pectoralMuscle.value);
    }
    if (broodPatch.present) {
      map['brood_patch'] = Variable<String>(broodPatch.value);
    }
    if (primaryScore.present) {
      map['primary_score'] = Variable<String>(primaryScore.value);
    }
    if (primaryMoult.present) {
      map['primary_moult'] = Variable<String>(primaryMoult.value);
    }
    if (oldGreaterCoverts.present) {
      map['old_greater_coverts'] = Variable<String>(oldGreaterCoverts.value);
    }
    if (alula.present) {
      map['alula'] = Variable<String>(alula.value);
    }
    if (carpalCovert.present) {
      map['carpal_covert'] = Variable<String>(carpalCovert.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetrapEntityCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('ringerId: $ringerId, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('ringIdNumber: $ringIdNumber, ')
          ..write('ringScheme: $ringScheme, ')
          ..write('condition: $condition, ')
          ..write('primaryIdMethod: $primaryIdMethod, ')
          ..write('metalRingInfo: $metalRingInfo, ')
          ..write('species: $species, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('sexingMethod: $sexingMethod, ')
          ..write('otherMarks: $otherMarks, ')
          ..write('catchingMethod: $catchingMethod, ')
          ..write('catchingLures: $catchingLures, ')
          ..write('circumstances: $circumstances, ')
          ..write('circumstancesPresumed: $circumstancesPresumed, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('wingLength: $wingLength, ')
          ..write('thirdPrimary: $thirdPrimary, ')
          ..write('wingPointState: $wingPointState, ')
          ..write('mass: $mass, ')
          ..write('moult: $moult, ')
          ..write('plumageCode: $plumageCode, ')
          ..write('hindClaw: $hindClaw, ')
          ..write('billLength: $billLength, ')
          ..write('billMethod: $billMethod, ')
          ..write('headLengthTotal: $headLengthTotal, ')
          ..write('tarsus: $tarsus, ')
          ..write('tarsusMethod: $tarsusMethod, ')
          ..write('tailLength: $tailLength, ')
          ..write('tailDifference: $tailDifference, ')
          ..write('fatScore: $fatScore, ')
          ..write('fatScoreMethod: $fatScoreMethod, ')
          ..write('pectoralMuscle: $pectoralMuscle, ')
          ..write('broodPatch: $broodPatch, ')
          ..write('primaryScore: $primaryScore, ')
          ..write('primaryMoult: $primaryMoult, ')
          ..write('oldGreaterCoverts: $oldGreaterCoverts, ')
          ..write('alula: $alula, ')
          ..write('carpalCovert: $carpalCovert')
          ..write(')'))
        .toString();
  }
}

class $RingEntityTable extends RingEntity
    with TableInfo<$RingEntityTable, RingEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RingEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
      'session_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES session_entity (id)'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryIdMethodMeta =
      const VerificationMeta('primaryIdMethod');
  @override
  late final GeneratedColumn<String> primaryIdMethod = GeneratedColumn<String>(
      'primary_id_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringSeriesCodeMeta =
      const VerificationMeta('ringSeriesCode');
  @override
  late final GeneratedColumn<String> ringSeriesCode = GeneratedColumn<String>(
      'ring_series_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringIdNumberMeta =
      const VerificationMeta('ringIdNumber');
  @override
  late final GeneratedColumn<String> ringIdNumber = GeneratedColumn<String>(
      'ring_id_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _metalRingInfoMeta =
      const VerificationMeta('metalRingInfo');
  @override
  late final GeneratedColumn<String> metalRingInfo = GeneratedColumn<String>(
      'metal_ring_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'age', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexingMethodMeta =
      const VerificationMeta('sexingMethod');
  @override
  late final GeneratedColumn<String> sexingMethod = GeneratedColumn<String>(
      'sexing_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _otherMarksMeta =
      const VerificationMeta('otherMarks');
  @override
  late final GeneratedColumn<String> otherMarks = GeneratedColumn<String>(
      'other_marks', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _catchingMethodMeta =
      const VerificationMeta('catchingMethod');
  @override
  late final GeneratedColumn<String> catchingMethod = GeneratedColumn<String>(
      'catching_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _catchingLuresMeta =
      const VerificationMeta('catchingLures');
  @override
  late final GeneratedColumn<String> catchingLures = GeneratedColumn<String>(
      'catching_lures', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _circumstancesMeta =
      const VerificationMeta('circumstances');
  @override
  late final GeneratedColumn<String> circumstances = GeneratedColumn<String>(
      'circumstances', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _circumstancesPresumedMeta =
      const VerificationMeta('circumstancesPresumed');
  @override
  late final GeneratedColumn<String> circumstancesPresumed =
      GeneratedColumn<String>('circumstances_presumed', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wingLengthMeta =
      const VerificationMeta('wingLength');
  @override
  late final GeneratedColumn<String> wingLength = GeneratedColumn<String>(
      'wing_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thirdPrimaryMeta =
      const VerificationMeta('thirdPrimary');
  @override
  late final GeneratedColumn<String> thirdPrimary = GeneratedColumn<String>(
      'third_primary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wingPointStateMeta =
      const VerificationMeta('wingPointState');
  @override
  late final GeneratedColumn<String> wingPointState = GeneratedColumn<String>(
      'wing_point_state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _massMeta = const VerificationMeta('mass');
  @override
  late final GeneratedColumn<String> mass = GeneratedColumn<String>(
      'mass', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moultMeta = const VerificationMeta('moult');
  @override
  late final GeneratedColumn<String> moult = GeneratedColumn<String>(
      'moult', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _plumageCodeMeta =
      const VerificationMeta('plumageCode');
  @override
  late final GeneratedColumn<String> plumageCode = GeneratedColumn<String>(
      'plumage_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hindClawMeta =
      const VerificationMeta('hindClaw');
  @override
  late final GeneratedColumn<String> hindClaw = GeneratedColumn<String>(
      'hind_claw', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billLengthMeta =
      const VerificationMeta('billLength');
  @override
  late final GeneratedColumn<String> billLength = GeneratedColumn<String>(
      'bill_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _billMethodMeta =
      const VerificationMeta('billMethod');
  @override
  late final GeneratedColumn<String> billMethod = GeneratedColumn<String>(
      'bill_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _headLengthTotalMeta =
      const VerificationMeta('headLengthTotal');
  @override
  late final GeneratedColumn<String> headLengthTotal = GeneratedColumn<String>(
      'head_length_total', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tarsusMeta = const VerificationMeta('tarsus');
  @override
  late final GeneratedColumn<String> tarsus = GeneratedColumn<String>(
      'tarsus', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tarsusMethodMeta =
      const VerificationMeta('tarsusMethod');
  @override
  late final GeneratedColumn<String> tarsusMethod = GeneratedColumn<String>(
      'tarsus_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tailLengthMeta =
      const VerificationMeta('tailLength');
  @override
  late final GeneratedColumn<String> tailLength = GeneratedColumn<String>(
      'tail_length', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tailDifferenceMeta =
      const VerificationMeta('tailDifference');
  @override
  late final GeneratedColumn<String> tailDifference = GeneratedColumn<String>(
      'tail_difference', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fatScoreMeta =
      const VerificationMeta('fatScore');
  @override
  late final GeneratedColumn<String> fatScore = GeneratedColumn<String>(
      'fat_score', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fatScoreMethodMeta =
      const VerificationMeta('fatScoreMethod');
  @override
  late final GeneratedColumn<String> fatScoreMethod = GeneratedColumn<String>(
      'fat_score_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pectoralMuscleMeta =
      const VerificationMeta('pectoralMuscle');
  @override
  late final GeneratedColumn<String> pectoralMuscle = GeneratedColumn<String>(
      'pectoral_muscle', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _broodPatchMeta =
      const VerificationMeta('broodPatch');
  @override
  late final GeneratedColumn<String> broodPatch = GeneratedColumn<String>(
      'brood_patch', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryScoreMeta =
      const VerificationMeta('primaryScore');
  @override
  late final GeneratedColumn<String> primaryScore = GeneratedColumn<String>(
      'primary_score', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryMoultMeta =
      const VerificationMeta('primaryMoult');
  @override
  late final GeneratedColumn<String> primaryMoult = GeneratedColumn<String>(
      'primary_moult', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _oldGreaterCovertsMeta =
      const VerificationMeta('oldGreaterCoverts');
  @override
  late final GeneratedColumn<String> oldGreaterCoverts =
      GeneratedColumn<String>('old_greater_coverts', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alulaMeta = const VerificationMeta('alula');
  @override
  late final GeneratedColumn<String> alula = GeneratedColumn<String>(
      'alula', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _carpalCovertMeta =
      const VerificationMeta('carpalCovert');
  @override
  late final GeneratedColumn<String> carpalCovert = GeneratedColumn<String>(
      'carpal_covert', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        ringerId,
        primaryIdMethod,
        ringSeriesCode,
        ringIdNumber,
        metalRingInfo,
        species,
        age,
        sex,
        sexingMethod,
        otherMarks,
        catchingMethod,
        catchingLures,
        condition,
        circumstances,
        circumstancesPresumed,
        status,
        time,
        wingLength,
        thirdPrimary,
        wingPointState,
        mass,
        moult,
        plumageCode,
        hindClaw,
        billLength,
        billMethod,
        headLengthTotal,
        tarsus,
        tarsusMethod,
        tailLength,
        tailDifference,
        fatScore,
        fatScoreMethod,
        pectoralMuscle,
        broodPatch,
        primaryScore,
        primaryMoult,
        oldGreaterCoverts,
        alula,
        carpalCovert
      ];
  @override
  String get aliasedName => _alias ?? 'ring_entity';
  @override
  String get actualTableName => 'ring_entity';
  @override
  VerificationContext validateIntegrity(Insertable<RingEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('primary_id_method')) {
      context.handle(
          _primaryIdMethodMeta,
          primaryIdMethod.isAcceptableOrUnknown(
              data['primary_id_method']!, _primaryIdMethodMeta));
    } else if (isInserting) {
      context.missing(_primaryIdMethodMeta);
    }
    if (data.containsKey('ring_series_code')) {
      context.handle(
          _ringSeriesCodeMeta,
          ringSeriesCode.isAcceptableOrUnknown(
              data['ring_series_code']!, _ringSeriesCodeMeta));
    } else if (isInserting) {
      context.missing(_ringSeriesCodeMeta);
    }
    if (data.containsKey('ring_id_number')) {
      context.handle(
          _ringIdNumberMeta,
          ringIdNumber.isAcceptableOrUnknown(
              data['ring_id_number']!, _ringIdNumberMeta));
    } else if (isInserting) {
      context.missing(_ringIdNumberMeta);
    }
    if (data.containsKey('metal_ring_info')) {
      context.handle(
          _metalRingInfoMeta,
          metalRingInfo.isAcceptableOrUnknown(
              data['metal_ring_info']!, _metalRingInfoMeta));
    } else if (isInserting) {
      context.missing(_metalRingInfoMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('sexing_method')) {
      context.handle(
          _sexingMethodMeta,
          sexingMethod.isAcceptableOrUnknown(
              data['sexing_method']!, _sexingMethodMeta));
    } else if (isInserting) {
      context.missing(_sexingMethodMeta);
    }
    if (data.containsKey('other_marks')) {
      context.handle(
          _otherMarksMeta,
          otherMarks.isAcceptableOrUnknown(
              data['other_marks']!, _otherMarksMeta));
    } else if (isInserting) {
      context.missing(_otherMarksMeta);
    }
    if (data.containsKey('catching_method')) {
      context.handle(
          _catchingMethodMeta,
          catchingMethod.isAcceptableOrUnknown(
              data['catching_method']!, _catchingMethodMeta));
    } else if (isInserting) {
      context.missing(_catchingMethodMeta);
    }
    if (data.containsKey('catching_lures')) {
      context.handle(
          _catchingLuresMeta,
          catchingLures.isAcceptableOrUnknown(
              data['catching_lures']!, _catchingLuresMeta));
    } else if (isInserting) {
      context.missing(_catchingLuresMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('circumstances')) {
      context.handle(
          _circumstancesMeta,
          circumstances.isAcceptableOrUnknown(
              data['circumstances']!, _circumstancesMeta));
    } else if (isInserting) {
      context.missing(_circumstancesMeta);
    }
    if (data.containsKey('circumstances_presumed')) {
      context.handle(
          _circumstancesPresumedMeta,
          circumstancesPresumed.isAcceptableOrUnknown(
              data['circumstances_presumed']!, _circumstancesPresumedMeta));
    } else if (isInserting) {
      context.missing(_circumstancesPresumedMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('wing_length')) {
      context.handle(
          _wingLengthMeta,
          wingLength.isAcceptableOrUnknown(
              data['wing_length']!, _wingLengthMeta));
    } else if (isInserting) {
      context.missing(_wingLengthMeta);
    }
    if (data.containsKey('third_primary')) {
      context.handle(
          _thirdPrimaryMeta,
          thirdPrimary.isAcceptableOrUnknown(
              data['third_primary']!, _thirdPrimaryMeta));
    } else if (isInserting) {
      context.missing(_thirdPrimaryMeta);
    }
    if (data.containsKey('wing_point_state')) {
      context.handle(
          _wingPointStateMeta,
          wingPointState.isAcceptableOrUnknown(
              data['wing_point_state']!, _wingPointStateMeta));
    } else if (isInserting) {
      context.missing(_wingPointStateMeta);
    }
    if (data.containsKey('mass')) {
      context.handle(
          _massMeta, mass.isAcceptableOrUnknown(data['mass']!, _massMeta));
    } else if (isInserting) {
      context.missing(_massMeta);
    }
    if (data.containsKey('moult')) {
      context.handle(
          _moultMeta, moult.isAcceptableOrUnknown(data['moult']!, _moultMeta));
    } else if (isInserting) {
      context.missing(_moultMeta);
    }
    if (data.containsKey('plumage_code')) {
      context.handle(
          _plumageCodeMeta,
          plumageCode.isAcceptableOrUnknown(
              data['plumage_code']!, _plumageCodeMeta));
    } else if (isInserting) {
      context.missing(_plumageCodeMeta);
    }
    if (data.containsKey('hind_claw')) {
      context.handle(_hindClawMeta,
          hindClaw.isAcceptableOrUnknown(data['hind_claw']!, _hindClawMeta));
    } else if (isInserting) {
      context.missing(_hindClawMeta);
    }
    if (data.containsKey('bill_length')) {
      context.handle(
          _billLengthMeta,
          billLength.isAcceptableOrUnknown(
              data['bill_length']!, _billLengthMeta));
    } else if (isInserting) {
      context.missing(_billLengthMeta);
    }
    if (data.containsKey('bill_method')) {
      context.handle(
          _billMethodMeta,
          billMethod.isAcceptableOrUnknown(
              data['bill_method']!, _billMethodMeta));
    } else if (isInserting) {
      context.missing(_billMethodMeta);
    }
    if (data.containsKey('head_length_total')) {
      context.handle(
          _headLengthTotalMeta,
          headLengthTotal.isAcceptableOrUnknown(
              data['head_length_total']!, _headLengthTotalMeta));
    } else if (isInserting) {
      context.missing(_headLengthTotalMeta);
    }
    if (data.containsKey('tarsus')) {
      context.handle(_tarsusMeta,
          tarsus.isAcceptableOrUnknown(data['tarsus']!, _tarsusMeta));
    } else if (isInserting) {
      context.missing(_tarsusMeta);
    }
    if (data.containsKey('tarsus_method')) {
      context.handle(
          _tarsusMethodMeta,
          tarsusMethod.isAcceptableOrUnknown(
              data['tarsus_method']!, _tarsusMethodMeta));
    } else if (isInserting) {
      context.missing(_tarsusMethodMeta);
    }
    if (data.containsKey('tail_length')) {
      context.handle(
          _tailLengthMeta,
          tailLength.isAcceptableOrUnknown(
              data['tail_length']!, _tailLengthMeta));
    } else if (isInserting) {
      context.missing(_tailLengthMeta);
    }
    if (data.containsKey('tail_difference')) {
      context.handle(
          _tailDifferenceMeta,
          tailDifference.isAcceptableOrUnknown(
              data['tail_difference']!, _tailDifferenceMeta));
    } else if (isInserting) {
      context.missing(_tailDifferenceMeta);
    }
    if (data.containsKey('fat_score')) {
      context.handle(_fatScoreMeta,
          fatScore.isAcceptableOrUnknown(data['fat_score']!, _fatScoreMeta));
    } else if (isInserting) {
      context.missing(_fatScoreMeta);
    }
    if (data.containsKey('fat_score_method')) {
      context.handle(
          _fatScoreMethodMeta,
          fatScoreMethod.isAcceptableOrUnknown(
              data['fat_score_method']!, _fatScoreMethodMeta));
    } else if (isInserting) {
      context.missing(_fatScoreMethodMeta);
    }
    if (data.containsKey('pectoral_muscle')) {
      context.handle(
          _pectoralMuscleMeta,
          pectoralMuscle.isAcceptableOrUnknown(
              data['pectoral_muscle']!, _pectoralMuscleMeta));
    } else if (isInserting) {
      context.missing(_pectoralMuscleMeta);
    }
    if (data.containsKey('brood_patch')) {
      context.handle(
          _broodPatchMeta,
          broodPatch.isAcceptableOrUnknown(
              data['brood_patch']!, _broodPatchMeta));
    } else if (isInserting) {
      context.missing(_broodPatchMeta);
    }
    if (data.containsKey('primary_score')) {
      context.handle(
          _primaryScoreMeta,
          primaryScore.isAcceptableOrUnknown(
              data['primary_score']!, _primaryScoreMeta));
    } else if (isInserting) {
      context.missing(_primaryScoreMeta);
    }
    if (data.containsKey('primary_moult')) {
      context.handle(
          _primaryMoultMeta,
          primaryMoult.isAcceptableOrUnknown(
              data['primary_moult']!, _primaryMoultMeta));
    } else if (isInserting) {
      context.missing(_primaryMoultMeta);
    }
    if (data.containsKey('old_greater_coverts')) {
      context.handle(
          _oldGreaterCovertsMeta,
          oldGreaterCoverts.isAcceptableOrUnknown(
              data['old_greater_coverts']!, _oldGreaterCovertsMeta));
    } else if (isInserting) {
      context.missing(_oldGreaterCovertsMeta);
    }
    if (data.containsKey('alula')) {
      context.handle(
          _alulaMeta, alula.isAcceptableOrUnknown(data['alula']!, _alulaMeta));
    } else if (isInserting) {
      context.missing(_alulaMeta);
    }
    if (data.containsKey('carpal_covert')) {
      context.handle(
          _carpalCovertMeta,
          carpalCovert.isAcceptableOrUnknown(
              data['carpal_covert']!, _carpalCovertMeta));
    } else if (isInserting) {
      context.missing(_carpalCovertMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RingEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RingEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}session_id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      primaryIdMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}primary_id_method'])!,
      ringSeriesCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ring_series_code'])!,
      ringIdNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ring_id_number'])!,
      metalRingInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}metal_ring_info'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      sexingMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sexing_method'])!,
      otherMarks: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other_marks'])!,
      catchingMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}catching_method'])!,
      catchingLures: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}catching_lures'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      circumstances: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}circumstances'])!,
      circumstancesPresumed: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}circumstances_presumed'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      wingLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wing_length'])!,
      thirdPrimary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}third_primary'])!,
      wingPointState: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}wing_point_state'])!,
      mass: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mass'])!,
      moult: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}moult'])!,
      plumageCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plumage_code'])!,
      hindClaw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hind_claw'])!,
      billLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_length'])!,
      billMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bill_method'])!,
      headLengthTotal: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}head_length_total'])!,
      tarsus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tarsus'])!,
      tarsusMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tarsus_method'])!,
      tailLength: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tail_length'])!,
      tailDifference: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tail_difference'])!,
      fatScore: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fat_score'])!,
      fatScoreMethod: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fat_score_method'])!,
      pectoralMuscle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}pectoral_muscle'])!,
      broodPatch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brood_patch'])!,
      primaryScore: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_score'])!,
      primaryMoult: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_moult'])!,
      oldGreaterCoverts: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}old_greater_coverts'])!,
      alula: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alula'])!,
      carpalCovert: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}carpal_covert'])!,
    );
  }

  @override
  $RingEntityTable createAlias(String alias) {
    return $RingEntityTable(attachedDatabase, alias);
  }
}

class RingEntityData extends DataClass implements Insertable<RingEntityData> {
  final int id;
  final int sessionId;
  final String ringerId;
  final String primaryIdMethod;
  final String ringSeriesCode;
  final String ringIdNumber;
  final String metalRingInfo;
  final String species;
  final String age;
  final String sex;
  final String sexingMethod;
  final String otherMarks;
  final String catchingMethod;
  final String catchingLures;
  final String condition;
  final String circumstances;
  final String circumstancesPresumed;
  final String status;
  final String time;
  final String wingLength;
  final String thirdPrimary;
  final String wingPointState;
  final String mass;
  final String moult;
  final String plumageCode;
  final String hindClaw;
  final String billLength;
  final String billMethod;
  final String headLengthTotal;
  final String tarsus;
  final String tarsusMethod;
  final String tailLength;
  final String tailDifference;
  final String fatScore;
  final String fatScoreMethod;
  final String pectoralMuscle;
  final String broodPatch;
  final String primaryScore;
  final String primaryMoult;
  final String oldGreaterCoverts;
  final String alula;
  final String carpalCovert;
  const RingEntityData(
      {required this.id,
      required this.sessionId,
      required this.ringerId,
      required this.primaryIdMethod,
      required this.ringSeriesCode,
      required this.ringIdNumber,
      required this.metalRingInfo,
      required this.species,
      required this.age,
      required this.sex,
      required this.sexingMethod,
      required this.otherMarks,
      required this.catchingMethod,
      required this.catchingLures,
      required this.condition,
      required this.circumstances,
      required this.circumstancesPresumed,
      required this.status,
      required this.time,
      required this.wingLength,
      required this.thirdPrimary,
      required this.wingPointState,
      required this.mass,
      required this.moult,
      required this.plumageCode,
      required this.hindClaw,
      required this.billLength,
      required this.billMethod,
      required this.headLengthTotal,
      required this.tarsus,
      required this.tarsusMethod,
      required this.tailLength,
      required this.tailDifference,
      required this.fatScore,
      required this.fatScoreMethod,
      required this.pectoralMuscle,
      required this.broodPatch,
      required this.primaryScore,
      required this.primaryMoult,
      required this.oldGreaterCoverts,
      required this.alula,
      required this.carpalCovert});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['ringer_id'] = Variable<String>(ringerId);
    map['primary_id_method'] = Variable<String>(primaryIdMethod);
    map['ring_series_code'] = Variable<String>(ringSeriesCode);
    map['ring_id_number'] = Variable<String>(ringIdNumber);
    map['metal_ring_info'] = Variable<String>(metalRingInfo);
    map['species'] = Variable<String>(species);
    map['age'] = Variable<String>(age);
    map['sex'] = Variable<String>(sex);
    map['sexing_method'] = Variable<String>(sexingMethod);
    map['other_marks'] = Variable<String>(otherMarks);
    map['catching_method'] = Variable<String>(catchingMethod);
    map['catching_lures'] = Variable<String>(catchingLures);
    map['condition'] = Variable<String>(condition);
    map['circumstances'] = Variable<String>(circumstances);
    map['circumstances_presumed'] = Variable<String>(circumstancesPresumed);
    map['status'] = Variable<String>(status);
    map['time'] = Variable<String>(time);
    map['wing_length'] = Variable<String>(wingLength);
    map['third_primary'] = Variable<String>(thirdPrimary);
    map['wing_point_state'] = Variable<String>(wingPointState);
    map['mass'] = Variable<String>(mass);
    map['moult'] = Variable<String>(moult);
    map['plumage_code'] = Variable<String>(plumageCode);
    map['hind_claw'] = Variable<String>(hindClaw);
    map['bill_length'] = Variable<String>(billLength);
    map['bill_method'] = Variable<String>(billMethod);
    map['head_length_total'] = Variable<String>(headLengthTotal);
    map['tarsus'] = Variable<String>(tarsus);
    map['tarsus_method'] = Variable<String>(tarsusMethod);
    map['tail_length'] = Variable<String>(tailLength);
    map['tail_difference'] = Variable<String>(tailDifference);
    map['fat_score'] = Variable<String>(fatScore);
    map['fat_score_method'] = Variable<String>(fatScoreMethod);
    map['pectoral_muscle'] = Variable<String>(pectoralMuscle);
    map['brood_patch'] = Variable<String>(broodPatch);
    map['primary_score'] = Variable<String>(primaryScore);
    map['primary_moult'] = Variable<String>(primaryMoult);
    map['old_greater_coverts'] = Variable<String>(oldGreaterCoverts);
    map['alula'] = Variable<String>(alula);
    map['carpal_covert'] = Variable<String>(carpalCovert);
    return map;
  }

  RingEntityCompanion toCompanion(bool nullToAbsent) {
    return RingEntityCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      ringerId: Value(ringerId),
      primaryIdMethod: Value(primaryIdMethod),
      ringSeriesCode: Value(ringSeriesCode),
      ringIdNumber: Value(ringIdNumber),
      metalRingInfo: Value(metalRingInfo),
      species: Value(species),
      age: Value(age),
      sex: Value(sex),
      sexingMethod: Value(sexingMethod),
      otherMarks: Value(otherMarks),
      catchingMethod: Value(catchingMethod),
      catchingLures: Value(catchingLures),
      condition: Value(condition),
      circumstances: Value(circumstances),
      circumstancesPresumed: Value(circumstancesPresumed),
      status: Value(status),
      time: Value(time),
      wingLength: Value(wingLength),
      thirdPrimary: Value(thirdPrimary),
      wingPointState: Value(wingPointState),
      mass: Value(mass),
      moult: Value(moult),
      plumageCode: Value(plumageCode),
      hindClaw: Value(hindClaw),
      billLength: Value(billLength),
      billMethod: Value(billMethod),
      headLengthTotal: Value(headLengthTotal),
      tarsus: Value(tarsus),
      tarsusMethod: Value(tarsusMethod),
      tailLength: Value(tailLength),
      tailDifference: Value(tailDifference),
      fatScore: Value(fatScore),
      fatScoreMethod: Value(fatScoreMethod),
      pectoralMuscle: Value(pectoralMuscle),
      broodPatch: Value(broodPatch),
      primaryScore: Value(primaryScore),
      primaryMoult: Value(primaryMoult),
      oldGreaterCoverts: Value(oldGreaterCoverts),
      alula: Value(alula),
      carpalCovert: Value(carpalCovert),
    );
  }

  factory RingEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RingEntityData(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      primaryIdMethod: serializer.fromJson<String>(json['primaryIdMethod']),
      ringSeriesCode: serializer.fromJson<String>(json['ringSeriesCode']),
      ringIdNumber: serializer.fromJson<String>(json['ringIdNumber']),
      metalRingInfo: serializer.fromJson<String>(json['metalRingInfo']),
      species: serializer.fromJson<String>(json['species']),
      age: serializer.fromJson<String>(json['age']),
      sex: serializer.fromJson<String>(json['sex']),
      sexingMethod: serializer.fromJson<String>(json['sexingMethod']),
      otherMarks: serializer.fromJson<String>(json['otherMarks']),
      catchingMethod: serializer.fromJson<String>(json['catchingMethod']),
      catchingLures: serializer.fromJson<String>(json['catchingLures']),
      condition: serializer.fromJson<String>(json['condition']),
      circumstances: serializer.fromJson<String>(json['circumstances']),
      circumstancesPresumed:
          serializer.fromJson<String>(json['circumstancesPresumed']),
      status: serializer.fromJson<String>(json['status']),
      time: serializer.fromJson<String>(json['time']),
      wingLength: serializer.fromJson<String>(json['wingLength']),
      thirdPrimary: serializer.fromJson<String>(json['thirdPrimary']),
      wingPointState: serializer.fromJson<String>(json['wingPointState']),
      mass: serializer.fromJson<String>(json['mass']),
      moult: serializer.fromJson<String>(json['moult']),
      plumageCode: serializer.fromJson<String>(json['plumageCode']),
      hindClaw: serializer.fromJson<String>(json['hindClaw']),
      billLength: serializer.fromJson<String>(json['billLength']),
      billMethod: serializer.fromJson<String>(json['billMethod']),
      headLengthTotal: serializer.fromJson<String>(json['headLengthTotal']),
      tarsus: serializer.fromJson<String>(json['tarsus']),
      tarsusMethod: serializer.fromJson<String>(json['tarsusMethod']),
      tailLength: serializer.fromJson<String>(json['tailLength']),
      tailDifference: serializer.fromJson<String>(json['tailDifference']),
      fatScore: serializer.fromJson<String>(json['fatScore']),
      fatScoreMethod: serializer.fromJson<String>(json['fatScoreMethod']),
      pectoralMuscle: serializer.fromJson<String>(json['pectoralMuscle']),
      broodPatch: serializer.fromJson<String>(json['broodPatch']),
      primaryScore: serializer.fromJson<String>(json['primaryScore']),
      primaryMoult: serializer.fromJson<String>(json['primaryMoult']),
      oldGreaterCoverts: serializer.fromJson<String>(json['oldGreaterCoverts']),
      alula: serializer.fromJson<String>(json['alula']),
      carpalCovert: serializer.fromJson<String>(json['carpalCovert']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'ringerId': serializer.toJson<String>(ringerId),
      'primaryIdMethod': serializer.toJson<String>(primaryIdMethod),
      'ringSeriesCode': serializer.toJson<String>(ringSeriesCode),
      'ringIdNumber': serializer.toJson<String>(ringIdNumber),
      'metalRingInfo': serializer.toJson<String>(metalRingInfo),
      'species': serializer.toJson<String>(species),
      'age': serializer.toJson<String>(age),
      'sex': serializer.toJson<String>(sex),
      'sexingMethod': serializer.toJson<String>(sexingMethod),
      'otherMarks': serializer.toJson<String>(otherMarks),
      'catchingMethod': serializer.toJson<String>(catchingMethod),
      'catchingLures': serializer.toJson<String>(catchingLures),
      'condition': serializer.toJson<String>(condition),
      'circumstances': serializer.toJson<String>(circumstances),
      'circumstancesPresumed': serializer.toJson<String>(circumstancesPresumed),
      'status': serializer.toJson<String>(status),
      'time': serializer.toJson<String>(time),
      'wingLength': serializer.toJson<String>(wingLength),
      'thirdPrimary': serializer.toJson<String>(thirdPrimary),
      'wingPointState': serializer.toJson<String>(wingPointState),
      'mass': serializer.toJson<String>(mass),
      'moult': serializer.toJson<String>(moult),
      'plumageCode': serializer.toJson<String>(plumageCode),
      'hindClaw': serializer.toJson<String>(hindClaw),
      'billLength': serializer.toJson<String>(billLength),
      'billMethod': serializer.toJson<String>(billMethod),
      'headLengthTotal': serializer.toJson<String>(headLengthTotal),
      'tarsus': serializer.toJson<String>(tarsus),
      'tarsusMethod': serializer.toJson<String>(tarsusMethod),
      'tailLength': serializer.toJson<String>(tailLength),
      'tailDifference': serializer.toJson<String>(tailDifference),
      'fatScore': serializer.toJson<String>(fatScore),
      'fatScoreMethod': serializer.toJson<String>(fatScoreMethod),
      'pectoralMuscle': serializer.toJson<String>(pectoralMuscle),
      'broodPatch': serializer.toJson<String>(broodPatch),
      'primaryScore': serializer.toJson<String>(primaryScore),
      'primaryMoult': serializer.toJson<String>(primaryMoult),
      'oldGreaterCoverts': serializer.toJson<String>(oldGreaterCoverts),
      'alula': serializer.toJson<String>(alula),
      'carpalCovert': serializer.toJson<String>(carpalCovert),
    };
  }

  RingEntityData copyWith(
          {int? id,
          int? sessionId,
          String? ringerId,
          String? primaryIdMethod,
          String? ringSeriesCode,
          String? ringIdNumber,
          String? metalRingInfo,
          String? species,
          String? age,
          String? sex,
          String? sexingMethod,
          String? otherMarks,
          String? catchingMethod,
          String? catchingLures,
          String? condition,
          String? circumstances,
          String? circumstancesPresumed,
          String? status,
          String? time,
          String? wingLength,
          String? thirdPrimary,
          String? wingPointState,
          String? mass,
          String? moult,
          String? plumageCode,
          String? hindClaw,
          String? billLength,
          String? billMethod,
          String? headLengthTotal,
          String? tarsus,
          String? tarsusMethod,
          String? tailLength,
          String? tailDifference,
          String? fatScore,
          String? fatScoreMethod,
          String? pectoralMuscle,
          String? broodPatch,
          String? primaryScore,
          String? primaryMoult,
          String? oldGreaterCoverts,
          String? alula,
          String? carpalCovert}) =>
      RingEntityData(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        ringerId: ringerId ?? this.ringerId,
        primaryIdMethod: primaryIdMethod ?? this.primaryIdMethod,
        ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
        ringIdNumber: ringIdNumber ?? this.ringIdNumber,
        metalRingInfo: metalRingInfo ?? this.metalRingInfo,
        species: species ?? this.species,
        age: age ?? this.age,
        sex: sex ?? this.sex,
        sexingMethod: sexingMethod ?? this.sexingMethod,
        otherMarks: otherMarks ?? this.otherMarks,
        catchingMethod: catchingMethod ?? this.catchingMethod,
        catchingLures: catchingLures ?? this.catchingLures,
        condition: condition ?? this.condition,
        circumstances: circumstances ?? this.circumstances,
        circumstancesPresumed:
            circumstancesPresumed ?? this.circumstancesPresumed,
        status: status ?? this.status,
        time: time ?? this.time,
        wingLength: wingLength ?? this.wingLength,
        thirdPrimary: thirdPrimary ?? this.thirdPrimary,
        wingPointState: wingPointState ?? this.wingPointState,
        mass: mass ?? this.mass,
        moult: moult ?? this.moult,
        plumageCode: plumageCode ?? this.plumageCode,
        hindClaw: hindClaw ?? this.hindClaw,
        billLength: billLength ?? this.billLength,
        billMethod: billMethod ?? this.billMethod,
        headLengthTotal: headLengthTotal ?? this.headLengthTotal,
        tarsus: tarsus ?? this.tarsus,
        tarsusMethod: tarsusMethod ?? this.tarsusMethod,
        tailLength: tailLength ?? this.tailLength,
        tailDifference: tailDifference ?? this.tailDifference,
        fatScore: fatScore ?? this.fatScore,
        fatScoreMethod: fatScoreMethod ?? this.fatScoreMethod,
        pectoralMuscle: pectoralMuscle ?? this.pectoralMuscle,
        broodPatch: broodPatch ?? this.broodPatch,
        primaryScore: primaryScore ?? this.primaryScore,
        primaryMoult: primaryMoult ?? this.primaryMoult,
        oldGreaterCoverts: oldGreaterCoverts ?? this.oldGreaterCoverts,
        alula: alula ?? this.alula,
        carpalCovert: carpalCovert ?? this.carpalCovert,
      );
  @override
  String toString() {
    return (StringBuffer('RingEntityData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('ringerId: $ringerId, ')
          ..write('primaryIdMethod: $primaryIdMethod, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('ringIdNumber: $ringIdNumber, ')
          ..write('metalRingInfo: $metalRingInfo, ')
          ..write('species: $species, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('sexingMethod: $sexingMethod, ')
          ..write('otherMarks: $otherMarks, ')
          ..write('catchingMethod: $catchingMethod, ')
          ..write('catchingLures: $catchingLures, ')
          ..write('condition: $condition, ')
          ..write('circumstances: $circumstances, ')
          ..write('circumstancesPresumed: $circumstancesPresumed, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('wingLength: $wingLength, ')
          ..write('thirdPrimary: $thirdPrimary, ')
          ..write('wingPointState: $wingPointState, ')
          ..write('mass: $mass, ')
          ..write('moult: $moult, ')
          ..write('plumageCode: $plumageCode, ')
          ..write('hindClaw: $hindClaw, ')
          ..write('billLength: $billLength, ')
          ..write('billMethod: $billMethod, ')
          ..write('headLengthTotal: $headLengthTotal, ')
          ..write('tarsus: $tarsus, ')
          ..write('tarsusMethod: $tarsusMethod, ')
          ..write('tailLength: $tailLength, ')
          ..write('tailDifference: $tailDifference, ')
          ..write('fatScore: $fatScore, ')
          ..write('fatScoreMethod: $fatScoreMethod, ')
          ..write('pectoralMuscle: $pectoralMuscle, ')
          ..write('broodPatch: $broodPatch, ')
          ..write('primaryScore: $primaryScore, ')
          ..write('primaryMoult: $primaryMoult, ')
          ..write('oldGreaterCoverts: $oldGreaterCoverts, ')
          ..write('alula: $alula, ')
          ..write('carpalCovert: $carpalCovert')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        sessionId,
        ringerId,
        primaryIdMethod,
        ringSeriesCode,
        ringIdNumber,
        metalRingInfo,
        species,
        age,
        sex,
        sexingMethod,
        otherMarks,
        catchingMethod,
        catchingLures,
        condition,
        circumstances,
        circumstancesPresumed,
        status,
        time,
        wingLength,
        thirdPrimary,
        wingPointState,
        mass,
        moult,
        plumageCode,
        hindClaw,
        billLength,
        billMethod,
        headLengthTotal,
        tarsus,
        tarsusMethod,
        tailLength,
        tailDifference,
        fatScore,
        fatScoreMethod,
        pectoralMuscle,
        broodPatch,
        primaryScore,
        primaryMoult,
        oldGreaterCoverts,
        alula,
        carpalCovert
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RingEntityData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.ringerId == this.ringerId &&
          other.primaryIdMethod == this.primaryIdMethod &&
          other.ringSeriesCode == this.ringSeriesCode &&
          other.ringIdNumber == this.ringIdNumber &&
          other.metalRingInfo == this.metalRingInfo &&
          other.species == this.species &&
          other.age == this.age &&
          other.sex == this.sex &&
          other.sexingMethod == this.sexingMethod &&
          other.otherMarks == this.otherMarks &&
          other.catchingMethod == this.catchingMethod &&
          other.catchingLures == this.catchingLures &&
          other.condition == this.condition &&
          other.circumstances == this.circumstances &&
          other.circumstancesPresumed == this.circumstancesPresumed &&
          other.status == this.status &&
          other.time == this.time &&
          other.wingLength == this.wingLength &&
          other.thirdPrimary == this.thirdPrimary &&
          other.wingPointState == this.wingPointState &&
          other.mass == this.mass &&
          other.moult == this.moult &&
          other.plumageCode == this.plumageCode &&
          other.hindClaw == this.hindClaw &&
          other.billLength == this.billLength &&
          other.billMethod == this.billMethod &&
          other.headLengthTotal == this.headLengthTotal &&
          other.tarsus == this.tarsus &&
          other.tarsusMethod == this.tarsusMethod &&
          other.tailLength == this.tailLength &&
          other.tailDifference == this.tailDifference &&
          other.fatScore == this.fatScore &&
          other.fatScoreMethod == this.fatScoreMethod &&
          other.pectoralMuscle == this.pectoralMuscle &&
          other.broodPatch == this.broodPatch &&
          other.primaryScore == this.primaryScore &&
          other.primaryMoult == this.primaryMoult &&
          other.oldGreaterCoverts == this.oldGreaterCoverts &&
          other.alula == this.alula &&
          other.carpalCovert == this.carpalCovert);
}

class RingEntityCompanion extends UpdateCompanion<RingEntityData> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<String> ringerId;
  final Value<String> primaryIdMethod;
  final Value<String> ringSeriesCode;
  final Value<String> ringIdNumber;
  final Value<String> metalRingInfo;
  final Value<String> species;
  final Value<String> age;
  final Value<String> sex;
  final Value<String> sexingMethod;
  final Value<String> otherMarks;
  final Value<String> catchingMethod;
  final Value<String> catchingLures;
  final Value<String> condition;
  final Value<String> circumstances;
  final Value<String> circumstancesPresumed;
  final Value<String> status;
  final Value<String> time;
  final Value<String> wingLength;
  final Value<String> thirdPrimary;
  final Value<String> wingPointState;
  final Value<String> mass;
  final Value<String> moult;
  final Value<String> plumageCode;
  final Value<String> hindClaw;
  final Value<String> billLength;
  final Value<String> billMethod;
  final Value<String> headLengthTotal;
  final Value<String> tarsus;
  final Value<String> tarsusMethod;
  final Value<String> tailLength;
  final Value<String> tailDifference;
  final Value<String> fatScore;
  final Value<String> fatScoreMethod;
  final Value<String> pectoralMuscle;
  final Value<String> broodPatch;
  final Value<String> primaryScore;
  final Value<String> primaryMoult;
  final Value<String> oldGreaterCoverts;
  final Value<String> alula;
  final Value<String> carpalCovert;
  const RingEntityCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.primaryIdMethod = const Value.absent(),
    this.ringSeriesCode = const Value.absent(),
    this.ringIdNumber = const Value.absent(),
    this.metalRingInfo = const Value.absent(),
    this.species = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
    this.sexingMethod = const Value.absent(),
    this.otherMarks = const Value.absent(),
    this.catchingMethod = const Value.absent(),
    this.catchingLures = const Value.absent(),
    this.condition = const Value.absent(),
    this.circumstances = const Value.absent(),
    this.circumstancesPresumed = const Value.absent(),
    this.status = const Value.absent(),
    this.time = const Value.absent(),
    this.wingLength = const Value.absent(),
    this.thirdPrimary = const Value.absent(),
    this.wingPointState = const Value.absent(),
    this.mass = const Value.absent(),
    this.moult = const Value.absent(),
    this.plumageCode = const Value.absent(),
    this.hindClaw = const Value.absent(),
    this.billLength = const Value.absent(),
    this.billMethod = const Value.absent(),
    this.headLengthTotal = const Value.absent(),
    this.tarsus = const Value.absent(),
    this.tarsusMethod = const Value.absent(),
    this.tailLength = const Value.absent(),
    this.tailDifference = const Value.absent(),
    this.fatScore = const Value.absent(),
    this.fatScoreMethod = const Value.absent(),
    this.pectoralMuscle = const Value.absent(),
    this.broodPatch = const Value.absent(),
    this.primaryScore = const Value.absent(),
    this.primaryMoult = const Value.absent(),
    this.oldGreaterCoverts = const Value.absent(),
    this.alula = const Value.absent(),
    this.carpalCovert = const Value.absent(),
  });
  RingEntityCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required String ringerId,
    required String primaryIdMethod,
    required String ringSeriesCode,
    required String ringIdNumber,
    required String metalRingInfo,
    required String species,
    required String age,
    required String sex,
    required String sexingMethod,
    required String otherMarks,
    required String catchingMethod,
    required String catchingLures,
    required String condition,
    required String circumstances,
    required String circumstancesPresumed,
    required String status,
    required String time,
    required String wingLength,
    required String thirdPrimary,
    required String wingPointState,
    required String mass,
    required String moult,
    required String plumageCode,
    required String hindClaw,
    required String billLength,
    required String billMethod,
    required String headLengthTotal,
    required String tarsus,
    required String tarsusMethod,
    required String tailLength,
    required String tailDifference,
    required String fatScore,
    required String fatScoreMethod,
    required String pectoralMuscle,
    required String broodPatch,
    required String primaryScore,
    required String primaryMoult,
    required String oldGreaterCoverts,
    required String alula,
    required String carpalCovert,
  })  : sessionId = Value(sessionId),
        ringerId = Value(ringerId),
        primaryIdMethod = Value(primaryIdMethod),
        ringSeriesCode = Value(ringSeriesCode),
        ringIdNumber = Value(ringIdNumber),
        metalRingInfo = Value(metalRingInfo),
        species = Value(species),
        age = Value(age),
        sex = Value(sex),
        sexingMethod = Value(sexingMethod),
        otherMarks = Value(otherMarks),
        catchingMethod = Value(catchingMethod),
        catchingLures = Value(catchingLures),
        condition = Value(condition),
        circumstances = Value(circumstances),
        circumstancesPresumed = Value(circumstancesPresumed),
        status = Value(status),
        time = Value(time),
        wingLength = Value(wingLength),
        thirdPrimary = Value(thirdPrimary),
        wingPointState = Value(wingPointState),
        mass = Value(mass),
        moult = Value(moult),
        plumageCode = Value(plumageCode),
        hindClaw = Value(hindClaw),
        billLength = Value(billLength),
        billMethod = Value(billMethod),
        headLengthTotal = Value(headLengthTotal),
        tarsus = Value(tarsus),
        tarsusMethod = Value(tarsusMethod),
        tailLength = Value(tailLength),
        tailDifference = Value(tailDifference),
        fatScore = Value(fatScore),
        fatScoreMethod = Value(fatScoreMethod),
        pectoralMuscle = Value(pectoralMuscle),
        broodPatch = Value(broodPatch),
        primaryScore = Value(primaryScore),
        primaryMoult = Value(primaryMoult),
        oldGreaterCoverts = Value(oldGreaterCoverts),
        alula = Value(alula),
        carpalCovert = Value(carpalCovert);
  static Insertable<RingEntityData> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<String>? ringerId,
    Expression<String>? primaryIdMethod,
    Expression<String>? ringSeriesCode,
    Expression<String>? ringIdNumber,
    Expression<String>? metalRingInfo,
    Expression<String>? species,
    Expression<String>? age,
    Expression<String>? sex,
    Expression<String>? sexingMethod,
    Expression<String>? otherMarks,
    Expression<String>? catchingMethod,
    Expression<String>? catchingLures,
    Expression<String>? condition,
    Expression<String>? circumstances,
    Expression<String>? circumstancesPresumed,
    Expression<String>? status,
    Expression<String>? time,
    Expression<String>? wingLength,
    Expression<String>? thirdPrimary,
    Expression<String>? wingPointState,
    Expression<String>? mass,
    Expression<String>? moult,
    Expression<String>? plumageCode,
    Expression<String>? hindClaw,
    Expression<String>? billLength,
    Expression<String>? billMethod,
    Expression<String>? headLengthTotal,
    Expression<String>? tarsus,
    Expression<String>? tarsusMethod,
    Expression<String>? tailLength,
    Expression<String>? tailDifference,
    Expression<String>? fatScore,
    Expression<String>? fatScoreMethod,
    Expression<String>? pectoralMuscle,
    Expression<String>? broodPatch,
    Expression<String>? primaryScore,
    Expression<String>? primaryMoult,
    Expression<String>? oldGreaterCoverts,
    Expression<String>? alula,
    Expression<String>? carpalCovert,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (ringerId != null) 'ringer_id': ringerId,
      if (primaryIdMethod != null) 'primary_id_method': primaryIdMethod,
      if (ringSeriesCode != null) 'ring_series_code': ringSeriesCode,
      if (ringIdNumber != null) 'ring_id_number': ringIdNumber,
      if (metalRingInfo != null) 'metal_ring_info': metalRingInfo,
      if (species != null) 'species': species,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
      if (sexingMethod != null) 'sexing_method': sexingMethod,
      if (otherMarks != null) 'other_marks': otherMarks,
      if (catchingMethod != null) 'catching_method': catchingMethod,
      if (catchingLures != null) 'catching_lures': catchingLures,
      if (condition != null) 'condition': condition,
      if (circumstances != null) 'circumstances': circumstances,
      if (circumstancesPresumed != null)
        'circumstances_presumed': circumstancesPresumed,
      if (status != null) 'status': status,
      if (time != null) 'time': time,
      if (wingLength != null) 'wing_length': wingLength,
      if (thirdPrimary != null) 'third_primary': thirdPrimary,
      if (wingPointState != null) 'wing_point_state': wingPointState,
      if (mass != null) 'mass': mass,
      if (moult != null) 'moult': moult,
      if (plumageCode != null) 'plumage_code': plumageCode,
      if (hindClaw != null) 'hind_claw': hindClaw,
      if (billLength != null) 'bill_length': billLength,
      if (billMethod != null) 'bill_method': billMethod,
      if (headLengthTotal != null) 'head_length_total': headLengthTotal,
      if (tarsus != null) 'tarsus': tarsus,
      if (tarsusMethod != null) 'tarsus_method': tarsusMethod,
      if (tailLength != null) 'tail_length': tailLength,
      if (tailDifference != null) 'tail_difference': tailDifference,
      if (fatScore != null) 'fat_score': fatScore,
      if (fatScoreMethod != null) 'fat_score_method': fatScoreMethod,
      if (pectoralMuscle != null) 'pectoral_muscle': pectoralMuscle,
      if (broodPatch != null) 'brood_patch': broodPatch,
      if (primaryScore != null) 'primary_score': primaryScore,
      if (primaryMoult != null) 'primary_moult': primaryMoult,
      if (oldGreaterCoverts != null) 'old_greater_coverts': oldGreaterCoverts,
      if (alula != null) 'alula': alula,
      if (carpalCovert != null) 'carpal_covert': carpalCovert,
    });
  }

  RingEntityCompanion copyWith(
      {Value<int>? id,
      Value<int>? sessionId,
      Value<String>? ringerId,
      Value<String>? primaryIdMethod,
      Value<String>? ringSeriesCode,
      Value<String>? ringIdNumber,
      Value<String>? metalRingInfo,
      Value<String>? species,
      Value<String>? age,
      Value<String>? sex,
      Value<String>? sexingMethod,
      Value<String>? otherMarks,
      Value<String>? catchingMethod,
      Value<String>? catchingLures,
      Value<String>? condition,
      Value<String>? circumstances,
      Value<String>? circumstancesPresumed,
      Value<String>? status,
      Value<String>? time,
      Value<String>? wingLength,
      Value<String>? thirdPrimary,
      Value<String>? wingPointState,
      Value<String>? mass,
      Value<String>? moult,
      Value<String>? plumageCode,
      Value<String>? hindClaw,
      Value<String>? billLength,
      Value<String>? billMethod,
      Value<String>? headLengthTotal,
      Value<String>? tarsus,
      Value<String>? tarsusMethod,
      Value<String>? tailLength,
      Value<String>? tailDifference,
      Value<String>? fatScore,
      Value<String>? fatScoreMethod,
      Value<String>? pectoralMuscle,
      Value<String>? broodPatch,
      Value<String>? primaryScore,
      Value<String>? primaryMoult,
      Value<String>? oldGreaterCoverts,
      Value<String>? alula,
      Value<String>? carpalCovert}) {
    return RingEntityCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      ringerId: ringerId ?? this.ringerId,
      primaryIdMethod: primaryIdMethod ?? this.primaryIdMethod,
      ringSeriesCode: ringSeriesCode ?? this.ringSeriesCode,
      ringIdNumber: ringIdNumber ?? this.ringIdNumber,
      metalRingInfo: metalRingInfo ?? this.metalRingInfo,
      species: species ?? this.species,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      sexingMethod: sexingMethod ?? this.sexingMethod,
      otherMarks: otherMarks ?? this.otherMarks,
      catchingMethod: catchingMethod ?? this.catchingMethod,
      catchingLures: catchingLures ?? this.catchingLures,
      condition: condition ?? this.condition,
      circumstances: circumstances ?? this.circumstances,
      circumstancesPresumed:
          circumstancesPresumed ?? this.circumstancesPresumed,
      status: status ?? this.status,
      time: time ?? this.time,
      wingLength: wingLength ?? this.wingLength,
      thirdPrimary: thirdPrimary ?? this.thirdPrimary,
      wingPointState: wingPointState ?? this.wingPointState,
      mass: mass ?? this.mass,
      moult: moult ?? this.moult,
      plumageCode: plumageCode ?? this.plumageCode,
      hindClaw: hindClaw ?? this.hindClaw,
      billLength: billLength ?? this.billLength,
      billMethod: billMethod ?? this.billMethod,
      headLengthTotal: headLengthTotal ?? this.headLengthTotal,
      tarsus: tarsus ?? this.tarsus,
      tarsusMethod: tarsusMethod ?? this.tarsusMethod,
      tailLength: tailLength ?? this.tailLength,
      tailDifference: tailDifference ?? this.tailDifference,
      fatScore: fatScore ?? this.fatScore,
      fatScoreMethod: fatScoreMethod ?? this.fatScoreMethod,
      pectoralMuscle: pectoralMuscle ?? this.pectoralMuscle,
      broodPatch: broodPatch ?? this.broodPatch,
      primaryScore: primaryScore ?? this.primaryScore,
      primaryMoult: primaryMoult ?? this.primaryMoult,
      oldGreaterCoverts: oldGreaterCoverts ?? this.oldGreaterCoverts,
      alula: alula ?? this.alula,
      carpalCovert: carpalCovert ?? this.carpalCovert,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (primaryIdMethod.present) {
      map['primary_id_method'] = Variable<String>(primaryIdMethod.value);
    }
    if (ringSeriesCode.present) {
      map['ring_series_code'] = Variable<String>(ringSeriesCode.value);
    }
    if (ringIdNumber.present) {
      map['ring_id_number'] = Variable<String>(ringIdNumber.value);
    }
    if (metalRingInfo.present) {
      map['metal_ring_info'] = Variable<String>(metalRingInfo.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (sexingMethod.present) {
      map['sexing_method'] = Variable<String>(sexingMethod.value);
    }
    if (otherMarks.present) {
      map['other_marks'] = Variable<String>(otherMarks.value);
    }
    if (catchingMethod.present) {
      map['catching_method'] = Variable<String>(catchingMethod.value);
    }
    if (catchingLures.present) {
      map['catching_lures'] = Variable<String>(catchingLures.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (circumstances.present) {
      map['circumstances'] = Variable<String>(circumstances.value);
    }
    if (circumstancesPresumed.present) {
      map['circumstances_presumed'] =
          Variable<String>(circumstancesPresumed.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (wingLength.present) {
      map['wing_length'] = Variable<String>(wingLength.value);
    }
    if (thirdPrimary.present) {
      map['third_primary'] = Variable<String>(thirdPrimary.value);
    }
    if (wingPointState.present) {
      map['wing_point_state'] = Variable<String>(wingPointState.value);
    }
    if (mass.present) {
      map['mass'] = Variable<String>(mass.value);
    }
    if (moult.present) {
      map['moult'] = Variable<String>(moult.value);
    }
    if (plumageCode.present) {
      map['plumage_code'] = Variable<String>(plumageCode.value);
    }
    if (hindClaw.present) {
      map['hind_claw'] = Variable<String>(hindClaw.value);
    }
    if (billLength.present) {
      map['bill_length'] = Variable<String>(billLength.value);
    }
    if (billMethod.present) {
      map['bill_method'] = Variable<String>(billMethod.value);
    }
    if (headLengthTotal.present) {
      map['head_length_total'] = Variable<String>(headLengthTotal.value);
    }
    if (tarsus.present) {
      map['tarsus'] = Variable<String>(tarsus.value);
    }
    if (tarsusMethod.present) {
      map['tarsus_method'] = Variable<String>(tarsusMethod.value);
    }
    if (tailLength.present) {
      map['tail_length'] = Variable<String>(tailLength.value);
    }
    if (tailDifference.present) {
      map['tail_difference'] = Variable<String>(tailDifference.value);
    }
    if (fatScore.present) {
      map['fat_score'] = Variable<String>(fatScore.value);
    }
    if (fatScoreMethod.present) {
      map['fat_score_method'] = Variable<String>(fatScoreMethod.value);
    }
    if (pectoralMuscle.present) {
      map['pectoral_muscle'] = Variable<String>(pectoralMuscle.value);
    }
    if (broodPatch.present) {
      map['brood_patch'] = Variable<String>(broodPatch.value);
    }
    if (primaryScore.present) {
      map['primary_score'] = Variable<String>(primaryScore.value);
    }
    if (primaryMoult.present) {
      map['primary_moult'] = Variable<String>(primaryMoult.value);
    }
    if (oldGreaterCoverts.present) {
      map['old_greater_coverts'] = Variable<String>(oldGreaterCoverts.value);
    }
    if (alula.present) {
      map['alula'] = Variable<String>(alula.value);
    }
    if (carpalCovert.present) {
      map['carpal_covert'] = Variable<String>(carpalCovert.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RingEntityCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('ringerId: $ringerId, ')
          ..write('primaryIdMethod: $primaryIdMethod, ')
          ..write('ringSeriesCode: $ringSeriesCode, ')
          ..write('ringIdNumber: $ringIdNumber, ')
          ..write('metalRingInfo: $metalRingInfo, ')
          ..write('species: $species, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('sexingMethod: $sexingMethod, ')
          ..write('otherMarks: $otherMarks, ')
          ..write('catchingMethod: $catchingMethod, ')
          ..write('catchingLures: $catchingLures, ')
          ..write('condition: $condition, ')
          ..write('circumstances: $circumstances, ')
          ..write('circumstancesPresumed: $circumstancesPresumed, ')
          ..write('status: $status, ')
          ..write('time: $time, ')
          ..write('wingLength: $wingLength, ')
          ..write('thirdPrimary: $thirdPrimary, ')
          ..write('wingPointState: $wingPointState, ')
          ..write('mass: $mass, ')
          ..write('moult: $moult, ')
          ..write('plumageCode: $plumageCode, ')
          ..write('hindClaw: $hindClaw, ')
          ..write('billLength: $billLength, ')
          ..write('billMethod: $billMethod, ')
          ..write('headLengthTotal: $headLengthTotal, ')
          ..write('tarsus: $tarsus, ')
          ..write('tarsusMethod: $tarsusMethod, ')
          ..write('tailLength: $tailLength, ')
          ..write('tailDifference: $tailDifference, ')
          ..write('fatScore: $fatScore, ')
          ..write('fatScoreMethod: $fatScoreMethod, ')
          ..write('pectoralMuscle: $pectoralMuscle, ')
          ..write('broodPatch: $broodPatch, ')
          ..write('primaryScore: $primaryScore, ')
          ..write('primaryMoult: $primaryMoult, ')
          ..write('oldGreaterCoverts: $oldGreaterCoverts, ')
          ..write('alula: $alula, ')
          ..write('carpalCovert: $carpalCovert')
          ..write(')'))
        .toString();
  }
}

class $RingseriesEntityTable extends RingseriesEntity
    with TableInfo<$RingseriesEntityTable, RingseriesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RingseriesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schemeCodeMeta =
      const VerificationMeta('schemeCode');
  @override
  late final GeneratedColumn<String> schemeCode = GeneratedColumn<String>(
      'scheme_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ringfromMeta =
      const VerificationMeta('ringfrom');
  @override
  late final GeneratedColumn<int> ringfrom = GeneratedColumn<int>(
      'ringfrom', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ringtoMeta = const VerificationMeta('ringto');
  @override
  late final GeneratedColumn<int> ringto = GeneratedColumn<int>(
      'ringto', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ringerId, code, schemeCode, ringfrom, ringto];
  @override
  String get aliasedName => _alias ?? 'ringseries_entity';
  @override
  String get actualTableName => 'ringseries_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<RingseriesEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('scheme_code')) {
      context.handle(
          _schemeCodeMeta,
          schemeCode.isAcceptableOrUnknown(
              data['scheme_code']!, _schemeCodeMeta));
    } else if (isInserting) {
      context.missing(_schemeCodeMeta);
    }
    if (data.containsKey('ringfrom')) {
      context.handle(_ringfromMeta,
          ringfrom.isAcceptableOrUnknown(data['ringfrom']!, _ringfromMeta));
    } else if (isInserting) {
      context.missing(_ringfromMeta);
    }
    if (data.containsKey('ringto')) {
      context.handle(_ringtoMeta,
          ringto.isAcceptableOrUnknown(data['ringto']!, _ringtoMeta));
    } else if (isInserting) {
      context.missing(_ringtoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RingseriesEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RingseriesEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      schemeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheme_code'])!,
      ringfrom: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ringfrom'])!,
      ringto: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ringto'])!,
    );
  }

  @override
  $RingseriesEntityTable createAlias(String alias) {
    return $RingseriesEntityTable(attachedDatabase, alias);
  }
}

class RingseriesEntityData extends DataClass
    implements Insertable<RingseriesEntityData> {
  final int id;
  final String ringerId;
  final String code;
  final String schemeCode;
  final int ringfrom;
  final int ringto;
  const RingseriesEntityData(
      {required this.id,
      required this.ringerId,
      required this.code,
      required this.schemeCode,
      required this.ringfrom,
      required this.ringto});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['code'] = Variable<String>(code);
    map['scheme_code'] = Variable<String>(schemeCode);
    map['ringfrom'] = Variable<int>(ringfrom);
    map['ringto'] = Variable<int>(ringto);
    return map;
  }

  RingseriesEntityCompanion toCompanion(bool nullToAbsent) {
    return RingseriesEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      code: Value(code),
      schemeCode: Value(schemeCode),
      ringfrom: Value(ringfrom),
      ringto: Value(ringto),
    );
  }

  factory RingseriesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RingseriesEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      code: serializer.fromJson<String>(json['code']),
      schemeCode: serializer.fromJson<String>(json['schemeCode']),
      ringfrom: serializer.fromJson<int>(json['ringfrom']),
      ringto: serializer.fromJson<int>(json['ringto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'code': serializer.toJson<String>(code),
      'schemeCode': serializer.toJson<String>(schemeCode),
      'ringfrom': serializer.toJson<int>(ringfrom),
      'ringto': serializer.toJson<int>(ringto),
    };
  }

  RingseriesEntityData copyWith(
          {int? id,
          String? ringerId,
          String? code,
          String? schemeCode,
          int? ringfrom,
          int? ringto}) =>
      RingseriesEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        code: code ?? this.code,
        schemeCode: schemeCode ?? this.schemeCode,
        ringfrom: ringfrom ?? this.ringfrom,
        ringto: ringto ?? this.ringto,
      );
  @override
  String toString() {
    return (StringBuffer('RingseriesEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('code: $code, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('ringfrom: $ringfrom, ')
          ..write('ringto: $ringto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ringerId, code, schemeCode, ringfrom, ringto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RingseriesEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.code == this.code &&
          other.schemeCode == this.schemeCode &&
          other.ringfrom == this.ringfrom &&
          other.ringto == this.ringto);
}

class RingseriesEntityCompanion extends UpdateCompanion<RingseriesEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> code;
  final Value<String> schemeCode;
  final Value<int> ringfrom;
  final Value<int> ringto;
  const RingseriesEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.code = const Value.absent(),
    this.schemeCode = const Value.absent(),
    this.ringfrom = const Value.absent(),
    this.ringto = const Value.absent(),
  });
  RingseriesEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String code,
    required String schemeCode,
    required int ringfrom,
    required int ringto,
  })  : ringerId = Value(ringerId),
        code = Value(code),
        schemeCode = Value(schemeCode),
        ringfrom = Value(ringfrom),
        ringto = Value(ringto);
  static Insertable<RingseriesEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? code,
    Expression<String>? schemeCode,
    Expression<int>? ringfrom,
    Expression<int>? ringto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (code != null) 'code': code,
      if (schemeCode != null) 'scheme_code': schemeCode,
      if (ringfrom != null) 'ringfrom': ringfrom,
      if (ringto != null) 'ringto': ringto,
    });
  }

  RingseriesEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? code,
      Value<String>? schemeCode,
      Value<int>? ringfrom,
      Value<int>? ringto}) {
    return RingseriesEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      code: code ?? this.code,
      schemeCode: schemeCode ?? this.schemeCode,
      ringfrom: ringfrom ?? this.ringfrom,
      ringto: ringto ?? this.ringto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (schemeCode.present) {
      map['scheme_code'] = Variable<String>(schemeCode.value);
    }
    if (ringfrom.present) {
      map['ringfrom'] = Variable<int>(ringfrom.value);
    }
    if (ringto.present) {
      map['ringto'] = Variable<int>(ringto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RingseriesEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('code: $code, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('ringfrom: $ringfrom, ')
          ..write('ringto: $ringto')
          ..write(')'))
        .toString();
  }
}

class $RingsInEntityTable extends RingsInEntity
    with TableInfo<$RingsInEntityTable, RingsInEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RingsInEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ringerIdMeta =
      const VerificationMeta('ringerId');
  @override
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schemeCodeMeta =
      const VerificationMeta('schemeCode');
  @override
  late final GeneratedColumn<String> schemeCode = GeneratedColumn<String>(
      'scheme_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idNumberMeta =
      const VerificationMeta('idNumber');
  @override
  late final GeneratedColumn<String> idNumber = GeneratedColumn<String>(
      'id_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usedMeta = const VerificationMeta('used');
  @override
  late final GeneratedColumn<String> used = GeneratedColumn<String>(
      'used', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lostMeta = const VerificationMeta('lost');
  @override
  late final GeneratedColumn<String> lost = GeneratedColumn<String>(
      'lost', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ringerId, code, schemeCode, idNumber, used, lost];
  @override
  String get aliasedName => _alias ?? 'rings_in_entity';
  @override
  String get actualTableName => 'rings_in_entity';
  @override
  VerificationContext validateIntegrity(Insertable<RingsInEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ringer_id')) {
      context.handle(_ringerIdMeta,
          ringerId.isAcceptableOrUnknown(data['ringer_id']!, _ringerIdMeta));
    } else if (isInserting) {
      context.missing(_ringerIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('scheme_code')) {
      context.handle(
          _schemeCodeMeta,
          schemeCode.isAcceptableOrUnknown(
              data['scheme_code']!, _schemeCodeMeta));
    } else if (isInserting) {
      context.missing(_schemeCodeMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_idNumberMeta,
          idNumber.isAcceptableOrUnknown(data['id_number']!, _idNumberMeta));
    } else if (isInserting) {
      context.missing(_idNumberMeta);
    }
    if (data.containsKey('used')) {
      context.handle(
          _usedMeta, used.isAcceptableOrUnknown(data['used']!, _usedMeta));
    } else if (isInserting) {
      context.missing(_usedMeta);
    }
    if (data.containsKey('lost')) {
      context.handle(
          _lostMeta, lost.isAcceptableOrUnknown(data['lost']!, _lostMeta));
    } else if (isInserting) {
      context.missing(_lostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RingsInEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RingsInEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      schemeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheme_code'])!,
      idNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_number'])!,
      used: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}used'])!,
      lost: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lost'])!,
    );
  }

  @override
  $RingsInEntityTable createAlias(String alias) {
    return $RingsInEntityTable(attachedDatabase, alias);
  }
}

class RingsInEntityData extends DataClass
    implements Insertable<RingsInEntityData> {
  final int id;
  final String ringerId;
  final String code;
  final String schemeCode;
  final String idNumber;
  final String used;
  final String lost;
  const RingsInEntityData(
      {required this.id,
      required this.ringerId,
      required this.code,
      required this.schemeCode,
      required this.idNumber,
      required this.used,
      required this.lost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ringer_id'] = Variable<String>(ringerId);
    map['code'] = Variable<String>(code);
    map['scheme_code'] = Variable<String>(schemeCode);
    map['id_number'] = Variable<String>(idNumber);
    map['used'] = Variable<String>(used);
    map['lost'] = Variable<String>(lost);
    return map;
  }

  RingsInEntityCompanion toCompanion(bool nullToAbsent) {
    return RingsInEntityCompanion(
      id: Value(id),
      ringerId: Value(ringerId),
      code: Value(code),
      schemeCode: Value(schemeCode),
      idNumber: Value(idNumber),
      used: Value(used),
      lost: Value(lost),
    );
  }

  factory RingsInEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RingsInEntityData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      code: serializer.fromJson<String>(json['code']),
      schemeCode: serializer.fromJson<String>(json['schemeCode']),
      idNumber: serializer.fromJson<String>(json['idNumber']),
      used: serializer.fromJson<String>(json['used']),
      lost: serializer.fromJson<String>(json['lost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'code': serializer.toJson<String>(code),
      'schemeCode': serializer.toJson<String>(schemeCode),
      'idNumber': serializer.toJson<String>(idNumber),
      'used': serializer.toJson<String>(used),
      'lost': serializer.toJson<String>(lost),
    };
  }

  RingsInEntityData copyWith(
          {int? id,
          String? ringerId,
          String? code,
          String? schemeCode,
          String? idNumber,
          String? used,
          String? lost}) =>
      RingsInEntityData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        code: code ?? this.code,
        schemeCode: schemeCode ?? this.schemeCode,
        idNumber: idNumber ?? this.idNumber,
        used: used ?? this.used,
        lost: lost ?? this.lost,
      );
  @override
  String toString() {
    return (StringBuffer('RingsInEntityData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('code: $code, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('idNumber: $idNumber, ')
          ..write('used: $used, ')
          ..write('lost: $lost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ringerId, code, schemeCode, idNumber, used, lost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RingsInEntityData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.code == this.code &&
          other.schemeCode == this.schemeCode &&
          other.idNumber == this.idNumber &&
          other.used == this.used &&
          other.lost == this.lost);
}

class RingsInEntityCompanion extends UpdateCompanion<RingsInEntityData> {
  final Value<int> id;
  final Value<String> ringerId;
  final Value<String> code;
  final Value<String> schemeCode;
  final Value<String> idNumber;
  final Value<String> used;
  final Value<String> lost;
  const RingsInEntityCompanion({
    this.id = const Value.absent(),
    this.ringerId = const Value.absent(),
    this.code = const Value.absent(),
    this.schemeCode = const Value.absent(),
    this.idNumber = const Value.absent(),
    this.used = const Value.absent(),
    this.lost = const Value.absent(),
  });
  RingsInEntityCompanion.insert({
    this.id = const Value.absent(),
    required String ringerId,
    required String code,
    required String schemeCode,
    required String idNumber,
    required String used,
    required String lost,
  })  : ringerId = Value(ringerId),
        code = Value(code),
        schemeCode = Value(schemeCode),
        idNumber = Value(idNumber),
        used = Value(used),
        lost = Value(lost);
  static Insertable<RingsInEntityData> custom({
    Expression<int>? id,
    Expression<String>? ringerId,
    Expression<String>? code,
    Expression<String>? schemeCode,
    Expression<String>? idNumber,
    Expression<String>? used,
    Expression<String>? lost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ringerId != null) 'ringer_id': ringerId,
      if (code != null) 'code': code,
      if (schemeCode != null) 'scheme_code': schemeCode,
      if (idNumber != null) 'id_number': idNumber,
      if (used != null) 'used': used,
      if (lost != null) 'lost': lost,
    });
  }

  RingsInEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? ringerId,
      Value<String>? code,
      Value<String>? schemeCode,
      Value<String>? idNumber,
      Value<String>? used,
      Value<String>? lost}) {
    return RingsInEntityCompanion(
      id: id ?? this.id,
      ringerId: ringerId ?? this.ringerId,
      code: code ?? this.code,
      schemeCode: schemeCode ?? this.schemeCode,
      idNumber: idNumber ?? this.idNumber,
      used: used ?? this.used,
      lost: lost ?? this.lost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ringerId.present) {
      map['ringer_id'] = Variable<String>(ringerId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (schemeCode.present) {
      map['scheme_code'] = Variable<String>(schemeCode.value);
    }
    if (idNumber.present) {
      map['id_number'] = Variable<String>(idNumber.value);
    }
    if (used.present) {
      map['used'] = Variable<String>(used.value);
    }
    if (lost.present) {
      map['lost'] = Variable<String>(lost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RingsInEntityCompanion(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('code: $code, ')
          ..write('schemeCode: $schemeCode, ')
          ..write('idNumber: $idNumber, ')
          ..write('used: $used, ')
          ..write('lost: $lost')
          ..write(')'))
        .toString();
  }
}

class SessionLocationViewData extends DataClass {
  final int id;
  final String ringerId;
  final String date;
  final String dateAccuracy;
  final int location;
  final String startTime;
  final String endTime;
  final int? locationId;
  final String? locationRingerId;
  final String? locationCountry;
  final String? locationLocality;
  final String? locationPlaceCode;
  final String? locationLat;
  final String? locationLon;
  final String? locationCoordAccuracy;
  final String? locationInfo;
  const SessionLocationViewData(
      {required this.id,
      required this.ringerId,
      required this.date,
      required this.dateAccuracy,
      required this.location,
      required this.startTime,
      required this.endTime,
      this.locationId,
      this.locationRingerId,
      this.locationCountry,
      this.locationLocality,
      this.locationPlaceCode,
      this.locationLat,
      this.locationLon,
      this.locationCoordAccuracy,
      this.locationInfo});
  factory SessionLocationViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionLocationViewData(
      id: serializer.fromJson<int>(json['id']),
      ringerId: serializer.fromJson<String>(json['ringerId']),
      date: serializer.fromJson<String>(json['date']),
      dateAccuracy: serializer.fromJson<String>(json['dateAccuracy']),
      location: serializer.fromJson<int>(json['location']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      locationId: serializer.fromJson<int?>(json['locationId']),
      locationRingerId: serializer.fromJson<String?>(json['locationRingerId']),
      locationCountry: serializer.fromJson<String?>(json['locationCountry']),
      locationLocality: serializer.fromJson<String?>(json['locationLocality']),
      locationPlaceCode:
          serializer.fromJson<String?>(json['locationPlaceCode']),
      locationLat: serializer.fromJson<String?>(json['locationLat']),
      locationLon: serializer.fromJson<String?>(json['locationLon']),
      locationCoordAccuracy:
          serializer.fromJson<String?>(json['locationCoordAccuracy']),
      locationInfo: serializer.fromJson<String?>(json['locationInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ringerId': serializer.toJson<String>(ringerId),
      'date': serializer.toJson<String>(date),
      'dateAccuracy': serializer.toJson<String>(dateAccuracy),
      'location': serializer.toJson<int>(location),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'locationId': serializer.toJson<int?>(locationId),
      'locationRingerId': serializer.toJson<String?>(locationRingerId),
      'locationCountry': serializer.toJson<String?>(locationCountry),
      'locationLocality': serializer.toJson<String?>(locationLocality),
      'locationPlaceCode': serializer.toJson<String?>(locationPlaceCode),
      'locationLat': serializer.toJson<String?>(locationLat),
      'locationLon': serializer.toJson<String?>(locationLon),
      'locationCoordAccuracy':
          serializer.toJson<String?>(locationCoordAccuracy),
      'locationInfo': serializer.toJson<String?>(locationInfo),
    };
  }

  SessionLocationViewData copyWith(
          {int? id,
          String? ringerId,
          String? date,
          String? dateAccuracy,
          int? location,
          String? startTime,
          String? endTime,
          Value<int?> locationId = const Value.absent(),
          Value<String?> locationRingerId = const Value.absent(),
          Value<String?> locationCountry = const Value.absent(),
          Value<String?> locationLocality = const Value.absent(),
          Value<String?> locationPlaceCode = const Value.absent(),
          Value<String?> locationLat = const Value.absent(),
          Value<String?> locationLon = const Value.absent(),
          Value<String?> locationCoordAccuracy = const Value.absent(),
          Value<String?> locationInfo = const Value.absent()}) =>
      SessionLocationViewData(
        id: id ?? this.id,
        ringerId: ringerId ?? this.ringerId,
        date: date ?? this.date,
        dateAccuracy: dateAccuracy ?? this.dateAccuracy,
        location: location ?? this.location,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        locationId: locationId.present ? locationId.value : this.locationId,
        locationRingerId: locationRingerId.present
            ? locationRingerId.value
            : this.locationRingerId,
        locationCountry: locationCountry.present
            ? locationCountry.value
            : this.locationCountry,
        locationLocality: locationLocality.present
            ? locationLocality.value
            : this.locationLocality,
        locationPlaceCode: locationPlaceCode.present
            ? locationPlaceCode.value
            : this.locationPlaceCode,
        locationLat: locationLat.present ? locationLat.value : this.locationLat,
        locationLon: locationLon.present ? locationLon.value : this.locationLon,
        locationCoordAccuracy: locationCoordAccuracy.present
            ? locationCoordAccuracy.value
            : this.locationCoordAccuracy,
        locationInfo:
            locationInfo.present ? locationInfo.value : this.locationInfo,
      );
  @override
  String toString() {
    return (StringBuffer('SessionLocationViewData(')
          ..write('id: $id, ')
          ..write('ringerId: $ringerId, ')
          ..write('date: $date, ')
          ..write('dateAccuracy: $dateAccuracy, ')
          ..write('location: $location, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('locationId: $locationId, ')
          ..write('locationRingerId: $locationRingerId, ')
          ..write('locationCountry: $locationCountry, ')
          ..write('locationLocality: $locationLocality, ')
          ..write('locationPlaceCode: $locationPlaceCode, ')
          ..write('locationLat: $locationLat, ')
          ..write('locationLon: $locationLon, ')
          ..write('locationCoordAccuracy: $locationCoordAccuracy, ')
          ..write('locationInfo: $locationInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      ringerId,
      date,
      dateAccuracy,
      location,
      startTime,
      endTime,
      locationId,
      locationRingerId,
      locationCountry,
      locationLocality,
      locationPlaceCode,
      locationLat,
      locationLon,
      locationCoordAccuracy,
      locationInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionLocationViewData &&
          other.id == this.id &&
          other.ringerId == this.ringerId &&
          other.date == this.date &&
          other.dateAccuracy == this.dateAccuracy &&
          other.location == this.location &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.locationId == this.locationId &&
          other.locationRingerId == this.locationRingerId &&
          other.locationCountry == this.locationCountry &&
          other.locationLocality == this.locationLocality &&
          other.locationPlaceCode == this.locationPlaceCode &&
          other.locationLat == this.locationLat &&
          other.locationLon == this.locationLon &&
          other.locationCoordAccuracy == this.locationCoordAccuracy &&
          other.locationInfo == this.locationInfo);
}

class $SessionLocationViewView
    extends ViewInfo<$SessionLocationViewView, SessionLocationViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$MonRingDb attachedDatabase;
  $SessionLocationViewView(this.attachedDatabase, [this._alias]);
  $SessionEntityTable get aSession =>
      attachedDatabase.sessionEntity.createAlias('t0');
  $LocationEntityTable get aLocation =>
      attachedDatabase.locationEntity.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ringerId,
        date,
        dateAccuracy,
        location,
        startTime,
        endTime,
        locationId,
        locationRingerId,
        locationCountry,
        locationLocality,
        locationPlaceCode,
        locationLat,
        locationLon,
        locationCoordAccuracy,
        locationInfo
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'session_location_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $SessionLocationViewView get asDslTable => this;
  @override
  SessionLocationViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionLocationViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ringerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ringer_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      dateAccuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_accuracy'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time'])!,
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}location_id']),
      locationRingerId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_ringer_id']),
      locationCountry: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_country']),
      locationLocality: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_locality']),
      locationPlaceCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}location_place_code']),
      locationLat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_lat']),
      locationLon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_lon']),
      locationCoordAccuracy: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}location_coord_accuracy']),
      locationInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_info']),
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(aSession.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> ringerId = GeneratedColumn<String>(
      'ringer_id', aliasedName, false,
      generatedAs: GeneratedAs(aSession.ringerId, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      generatedAs: GeneratedAs(aSession.date, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> dateAccuracy = GeneratedColumn<String>(
      'date_accuracy', aliasedName, false,
      generatedAs: GeneratedAs(aSession.dateAccuracy, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<int> location = GeneratedColumn<int>(
      'location', aliasedName, false,
      generatedAs: GeneratedAs(aSession.location, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, false,
      generatedAs: GeneratedAs(aSession.startTime, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, false,
      generatedAs: GeneratedAs(aSession.endTime, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
      'location_id', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> locationRingerId = GeneratedColumn<String>(
      'location_ringer_id', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.ringerId, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> locationCountry = GeneratedColumn<String>(
      'location_country', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.country, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> locationLocality = GeneratedColumn<String>(
      'location_locality', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.locality, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> locationPlaceCode =
      GeneratedColumn<String>('location_place_code', aliasedName, true,
          generatedAs: GeneratedAs(aLocation.placeCode, false),
          type: DriftSqlType.string);
  late final GeneratedColumn<String> locationLat = GeneratedColumn<String>(
      'location_lat', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.latitude, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> locationLon = GeneratedColumn<String>(
      'location_lon', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.longitude, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> locationCoordAccuracy =
      GeneratedColumn<String>('location_coord_accuracy', aliasedName, true,
          generatedAs: GeneratedAs(aLocation.coordinatesAccuracy, false),
          type: DriftSqlType.string);
  late final GeneratedColumn<String> locationInfo = GeneratedColumn<String>(
      'location_info', aliasedName, true,
      generatedAs: GeneratedAs(aLocation.localeInfo, false),
      type: DriftSqlType.string);
  @override
  $SessionLocationViewView createAlias(String alias) {
    return $SessionLocationViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(aSession)..addColumns($columns)).join([
        leftOuterJoin(aLocation, aSession.location.equalsExp(aLocation.id))
      ]);
  @override
  Set<String> get readTables => const {'session_entity', 'location_entity'};
}

abstract class _$MonRingDb extends GeneratedDatabase {
  _$MonRingDb(QueryExecutor e) : super(e);
  late final $LocationEntityTable locationEntity = $LocationEntityTable(this);
  late final $LostRingEntityTable lostRingEntity = $LostRingEntityTable(this);
  late final $OrderEntityTable orderEntity = $OrderEntityTable(this);
  late final $ReportEntityTable reportEntity = $ReportEntityTable(this);
  late final $SessionEntityTable sessionEntity = $SessionEntityTable(this);
  late final $RetrapEntityTable retrapEntity = $RetrapEntityTable(this);
  late final $RingEntityTable ringEntity = $RingEntityTable(this);
  late final $RingseriesEntityTable ringseriesEntity =
      $RingseriesEntityTable(this);
  late final $RingsInEntityTable ringsInEntity = $RingsInEntityTable(this);
  late final $SessionLocationViewView sessionLocationView =
      $SessionLocationViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        locationEntity,
        lostRingEntity,
        orderEntity,
        reportEntity,
        sessionEntity,
        retrapEntity,
        ringEntity,
        ringseriesEntity,
        ringsInEntity,
        sessionLocationView
      ];
}
