// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AzkarCategoryTableTable extends AzkarCategoryTable
    with TableInfo<$AzkarCategoryTableTable, AzkarCategoryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarCategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_category';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarCategoryRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarCategoryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarCategoryRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
    );
  }

  @override
  $AzkarCategoryTableTable createAlias(String alias) {
    return $AzkarCategoryTableTable(attachedDatabase, alias);
  }
}

class AzkarCategoryRecord extends DataClass
    implements Insertable<AzkarCategoryRecord> {
  final int id;
  const AzkarCategoryRecord({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    return map;
  }

  AzkarCategoryTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarCategoryTableCompanion(id: Value(id));
  }

  factory AzkarCategoryRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarCategoryRecord(id: serializer.fromJson<int>(json['id']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'id': serializer.toJson<int>(id)};
  }

  AzkarCategoryRecord copyWith({int? id}) =>
      AzkarCategoryRecord(id: id ?? this.id);
  AzkarCategoryRecord copyWithCompanion(AzkarCategoryTableCompanion data) {
    return AzkarCategoryRecord(id: data.id.present ? data.id.value : this.id);
  }

  @override
  String toString() {
    return (StringBuffer('AzkarCategoryRecord(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarCategoryRecord && other.id == this.id);
}

class AzkarCategoryTableCompanion extends UpdateCompanion<AzkarCategoryRecord> {
  final Value<int> id;
  const AzkarCategoryTableCompanion({this.id = const Value.absent()});
  AzkarCategoryTableCompanion.insert({this.id = const Value.absent()});
  static Insertable<AzkarCategoryRecord> custom({Expression<int>? id}) {
    return RawValuesInsertable({if (id != null) '_id': id});
  }

  AzkarCategoryTableCompanion copyWith({Value<int>? id}) {
    return AzkarCategoryTableCompanion(id: id ?? this.id);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarCategoryTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $AzkarCategoryTranslationTableTable extends AzkarCategoryTranslationTable
    with
        TableInfo<
          $AzkarCategoryTranslationTableTable,
          AzkarCategoryTranslationRecord
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarCategoryTranslationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES azkar_category (_id)',
    ),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    categoryId,
    language,
    categoryName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_category_translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarCategoryTranslationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarCategoryTranslationRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarCategoryTranslationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      categoryName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category_name'],
          )!,
    );
  }

  @override
  $AzkarCategoryTranslationTableTable createAlias(String alias) {
    return $AzkarCategoryTranslationTableTable(attachedDatabase, alias);
  }
}

class AzkarCategoryTranslationRecord extends DataClass
    implements Insertable<AzkarCategoryTranslationRecord> {
  final int id;
  final int categoryId;
  final String language;
  final String categoryName;
  const AzkarCategoryTranslationRecord({
    required this.id,
    required this.categoryId,
    required this.language,
    required this.categoryName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['language'] = Variable<String>(language);
    map['category_name'] = Variable<String>(categoryName);
    return map;
  }

  AzkarCategoryTranslationTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarCategoryTranslationTableCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      language: Value(language),
      categoryName: Value(categoryName),
    );
  }

  factory AzkarCategoryTranslationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarCategoryTranslationRecord(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      language: serializer.fromJson<String>(json['language']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'language': serializer.toJson<String>(language),
      'categoryName': serializer.toJson<String>(categoryName),
    };
  }

  AzkarCategoryTranslationRecord copyWith({
    int? id,
    int? categoryId,
    String? language,
    String? categoryName,
  }) => AzkarCategoryTranslationRecord(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    language: language ?? this.language,
    categoryName: categoryName ?? this.categoryName,
  );
  AzkarCategoryTranslationRecord copyWithCompanion(
    AzkarCategoryTranslationTableCompanion data,
  ) {
    return AzkarCategoryTranslationRecord(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      language: data.language.present ? data.language.value : this.language,
      categoryName:
          data.categoryName.present
              ? data.categoryName.value
              : this.categoryName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarCategoryTranslationRecord(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('language: $language, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, language, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarCategoryTranslationRecord &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.language == this.language &&
          other.categoryName == this.categoryName);
}

class AzkarCategoryTranslationTableCompanion
    extends UpdateCompanion<AzkarCategoryTranslationRecord> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> language;
  final Value<String> categoryName;
  const AzkarCategoryTranslationTableCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.language = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  AzkarCategoryTranslationTableCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String language,
    required String categoryName,
  }) : categoryId = Value(categoryId),
       language = Value(language),
       categoryName = Value(categoryName);
  static Insertable<AzkarCategoryTranslationRecord> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? language,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (language != null) 'language': language,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  AzkarCategoryTranslationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<String>? language,
    Value<String>? categoryName,
  }) {
    return AzkarCategoryTranslationTableCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      language: language ?? this.language,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarCategoryTranslationTableCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('language: $language, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $AzkarChapterTableTable extends AzkarChapterTable
    with TableInfo<$AzkarChapterTableTable, AzkarChapterRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarChapterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_chapter';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarChapterRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarChapterRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarChapterRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
    );
  }

  @override
  $AzkarChapterTableTable createAlias(String alias) {
    return $AzkarChapterTableTable(attachedDatabase, alias);
  }
}

class AzkarChapterRecord extends DataClass
    implements Insertable<AzkarChapterRecord> {
  final int id;
  final int categoryId;
  const AzkarChapterRecord({required this.id, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  AzkarChapterTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarChapterTableCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
    );
  }

  factory AzkarChapterRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarChapterRecord(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  AzkarChapterRecord copyWith({int? id, int? categoryId}) => AzkarChapterRecord(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
  );
  AzkarChapterRecord copyWithCompanion(AzkarChapterTableCompanion data) {
    return AzkarChapterRecord(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarChapterRecord(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarChapterRecord &&
          other.id == this.id &&
          other.categoryId == this.categoryId);
}

class AzkarChapterTableCompanion extends UpdateCompanion<AzkarChapterRecord> {
  final Value<int> id;
  final Value<int> categoryId;
  const AzkarChapterTableCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  AzkarChapterTableCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
  }) : categoryId = Value(categoryId);
  static Insertable<AzkarChapterRecord> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  AzkarChapterTableCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
  }) {
    return AzkarChapterTableCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarChapterTableCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $AzkarChapterTranslationTableTable extends AzkarChapterTranslationTable
    with
        TableInfo<
          $AzkarChapterTranslationTableTable,
          AzkarChapterTranslationRecord
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarChapterTranslationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES azkar_chapter (_id)',
    ),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chapterNameMeta = const VerificationMeta(
    'chapterName',
  );
  @override
  late final GeneratedColumn<String> chapterName = GeneratedColumn<String>(
    'chapter_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, chapterId, language, chapterName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_chapter_translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarChapterTranslationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('chapter_name')) {
      context.handle(
        _chapterNameMeta,
        chapterName.isAcceptableOrUnknown(
          data['chapter_name']!,
          _chapterNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_chapterNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarChapterTranslationRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarChapterTranslationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      chapterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}chapter_id'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      chapterName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}chapter_name'],
          )!,
    );
  }

  @override
  $AzkarChapterTranslationTableTable createAlias(String alias) {
    return $AzkarChapterTranslationTableTable(attachedDatabase, alias);
  }
}

class AzkarChapterTranslationRecord extends DataClass
    implements Insertable<AzkarChapterTranslationRecord> {
  final int id;
  final int chapterId;
  final String language;
  final String chapterName;
  const AzkarChapterTranslationRecord({
    required this.id,
    required this.chapterId,
    required this.language,
    required this.chapterName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapterId);
    map['language'] = Variable<String>(language);
    map['chapter_name'] = Variable<String>(chapterName);
    return map;
  }

  AzkarChapterTranslationTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarChapterTranslationTableCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      language: Value(language),
      chapterName: Value(chapterName),
    );
  }

  factory AzkarChapterTranslationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarChapterTranslationRecord(
      id: serializer.fromJson<int>(json['id']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      language: serializer.fromJson<String>(json['language']),
      chapterName: serializer.fromJson<String>(json['chapterName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chapterId': serializer.toJson<int>(chapterId),
      'language': serializer.toJson<String>(language),
      'chapterName': serializer.toJson<String>(chapterName),
    };
  }

  AzkarChapterTranslationRecord copyWith({
    int? id,
    int? chapterId,
    String? language,
    String? chapterName,
  }) => AzkarChapterTranslationRecord(
    id: id ?? this.id,
    chapterId: chapterId ?? this.chapterId,
    language: language ?? this.language,
    chapterName: chapterName ?? this.chapterName,
  );
  AzkarChapterTranslationRecord copyWithCompanion(
    AzkarChapterTranslationTableCompanion data,
  ) {
    return AzkarChapterTranslationRecord(
      id: data.id.present ? data.id.value : this.id,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      language: data.language.present ? data.language.value : this.language,
      chapterName:
          data.chapterName.present ? data.chapterName.value : this.chapterName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarChapterTranslationRecord(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('language: $language, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapterId, language, chapterName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarChapterTranslationRecord &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.language == this.language &&
          other.chapterName == this.chapterName);
}

class AzkarChapterTranslationTableCompanion
    extends UpdateCompanion<AzkarChapterTranslationRecord> {
  final Value<int> id;
  final Value<int> chapterId;
  final Value<String> language;
  final Value<String> chapterName;
  const AzkarChapterTranslationTableCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.language = const Value.absent(),
    this.chapterName = const Value.absent(),
  });
  AzkarChapterTranslationTableCompanion.insert({
    this.id = const Value.absent(),
    required int chapterId,
    required String language,
    required String chapterName,
  }) : chapterId = Value(chapterId),
       language = Value(language),
       chapterName = Value(chapterName);
  static Insertable<AzkarChapterTranslationRecord> custom({
    Expression<int>? id,
    Expression<int>? chapterId,
    Expression<String>? language,
    Expression<String>? chapterName,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (language != null) 'language': language,
      if (chapterName != null) 'chapter_name': chapterName,
    });
  }

  AzkarChapterTranslationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? chapterId,
    Value<String>? language,
    Value<String>? chapterName,
  }) {
    return AzkarChapterTranslationTableCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      language: language ?? this.language,
      chapterName: chapterName ?? this.chapterName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (chapterName.present) {
      map['chapter_name'] = Variable<String>(chapterName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarChapterTranslationTableCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('language: $language, ')
          ..write('chapterName: $chapterName')
          ..write(')'))
        .toString();
  }
}

class $AzkarItemTableTable extends AzkarItemTable
    with TableInfo<$AzkarItemTableTable, AzkarItemRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chapterIdMeta = const VerificationMeta(
    'chapterId',
  );
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
    'chapter_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
    'item',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, chapterId, item];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarItemRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(
        _chapterIdMeta,
        chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
        _itemMeta,
        item.isAcceptableOrUnknown(data['item']!, _itemMeta),
      );
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarItemRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarItemRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      chapterId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}chapter_id'],
          )!,
      item:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}item'],
          )!,
    );
  }

  @override
  $AzkarItemTableTable createAlias(String alias) {
    return $AzkarItemTableTable(attachedDatabase, alias);
  }
}

class AzkarItemRecord extends DataClass implements Insertable<AzkarItemRecord> {
  final int id;
  final int chapterId;
  final String item;
  const AzkarItemRecord({
    required this.id,
    required this.chapterId,
    required this.item,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapterId);
    map['item'] = Variable<String>(item);
    return map;
  }

  AzkarItemTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarItemTableCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      item: Value(item),
    );
  }

  factory AzkarItemRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarItemRecord(
      id: serializer.fromJson<int>(json['id']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      item: serializer.fromJson<String>(json['item']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chapterId': serializer.toJson<int>(chapterId),
      'item': serializer.toJson<String>(item),
    };
  }

  AzkarItemRecord copyWith({int? id, int? chapterId, String? item}) =>
      AzkarItemRecord(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        item: item ?? this.item,
      );
  AzkarItemRecord copyWithCompanion(AzkarItemTableCompanion data) {
    return AzkarItemRecord(
      id: data.id.present ? data.id.value : this.id,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      item: data.item.present ? data.item.value : this.item,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarItemRecord(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapterId, item);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarItemRecord &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.item == this.item);
}

class AzkarItemTableCompanion extends UpdateCompanion<AzkarItemRecord> {
  final Value<int> id;
  final Value<int> chapterId;
  final Value<String> item;
  const AzkarItemTableCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.item = const Value.absent(),
  });
  AzkarItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int chapterId,
    required String item,
  }) : chapterId = Value(chapterId),
       item = Value(item);
  static Insertable<AzkarItemRecord> custom({
    Expression<int>? id,
    Expression<int>? chapterId,
    Expression<String>? item,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (item != null) 'item': item,
    });
  }

  AzkarItemTableCompanion copyWith({
    Value<int>? id,
    Value<int>? chapterId,
    Value<String>? item,
  }) {
    return AzkarItemTableCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      item: item ?? this.item,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarItemTableCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }
}

class $AzkarItemTranslationTableTable extends AzkarItemTranslationTable
    with
        TableInfo<$AzkarItemTranslationTableTable, AzkarItemTranslationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarItemTranslationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES azkar_item (_id)',
    ),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemTranslationMeta = const VerificationMeta(
    'itemTranslation',
  );
  @override
  late final GeneratedColumn<String> itemTranslation = GeneratedColumn<String>(
    'item_translation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, itemId, language, itemTranslation];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_item_translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarItemTranslationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('item_translation')) {
      context.handle(
        _itemTranslationMeta,
        itemTranslation.isAcceptableOrUnknown(
          data['item_translation']!,
          _itemTranslationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_itemTranslationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarItemTranslationRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarItemTranslationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      itemId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}item_id'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      itemTranslation:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}item_translation'],
          )!,
    );
  }

  @override
  $AzkarItemTranslationTableTable createAlias(String alias) {
    return $AzkarItemTranslationTableTable(attachedDatabase, alias);
  }
}

class AzkarItemTranslationRecord extends DataClass
    implements Insertable<AzkarItemTranslationRecord> {
  final int id;
  final int itemId;
  final String language;
  final String itemTranslation;
  const AzkarItemTranslationRecord({
    required this.id,
    required this.itemId,
    required this.language,
    required this.itemTranslation,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['language'] = Variable<String>(language);
    map['item_translation'] = Variable<String>(itemTranslation);
    return map;
  }

  AzkarItemTranslationTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarItemTranslationTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      language: Value(language),
      itemTranslation: Value(itemTranslation),
    );
  }

  factory AzkarItemTranslationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarItemTranslationRecord(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      language: serializer.fromJson<String>(json['language']),
      itemTranslation: serializer.fromJson<String>(json['itemTranslation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'language': serializer.toJson<String>(language),
      'itemTranslation': serializer.toJson<String>(itemTranslation),
    };
  }

  AzkarItemTranslationRecord copyWith({
    int? id,
    int? itemId,
    String? language,
    String? itemTranslation,
  }) => AzkarItemTranslationRecord(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    language: language ?? this.language,
    itemTranslation: itemTranslation ?? this.itemTranslation,
  );
  AzkarItemTranslationRecord copyWithCompanion(
    AzkarItemTranslationTableCompanion data,
  ) {
    return AzkarItemTranslationRecord(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      language: data.language.present ? data.language.value : this.language,
      itemTranslation:
          data.itemTranslation.present
              ? data.itemTranslation.value
              : this.itemTranslation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarItemTranslationRecord(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('language: $language, ')
          ..write('itemTranslation: $itemTranslation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, language, itemTranslation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarItemTranslationRecord &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.language == this.language &&
          other.itemTranslation == this.itemTranslation);
}

class AzkarItemTranslationTableCompanion
    extends UpdateCompanion<AzkarItemTranslationRecord> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> language;
  final Value<String> itemTranslation;
  const AzkarItemTranslationTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.language = const Value.absent(),
    this.itemTranslation = const Value.absent(),
  });
  AzkarItemTranslationTableCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String language,
    required String itemTranslation,
  }) : itemId = Value(itemId),
       language = Value(language),
       itemTranslation = Value(itemTranslation);
  static Insertable<AzkarItemTranslationRecord> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? language,
    Expression<String>? itemTranslation,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (itemId != null) 'item_id': itemId,
      if (language != null) 'language': language,
      if (itemTranslation != null) 'item_translation': itemTranslation,
    });
  }

  AzkarItemTranslationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<String>? language,
    Value<String>? itemTranslation,
  }) {
    return AzkarItemTranslationTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      language: language ?? this.language,
      itemTranslation: itemTranslation ?? this.itemTranslation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (itemTranslation.present) {
      map['item_translation'] = Variable<String>(itemTranslation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarItemTranslationTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('language: $language, ')
          ..write('itemTranslation: $itemTranslation')
          ..write(')'))
        .toString();
  }
}

class $AzkarReferenceTableTable extends AzkarReferenceTable
    with TableInfo<$AzkarReferenceTableTable, AzkarReferenceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarReferenceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, itemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_reference';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarReferenceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarReferenceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarReferenceRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      itemId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}item_id'],
          )!,
    );
  }

  @override
  $AzkarReferenceTableTable createAlias(String alias) {
    return $AzkarReferenceTableTable(attachedDatabase, alias);
  }
}

class AzkarReferenceRecord extends DataClass
    implements Insertable<AzkarReferenceRecord> {
  final int id;
  final int itemId;
  const AzkarReferenceRecord({required this.id, required this.itemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    return map;
  }

  AzkarReferenceTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarReferenceTableCompanion(id: Value(id), itemId: Value(itemId));
  }

  factory AzkarReferenceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarReferenceRecord(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
    };
  }

  AzkarReferenceRecord copyWith({int? id, int? itemId}) =>
      AzkarReferenceRecord(id: id ?? this.id, itemId: itemId ?? this.itemId);
  AzkarReferenceRecord copyWithCompanion(AzkarReferenceTableCompanion data) {
    return AzkarReferenceRecord(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarReferenceRecord(')
          ..write('id: $id, ')
          ..write('itemId: $itemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarReferenceRecord &&
          other.id == this.id &&
          other.itemId == this.itemId);
}

class AzkarReferenceTableCompanion
    extends UpdateCompanion<AzkarReferenceRecord> {
  final Value<int> id;
  final Value<int> itemId;
  const AzkarReferenceTableCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
  });
  AzkarReferenceTableCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
  }) : itemId = Value(itemId);
  static Insertable<AzkarReferenceRecord> custom({
    Expression<int>? id,
    Expression<int>? itemId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (itemId != null) 'item_id': itemId,
    });
  }

  AzkarReferenceTableCompanion copyWith({Value<int>? id, Value<int>? itemId}) {
    return AzkarReferenceTableCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarReferenceTableCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId')
          ..write(')'))
        .toString();
  }
}

class $AzkarReferenceTranslationTableTable
    extends AzkarReferenceTranslationTable
    with
        TableInfo<
          $AzkarReferenceTranslationTableTable,
          AzkarReferenceTranslationRecord
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AzkarReferenceTranslationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _referenceIdMeta = const VerificationMeta(
    'referenceId',
  );
  @override
  late final GeneratedColumn<int> referenceId = GeneratedColumn<int>(
    'reference_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES azkar_reference (_id)',
    ),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, referenceId, language, reference];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'azkar_reference_translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<AzkarReferenceTranslationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('reference_id')) {
      context.handle(
        _referenceIdMeta,
        referenceId.isAcceptableOrUnknown(
          data['reference_id']!,
          _referenceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    } else if (isInserting) {
      context.missing(_referenceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AzkarReferenceTranslationRecord map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AzkarReferenceTranslationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      referenceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reference_id'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      reference:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reference'],
          )!,
    );
  }

  @override
  $AzkarReferenceTranslationTableTable createAlias(String alias) {
    return $AzkarReferenceTranslationTableTable(attachedDatabase, alias);
  }
}

class AzkarReferenceTranslationRecord extends DataClass
    implements Insertable<AzkarReferenceTranslationRecord> {
  final int id;
  final int referenceId;
  final String language;
  final String reference;
  const AzkarReferenceTranslationRecord({
    required this.id,
    required this.referenceId,
    required this.language,
    required this.reference,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['reference_id'] = Variable<int>(referenceId);
    map['language'] = Variable<String>(language);
    map['reference'] = Variable<String>(reference);
    return map;
  }

  AzkarReferenceTranslationTableCompanion toCompanion(bool nullToAbsent) {
    return AzkarReferenceTranslationTableCompanion(
      id: Value(id),
      referenceId: Value(referenceId),
      language: Value(language),
      reference: Value(reference),
    );
  }

  factory AzkarReferenceTranslationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AzkarReferenceTranslationRecord(
      id: serializer.fromJson<int>(json['id']),
      referenceId: serializer.fromJson<int>(json['referenceId']),
      language: serializer.fromJson<String>(json['language']),
      reference: serializer.fromJson<String>(json['reference']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'referenceId': serializer.toJson<int>(referenceId),
      'language': serializer.toJson<String>(language),
      'reference': serializer.toJson<String>(reference),
    };
  }

  AzkarReferenceTranslationRecord copyWith({
    int? id,
    int? referenceId,
    String? language,
    String? reference,
  }) => AzkarReferenceTranslationRecord(
    id: id ?? this.id,
    referenceId: referenceId ?? this.referenceId,
    language: language ?? this.language,
    reference: reference ?? this.reference,
  );
  AzkarReferenceTranslationRecord copyWithCompanion(
    AzkarReferenceTranslationTableCompanion data,
  ) {
    return AzkarReferenceTranslationRecord(
      id: data.id.present ? data.id.value : this.id,
      referenceId:
          data.referenceId.present ? data.referenceId.value : this.referenceId,
      language: data.language.present ? data.language.value : this.language,
      reference: data.reference.present ? data.reference.value : this.reference,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AzkarReferenceTranslationRecord(')
          ..write('id: $id, ')
          ..write('referenceId: $referenceId, ')
          ..write('language: $language, ')
          ..write('reference: $reference')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, referenceId, language, reference);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AzkarReferenceTranslationRecord &&
          other.id == this.id &&
          other.referenceId == this.referenceId &&
          other.language == this.language &&
          other.reference == this.reference);
}

class AzkarReferenceTranslationTableCompanion
    extends UpdateCompanion<AzkarReferenceTranslationRecord> {
  final Value<int> id;
  final Value<int> referenceId;
  final Value<String> language;
  final Value<String> reference;
  const AzkarReferenceTranslationTableCompanion({
    this.id = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.language = const Value.absent(),
    this.reference = const Value.absent(),
  });
  AzkarReferenceTranslationTableCompanion.insert({
    this.id = const Value.absent(),
    required int referenceId,
    required String language,
    required String reference,
  }) : referenceId = Value(referenceId),
       language = Value(language),
       reference = Value(reference);
  static Insertable<AzkarReferenceTranslationRecord> custom({
    Expression<int>? id,
    Expression<int>? referenceId,
    Expression<String>? language,
    Expression<String>? reference,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (referenceId != null) 'reference_id': referenceId,
      if (language != null) 'language': language,
      if (reference != null) 'reference': reference,
    });
  }

  AzkarReferenceTranslationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? referenceId,
    Value<String>? language,
    Value<String>? reference,
  }) {
    return AzkarReferenceTranslationTableCompanion(
      id: id ?? this.id,
      referenceId: referenceId ?? this.referenceId,
      language: language ?? this.language,
      reference: reference ?? this.reference,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<int>(referenceId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AzkarReferenceTranslationTableCompanion(')
          ..write('id: $id, ')
          ..write('referenceId: $referenceId, ')
          ..write('language: $language, ')
          ..write('reference: $reference')
          ..write(')'))
        .toString();
  }
}

class $CountryTableTable extends CountryTable
    with TableInfo<$CountryTableTable, CountryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _continentMeta = const VerificationMeta(
    'continent',
  );
  @override
  late final GeneratedColumn<String> continent = GeneratedColumn<String>(
    'continent',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name, continent, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountryRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('continent')) {
      context.handle(
        _continentMeta,
        continent.isAcceptableOrUnknown(data['continent']!, _continentMeta),
      );
    } else if (isInserting) {
      context.missing(_continentMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      code:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}code'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      continent:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}continent'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
    );
  }

  @override
  $CountryTableTable createAlias(String alias) {
    return $CountryTableTable(attachedDatabase, alias);
  }
}

class CountryRecord extends DataClass implements Insertable<CountryRecord> {
  final int id;
  final String code;
  final String name;
  final String continent;
  final String language;
  const CountryRecord({
    required this.id,
    required this.code,
    required this.name,
    required this.continent,
    required this.language,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['continent'] = Variable<String>(continent);
    map['language'] = Variable<String>(language);
    return map;
  }

  CountryTableCompanion toCompanion(bool nullToAbsent) {
    return CountryTableCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      continent: Value(continent),
      language: Value(language),
    );
  }

  factory CountryRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryRecord(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      continent: serializer.fromJson<String>(json['continent']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'continent': serializer.toJson<String>(continent),
      'language': serializer.toJson<String>(language),
    };
  }

  CountryRecord copyWith({
    int? id,
    String? code,
    String? name,
    String? continent,
    String? language,
  }) => CountryRecord(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    continent: continent ?? this.continent,
    language: language ?? this.language,
  );
  CountryRecord copyWithCompanion(CountryTableCompanion data) {
    return CountryRecord(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      continent: data.continent.present ? data.continent.value : this.continent,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryRecord(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('continent: $continent, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, continent, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryRecord &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.continent == this.continent &&
          other.language == this.language);
}

class CountryTableCompanion extends UpdateCompanion<CountryRecord> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> continent;
  final Value<String> language;
  const CountryTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.continent = const Value.absent(),
    this.language = const Value.absent(),
  });
  CountryTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String continent,
    required String language,
  }) : code = Value(code),
       name = Value(name),
       continent = Value(continent),
       language = Value(language);
  static Insertable<CountryRecord> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? continent,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (continent != null) 'continent': continent,
      if (language != null) 'language': language,
    });
  }

  CountryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? continent,
    Value<String>? language,
  }) {
    return CountryTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      continent: continent ?? this.continent,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (continent.present) {
      map['continent'] = Variable<String>(continent.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('continent: $continent, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $LocationTableTable extends LocationTable
    with TableInfo<$LocationTableTable, LocationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES country (_id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasFixedPrayerTimeMeta =
      const VerificationMeta('hasFixedPrayerTime');
  @override
  late final GeneratedColumn<bool> hasFixedPrayerTime = GeneratedColumn<bool>(
    'has_fixed_prayer_time',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_fixed_prayer_time" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _prayerDependentIdMeta = const VerificationMeta(
    'prayerDependentId',
  );
  @override
  late final GeneratedColumn<int> prayerDependentId = GeneratedColumn<int>(
    'prayer_dependent_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES location (_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    countryId,
    name,
    latitude,
    longitude,
    hasFixedPrayerTime,
    prayerDependentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('has_fixed_prayer_time')) {
      context.handle(
        _hasFixedPrayerTimeMeta,
        hasFixedPrayerTime.isAcceptableOrUnknown(
          data['has_fixed_prayer_time']!,
          _hasFixedPrayerTimeMeta,
        ),
      );
    }
    if (data.containsKey('prayer_dependent_id')) {
      context.handle(
        _prayerDependentIdMeta,
        prayerDependentId.isAcceptableOrUnknown(
          data['prayer_dependent_id']!,
          _prayerDependentIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      countryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}country_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      latitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}latitude'],
          )!,
      longitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}longitude'],
          )!,
      hasFixedPrayerTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}has_fixed_prayer_time'],
          )!,
      prayerDependentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prayer_dependent_id'],
      ),
    );
  }

  @override
  $LocationTableTable createAlias(String alias) {
    return $LocationTableTable(attachedDatabase, alias);
  }
}

class LocationRecord extends DataClass implements Insertable<LocationRecord> {
  final int id;
  final int countryId;
  final String name;
  final double latitude;
  final double longitude;
  final bool hasFixedPrayerTime;
  final int? prayerDependentId;
  const LocationRecord({
    required this.id,
    required this.countryId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.hasFixedPrayerTime,
    this.prayerDependentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['country_id'] = Variable<int>(countryId);
    map['name'] = Variable<String>(name);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['has_fixed_prayer_time'] = Variable<bool>(hasFixedPrayerTime);
    if (!nullToAbsent || prayerDependentId != null) {
      map['prayer_dependent_id'] = Variable<int>(prayerDependentId);
    }
    return map;
  }

  LocationTableCompanion toCompanion(bool nullToAbsent) {
    return LocationTableCompanion(
      id: Value(id),
      countryId: Value(countryId),
      name: Value(name),
      latitude: Value(latitude),
      longitude: Value(longitude),
      hasFixedPrayerTime: Value(hasFixedPrayerTime),
      prayerDependentId:
          prayerDependentId == null && nullToAbsent
              ? const Value.absent()
              : Value(prayerDependentId),
    );
  }

  factory LocationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationRecord(
      id: serializer.fromJson<int>(json['id']),
      countryId: serializer.fromJson<int>(json['countryId']),
      name: serializer.fromJson<String>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      hasFixedPrayerTime: serializer.fromJson<bool>(json['hasFixedPrayerTime']),
      prayerDependentId: serializer.fromJson<int?>(json['prayerDependentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'countryId': serializer.toJson<int>(countryId),
      'name': serializer.toJson<String>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'hasFixedPrayerTime': serializer.toJson<bool>(hasFixedPrayerTime),
      'prayerDependentId': serializer.toJson<int?>(prayerDependentId),
    };
  }

  LocationRecord copyWith({
    int? id,
    int? countryId,
    String? name,
    double? latitude,
    double? longitude,
    bool? hasFixedPrayerTime,
    Value<int?> prayerDependentId = const Value.absent(),
  }) => LocationRecord(
    id: id ?? this.id,
    countryId: countryId ?? this.countryId,
    name: name ?? this.name,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    hasFixedPrayerTime: hasFixedPrayerTime ?? this.hasFixedPrayerTime,
    prayerDependentId:
        prayerDependentId.present
            ? prayerDependentId.value
            : this.prayerDependentId,
  );
  LocationRecord copyWithCompanion(LocationTableCompanion data) {
    return LocationRecord(
      id: data.id.present ? data.id.value : this.id,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      name: data.name.present ? data.name.value : this.name,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      hasFixedPrayerTime:
          data.hasFixedPrayerTime.present
              ? data.hasFixedPrayerTime.value
              : this.hasFixedPrayerTime,
      prayerDependentId:
          data.prayerDependentId.present
              ? data.prayerDependentId.value
              : this.prayerDependentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationRecord(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('hasFixedPrayerTime: $hasFixedPrayerTime, ')
          ..write('prayerDependentId: $prayerDependentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    countryId,
    name,
    latitude,
    longitude,
    hasFixedPrayerTime,
    prayerDependentId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationRecord &&
          other.id == this.id &&
          other.countryId == this.countryId &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.hasFixedPrayerTime == this.hasFixedPrayerTime &&
          other.prayerDependentId == this.prayerDependentId);
}

class LocationTableCompanion extends UpdateCompanion<LocationRecord> {
  final Value<int> id;
  final Value<int> countryId;
  final Value<String> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<bool> hasFixedPrayerTime;
  final Value<int?> prayerDependentId;
  const LocationTableCompanion({
    this.id = const Value.absent(),
    this.countryId = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.hasFixedPrayerTime = const Value.absent(),
    this.prayerDependentId = const Value.absent(),
  });
  LocationTableCompanion.insert({
    this.id = const Value.absent(),
    required int countryId,
    required String name,
    required double latitude,
    required double longitude,
    this.hasFixedPrayerTime = const Value.absent(),
    this.prayerDependentId = const Value.absent(),
  }) : countryId = Value(countryId),
       name = Value(name),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<LocationRecord> custom({
    Expression<int>? id,
    Expression<int>? countryId,
    Expression<String>? name,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<bool>? hasFixedPrayerTime,
    Expression<int>? prayerDependentId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (countryId != null) 'country_id': countryId,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (hasFixedPrayerTime != null)
        'has_fixed_prayer_time': hasFixedPrayerTime,
      if (prayerDependentId != null) 'prayer_dependent_id': prayerDependentId,
    });
  }

  LocationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? countryId,
    Value<String>? name,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<bool>? hasFixedPrayerTime,
    Value<int?>? prayerDependentId,
  }) {
    return LocationTableCompanion(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      hasFixedPrayerTime: hasFixedPrayerTime ?? this.hasFixedPrayerTime,
      prayerDependentId: prayerDependentId ?? this.prayerDependentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (hasFixedPrayerTime.present) {
      map['has_fixed_prayer_time'] = Variable<bool>(hasFixedPrayerTime.value);
    }
    if (prayerDependentId.present) {
      map['prayer_dependent_id'] = Variable<int>(prayerDependentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTableCompanion(')
          ..write('id: $id, ')
          ..write('countryId: $countryId, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('hasFixedPrayerTime: $hasFixedPrayerTime, ')
          ..write('prayerDependentId: $prayerDependentId')
          ..write(')'))
        .toString();
  }
}

class $NameTableTable extends NameTable
    with TableInfo<$NameTableTable, NameRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'name';
  @override
  VerificationContext validateIntegrity(
    Insertable<NameRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NameRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NameRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $NameTableTable createAlias(String alias) {
    return $NameTableTable(attachedDatabase, alias);
  }
}

class NameRecord extends DataClass implements Insertable<NameRecord> {
  final int id;
  final String name;
  const NameRecord({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  NameTableCompanion toCompanion(bool nullToAbsent) {
    return NameTableCompanion(id: Value(id), name: Value(name));
  }

  factory NameRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NameRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NameRecord copyWith({int? id, String? name}) =>
      NameRecord(id: id ?? this.id, name: name ?? this.name);
  NameRecord copyWithCompanion(NameTableCompanion data) {
    return NameRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NameRecord(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameRecord && other.id == this.id && other.name == this.name);
}

class NameTableCompanion extends UpdateCompanion<NameRecord> {
  final Value<int> id;
  final Value<String> name;
  const NameTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NameTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<NameRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NameTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return NameTableCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NameTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $NameTranslationTableTable extends NameTranslationTable
    with TableInfo<$NameTranslationTableTable, NameTranslationRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NameTranslationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameIdMeta = const VerificationMeta('nameId');
  @override
  late final GeneratedColumn<int> nameId = GeneratedColumn<int>(
    'name_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES name (_id)',
    ),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nameId, language, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'name_translation';
  @override
  VerificationContext validateIntegrity(
    Insertable<NameTranslationRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('name_id')) {
      context.handle(
        _nameIdMeta,
        nameId.isAcceptableOrUnknown(data['name_id']!, _nameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_nameIdMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NameTranslationRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NameTranslationRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      nameId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}name_id'],
          )!,
      language:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}language'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $NameTranslationTableTable createAlias(String alias) {
    return $NameTranslationTableTable(attachedDatabase, alias);
  }
}

class NameTranslationRecord extends DataClass
    implements Insertable<NameTranslationRecord> {
  final int id;
  final int nameId;
  final String language;
  final String name;
  const NameTranslationRecord({
    required this.id,
    required this.nameId,
    required this.language,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['name_id'] = Variable<int>(nameId);
    map['language'] = Variable<String>(language);
    map['name'] = Variable<String>(name);
    return map;
  }

  NameTranslationTableCompanion toCompanion(bool nullToAbsent) {
    return NameTranslationTableCompanion(
      id: Value(id),
      nameId: Value(nameId),
      language: Value(language),
      name: Value(name),
    );
  }

  factory NameTranslationRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NameTranslationRecord(
      id: serializer.fromJson<int>(json['id']),
      nameId: serializer.fromJson<int>(json['nameId']),
      language: serializer.fromJson<String>(json['language']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameId': serializer.toJson<int>(nameId),
      'language': serializer.toJson<String>(language),
      'name': serializer.toJson<String>(name),
    };
  }

  NameTranslationRecord copyWith({
    int? id,
    int? nameId,
    String? language,
    String? name,
  }) => NameTranslationRecord(
    id: id ?? this.id,
    nameId: nameId ?? this.nameId,
    language: language ?? this.language,
    name: name ?? this.name,
  );
  NameTranslationRecord copyWithCompanion(NameTranslationTableCompanion data) {
    return NameTranslationRecord(
      id: data.id.present ? data.id.value : this.id,
      nameId: data.nameId.present ? data.nameId.value : this.nameId,
      language: data.language.present ? data.language.value : this.language,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NameTranslationRecord(')
          ..write('id: $id, ')
          ..write('nameId: $nameId, ')
          ..write('language: $language, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameId, language, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NameTranslationRecord &&
          other.id == this.id &&
          other.nameId == this.nameId &&
          other.language == this.language &&
          other.name == this.name);
}

class NameTranslationTableCompanion
    extends UpdateCompanion<NameTranslationRecord> {
  final Value<int> id;
  final Value<int> nameId;
  final Value<String> language;
  final Value<String> name;
  const NameTranslationTableCompanion({
    this.id = const Value.absent(),
    this.nameId = const Value.absent(),
    this.language = const Value.absent(),
    this.name = const Value.absent(),
  });
  NameTranslationTableCompanion.insert({
    this.id = const Value.absent(),
    required int nameId,
    required String language,
    required String name,
  }) : nameId = Value(nameId),
       language = Value(language),
       name = Value(name);
  static Insertable<NameTranslationRecord> custom({
    Expression<int>? id,
    Expression<int>? nameId,
    Expression<String>? language,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (nameId != null) 'name_id': nameId,
      if (language != null) 'language': language,
      if (name != null) 'name': name,
    });
  }

  NameTranslationTableCompanion copyWith({
    Value<int>? id,
    Value<int>? nameId,
    Value<String>? language,
    Value<String>? name,
  }) {
    return NameTranslationTableCompanion(
      id: id ?? this.id,
      nameId: nameId ?? this.nameId,
      language: language ?? this.language,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (nameId.present) {
      map['name_id'] = Variable<int>(nameId.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NameTranslationTableCompanion(')
          ..write('id: $id, ')
          ..write('nameId: $nameId, ')
          ..write('language: $language, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PrayerTimeTableTable extends PrayerTimeTable
    with TableInfo<$PrayerTimeTableTable, PrayerTimeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerTimeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    '_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES location (_id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fajrMeta = const VerificationMeta('fajr');
  @override
  late final GeneratedColumn<String> fajr = GeneratedColumn<String>(
    'fajr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sunriseMeta = const VerificationMeta(
    'sunrise',
  );
  @override
  late final GeneratedColumn<String> sunrise = GeneratedColumn<String>(
    'sunrise',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dhuhrMeta = const VerificationMeta('dhuhr');
  @override
  late final GeneratedColumn<String> dhuhr = GeneratedColumn<String>(
    'dhuhr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _asrMeta = const VerificationMeta('asr');
  @override
  late final GeneratedColumn<String> asr = GeneratedColumn<String>(
    'asr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maghribMeta = const VerificationMeta(
    'maghrib',
  );
  @override
  late final GeneratedColumn<String> maghrib = GeneratedColumn<String>(
    'maghrib',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ishaMeta = const VerificationMeta('isha');
  @override
  late final GeneratedColumn<String> isha = GeneratedColumn<String>(
    'isha',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    locationId,
    date,
    fajr,
    sunrise,
    dhuhr,
    asr,
    maghrib,
    isha,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_time';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerTimeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('fajr')) {
      context.handle(
        _fajrMeta,
        fajr.isAcceptableOrUnknown(data['fajr']!, _fajrMeta),
      );
    } else if (isInserting) {
      context.missing(_fajrMeta);
    }
    if (data.containsKey('sunrise')) {
      context.handle(
        _sunriseMeta,
        sunrise.isAcceptableOrUnknown(data['sunrise']!, _sunriseMeta),
      );
    } else if (isInserting) {
      context.missing(_sunriseMeta);
    }
    if (data.containsKey('dhuhr')) {
      context.handle(
        _dhuhrMeta,
        dhuhr.isAcceptableOrUnknown(data['dhuhr']!, _dhuhrMeta),
      );
    } else if (isInserting) {
      context.missing(_dhuhrMeta);
    }
    if (data.containsKey('asr')) {
      context.handle(
        _asrMeta,
        asr.isAcceptableOrUnknown(data['asr']!, _asrMeta),
      );
    } else if (isInserting) {
      context.missing(_asrMeta);
    }
    if (data.containsKey('maghrib')) {
      context.handle(
        _maghribMeta,
        maghrib.isAcceptableOrUnknown(data['maghrib']!, _maghribMeta),
      );
    } else if (isInserting) {
      context.missing(_maghribMeta);
    }
    if (data.containsKey('isha')) {
      context.handle(
        _ishaMeta,
        isha.isAcceptableOrUnknown(data['isha']!, _ishaMeta),
      );
    } else if (isInserting) {
      context.missing(_ishaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerTimeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerTimeRecord(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}_id'],
          )!,
      locationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}location_id'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}date'],
          )!,
      fajr:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}fajr'],
          )!,
      sunrise:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sunrise'],
          )!,
      dhuhr:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}dhuhr'],
          )!,
      asr:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}asr'],
          )!,
      maghrib:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}maghrib'],
          )!,
      isha:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}isha'],
          )!,
    );
  }

  @override
  $PrayerTimeTableTable createAlias(String alias) {
    return $PrayerTimeTableTable(attachedDatabase, alias);
  }
}

class PrayerTimeRecord extends DataClass
    implements Insertable<PrayerTimeRecord> {
  final int id;
  final int locationId;
  final String date;
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  const PrayerTimeRecord({
    required this.id,
    required this.locationId,
    required this.date,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<int>(id);
    map['location_id'] = Variable<int>(locationId);
    map['date'] = Variable<String>(date);
    map['fajr'] = Variable<String>(fajr);
    map['sunrise'] = Variable<String>(sunrise);
    map['dhuhr'] = Variable<String>(dhuhr);
    map['asr'] = Variable<String>(asr);
    map['maghrib'] = Variable<String>(maghrib);
    map['isha'] = Variable<String>(isha);
    return map;
  }

  PrayerTimeTableCompanion toCompanion(bool nullToAbsent) {
    return PrayerTimeTableCompanion(
      id: Value(id),
      locationId: Value(locationId),
      date: Value(date),
      fajr: Value(fajr),
      sunrise: Value(sunrise),
      dhuhr: Value(dhuhr),
      asr: Value(asr),
      maghrib: Value(maghrib),
      isha: Value(isha),
    );
  }

  factory PrayerTimeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerTimeRecord(
      id: serializer.fromJson<int>(json['id']),
      locationId: serializer.fromJson<int>(json['locationId']),
      date: serializer.fromJson<String>(json['date']),
      fajr: serializer.fromJson<String>(json['fajr']),
      sunrise: serializer.fromJson<String>(json['sunrise']),
      dhuhr: serializer.fromJson<String>(json['dhuhr']),
      asr: serializer.fromJson<String>(json['asr']),
      maghrib: serializer.fromJson<String>(json['maghrib']),
      isha: serializer.fromJson<String>(json['isha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locationId': serializer.toJson<int>(locationId),
      'date': serializer.toJson<String>(date),
      'fajr': serializer.toJson<String>(fajr),
      'sunrise': serializer.toJson<String>(sunrise),
      'dhuhr': serializer.toJson<String>(dhuhr),
      'asr': serializer.toJson<String>(asr),
      'maghrib': serializer.toJson<String>(maghrib),
      'isha': serializer.toJson<String>(isha),
    };
  }

  PrayerTimeRecord copyWith({
    int? id,
    int? locationId,
    String? date,
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? maghrib,
    String? isha,
  }) => PrayerTimeRecord(
    id: id ?? this.id,
    locationId: locationId ?? this.locationId,
    date: date ?? this.date,
    fajr: fajr ?? this.fajr,
    sunrise: sunrise ?? this.sunrise,
    dhuhr: dhuhr ?? this.dhuhr,
    asr: asr ?? this.asr,
    maghrib: maghrib ?? this.maghrib,
    isha: isha ?? this.isha,
  );
  PrayerTimeRecord copyWithCompanion(PrayerTimeTableCompanion data) {
    return PrayerTimeRecord(
      id: data.id.present ? data.id.value : this.id,
      locationId:
          data.locationId.present ? data.locationId.value : this.locationId,
      date: data.date.present ? data.date.value : this.date,
      fajr: data.fajr.present ? data.fajr.value : this.fajr,
      sunrise: data.sunrise.present ? data.sunrise.value : this.sunrise,
      dhuhr: data.dhuhr.present ? data.dhuhr.value : this.dhuhr,
      asr: data.asr.present ? data.asr.value : this.asr,
      maghrib: data.maghrib.present ? data.maghrib.value : this.maghrib,
      isha: data.isha.present ? data.isha.value : this.isha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTimeRecord(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('date: $date, ')
          ..write('fajr: $fajr, ')
          ..write('sunrise: $sunrise, ')
          ..write('dhuhr: $dhuhr, ')
          ..write('asr: $asr, ')
          ..write('maghrib: $maghrib, ')
          ..write('isha: $isha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    locationId,
    date,
    fajr,
    sunrise,
    dhuhr,
    asr,
    maghrib,
    isha,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerTimeRecord &&
          other.id == this.id &&
          other.locationId == this.locationId &&
          other.date == this.date &&
          other.fajr == this.fajr &&
          other.sunrise == this.sunrise &&
          other.dhuhr == this.dhuhr &&
          other.asr == this.asr &&
          other.maghrib == this.maghrib &&
          other.isha == this.isha);
}

class PrayerTimeTableCompanion extends UpdateCompanion<PrayerTimeRecord> {
  final Value<int> id;
  final Value<int> locationId;
  final Value<String> date;
  final Value<String> fajr;
  final Value<String> sunrise;
  final Value<String> dhuhr;
  final Value<String> asr;
  final Value<String> maghrib;
  final Value<String> isha;
  const PrayerTimeTableCompanion({
    this.id = const Value.absent(),
    this.locationId = const Value.absent(),
    this.date = const Value.absent(),
    this.fajr = const Value.absent(),
    this.sunrise = const Value.absent(),
    this.dhuhr = const Value.absent(),
    this.asr = const Value.absent(),
    this.maghrib = const Value.absent(),
    this.isha = const Value.absent(),
  });
  PrayerTimeTableCompanion.insert({
    this.id = const Value.absent(),
    required int locationId,
    required String date,
    required String fajr,
    required String sunrise,
    required String dhuhr,
    required String asr,
    required String maghrib,
    required String isha,
  }) : locationId = Value(locationId),
       date = Value(date),
       fajr = Value(fajr),
       sunrise = Value(sunrise),
       dhuhr = Value(dhuhr),
       asr = Value(asr),
       maghrib = Value(maghrib),
       isha = Value(isha);
  static Insertable<PrayerTimeRecord> custom({
    Expression<int>? id,
    Expression<int>? locationId,
    Expression<String>? date,
    Expression<String>? fajr,
    Expression<String>? sunrise,
    Expression<String>? dhuhr,
    Expression<String>? asr,
    Expression<String>? maghrib,
    Expression<String>? isha,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (locationId != null) 'location_id': locationId,
      if (date != null) 'date': date,
      if (fajr != null) 'fajr': fajr,
      if (sunrise != null) 'sunrise': sunrise,
      if (dhuhr != null) 'dhuhr': dhuhr,
      if (asr != null) 'asr': asr,
      if (maghrib != null) 'maghrib': maghrib,
      if (isha != null) 'isha': isha,
    });
  }

  PrayerTimeTableCompanion copyWith({
    Value<int>? id,
    Value<int>? locationId,
    Value<String>? date,
    Value<String>? fajr,
    Value<String>? sunrise,
    Value<String>? dhuhr,
    Value<String>? asr,
    Value<String>? maghrib,
    Value<String>? isha,
  }) {
    return PrayerTimeTableCompanion(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      date: date ?? this.date,
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (fajr.present) {
      map['fajr'] = Variable<String>(fajr.value);
    }
    if (sunrise.present) {
      map['sunrise'] = Variable<String>(sunrise.value);
    }
    if (dhuhr.present) {
      map['dhuhr'] = Variable<String>(dhuhr.value);
    }
    if (asr.present) {
      map['asr'] = Variable<String>(asr.value);
    }
    if (maghrib.present) {
      map['maghrib'] = Variable<String>(maghrib.value);
    }
    if (isha.present) {
      map['isha'] = Variable<String>(isha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTimeTableCompanion(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('date: $date, ')
          ..write('fajr: $fajr, ')
          ..write('sunrise: $sunrise, ')
          ..write('dhuhr: $dhuhr, ')
          ..write('asr: $asr, ')
          ..write('maghrib: $maghrib, ')
          ..write('isha: $isha')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AzkarCategoryTableTable azkarCategoryTable =
      $AzkarCategoryTableTable(this);
  late final $AzkarCategoryTranslationTableTable azkarCategoryTranslationTable =
      $AzkarCategoryTranslationTableTable(this);
  late final $AzkarChapterTableTable azkarChapterTable =
      $AzkarChapterTableTable(this);
  late final $AzkarChapterTranslationTableTable azkarChapterTranslationTable =
      $AzkarChapterTranslationTableTable(this);
  late final $AzkarItemTableTable azkarItemTable = $AzkarItemTableTable(this);
  late final $AzkarItemTranslationTableTable azkarItemTranslationTable =
      $AzkarItemTranslationTableTable(this);
  late final $AzkarReferenceTableTable azkarReferenceTable =
      $AzkarReferenceTableTable(this);
  late final $AzkarReferenceTranslationTableTable
  azkarReferenceTranslationTable = $AzkarReferenceTranslationTableTable(this);
  late final $CountryTableTable countryTable = $CountryTableTable(this);
  late final $LocationTableTable locationTable = $LocationTableTable(this);
  late final $NameTableTable nameTable = $NameTableTable(this);
  late final $NameTranslationTableTable nameTranslationTable =
      $NameTranslationTableTable(this);
  late final $PrayerTimeTableTable prayerTimeTable = $PrayerTimeTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    azkarCategoryTable,
    azkarCategoryTranslationTable,
    azkarChapterTable,
    azkarChapterTranslationTable,
    azkarItemTable,
    azkarItemTranslationTable,
    azkarReferenceTable,
    azkarReferenceTranslationTable,
    countryTable,
    locationTable,
    nameTable,
    nameTranslationTable,
    prayerTimeTable,
  ];
}

typedef $$AzkarCategoryTableTableCreateCompanionBuilder =
    AzkarCategoryTableCompanion Function({Value<int> id});
typedef $$AzkarCategoryTableTableUpdateCompanionBuilder =
    AzkarCategoryTableCompanion Function({Value<int> id});

final class $$AzkarCategoryTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarCategoryTableTable,
          AzkarCategoryRecord
        > {
  $$AzkarCategoryTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AzkarCategoryTranslationTableTable,
    List<AzkarCategoryTranslationRecord>
  >
  _azkarCategoryTranslationTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.azkarCategoryTranslationTable,
        aliasName: $_aliasNameGenerator(
          db.azkarCategoryTable.id,
          db.azkarCategoryTranslationTable.categoryId,
        ),
      );

  $$AzkarCategoryTranslationTableTableProcessedTableManager
  get azkarCategoryTranslationTableRefs {
    final manager = $$AzkarCategoryTranslationTableTableTableManager(
      $_db,
      $_db.azkarCategoryTranslationTable,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _azkarCategoryTranslationTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AzkarCategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTableTable> {
  $$AzkarCategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> azkarCategoryTranslationTableRefs(
    Expression<bool> Function(
      $$AzkarCategoryTranslationTableTableFilterComposer f,
    )
    f,
  ) {
    final $$AzkarCategoryTranslationTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarCategoryTranslationTable,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarCategoryTranslationTableTableFilterComposer(
                $db: $db,
                $table: $db.azkarCategoryTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarCategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTableTable> {
  $$AzkarCategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AzkarCategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTableTable> {
  $$AzkarCategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  Expression<T> azkarCategoryTranslationTableRefs<T extends Object>(
    Expression<T> Function(
      $$AzkarCategoryTranslationTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AzkarCategoryTranslationTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarCategoryTranslationTable,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarCategoryTranslationTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarCategoryTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarCategoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarCategoryTableTable,
          AzkarCategoryRecord,
          $$AzkarCategoryTableTableFilterComposer,
          $$AzkarCategoryTableTableOrderingComposer,
          $$AzkarCategoryTableTableAnnotationComposer,
          $$AzkarCategoryTableTableCreateCompanionBuilder,
          $$AzkarCategoryTableTableUpdateCompanionBuilder,
          (AzkarCategoryRecord, $$AzkarCategoryTableTableReferences),
          AzkarCategoryRecord,
          PrefetchHooks Function({bool azkarCategoryTranslationTableRefs})
        > {
  $$AzkarCategoryTableTableTableManager(
    _$AppDatabase db,
    $AzkarCategoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarCategoryTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarCategoryTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarCategoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({Value<int> id = const Value.absent()}) =>
                  AzkarCategoryTableCompanion(id: id),
          createCompanionCallback:
              ({Value<int> id = const Value.absent()}) =>
                  AzkarCategoryTableCompanion.insert(id: id),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarCategoryTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({azkarCategoryTranslationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (azkarCategoryTranslationTableRefs)
                  db.azkarCategoryTranslationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (azkarCategoryTranslationTableRefs)
                    await $_getPrefetchedData<
                      AzkarCategoryRecord,
                      $AzkarCategoryTableTable,
                      AzkarCategoryTranslationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$AzkarCategoryTableTableReferences
                          ._azkarCategoryTranslationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AzkarCategoryTableTableReferences(
                                db,
                                table,
                                p0,
                              ).azkarCategoryTranslationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AzkarCategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarCategoryTableTable,
      AzkarCategoryRecord,
      $$AzkarCategoryTableTableFilterComposer,
      $$AzkarCategoryTableTableOrderingComposer,
      $$AzkarCategoryTableTableAnnotationComposer,
      $$AzkarCategoryTableTableCreateCompanionBuilder,
      $$AzkarCategoryTableTableUpdateCompanionBuilder,
      (AzkarCategoryRecord, $$AzkarCategoryTableTableReferences),
      AzkarCategoryRecord,
      PrefetchHooks Function({bool azkarCategoryTranslationTableRefs})
    >;
typedef $$AzkarCategoryTranslationTableTableCreateCompanionBuilder =
    AzkarCategoryTranslationTableCompanion Function({
      Value<int> id,
      required int categoryId,
      required String language,
      required String categoryName,
    });
typedef $$AzkarCategoryTranslationTableTableUpdateCompanionBuilder =
    AzkarCategoryTranslationTableCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<String> language,
      Value<String> categoryName,
    });

final class $$AzkarCategoryTranslationTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarCategoryTranslationTableTable,
          AzkarCategoryTranslationRecord
        > {
  $$AzkarCategoryTranslationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AzkarCategoryTableTable _categoryIdTable(_$AppDatabase db) =>
      db.azkarCategoryTable.createAlias(
        $_aliasNameGenerator(
          db.azkarCategoryTranslationTable.categoryId,
          db.azkarCategoryTable.id,
        ),
      );

  $$AzkarCategoryTableTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$AzkarCategoryTableTableTableManager(
      $_db,
      $_db.azkarCategoryTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AzkarCategoryTranslationTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTranslationTableTable> {
  $$AzkarCategoryTranslationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  $$AzkarCategoryTableTableFilterComposer get categoryId {
    final $$AzkarCategoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.azkarCategoryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarCategoryTableTableFilterComposer(
            $db: $db,
            $table: $db.azkarCategoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarCategoryTranslationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTranslationTableTable> {
  $$AzkarCategoryTranslationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  $$AzkarCategoryTableTableOrderingComposer get categoryId {
    final $$AzkarCategoryTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.azkarCategoryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarCategoryTableTableOrderingComposer(
            $db: $db,
            $table: $db.azkarCategoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarCategoryTranslationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarCategoryTranslationTableTable> {
  $$AzkarCategoryTranslationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  $$AzkarCategoryTableTableAnnotationComposer get categoryId {
    final $$AzkarCategoryTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.azkarCategoryTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarCategoryTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarCategoryTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AzkarCategoryTranslationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarCategoryTranslationTableTable,
          AzkarCategoryTranslationRecord,
          $$AzkarCategoryTranslationTableTableFilterComposer,
          $$AzkarCategoryTranslationTableTableOrderingComposer,
          $$AzkarCategoryTranslationTableTableAnnotationComposer,
          $$AzkarCategoryTranslationTableTableCreateCompanionBuilder,
          $$AzkarCategoryTranslationTableTableUpdateCompanionBuilder,
          (
            AzkarCategoryTranslationRecord,
            $$AzkarCategoryTranslationTableTableReferences,
          ),
          AzkarCategoryTranslationRecord,
          PrefetchHooks Function({bool categoryId})
        > {
  $$AzkarCategoryTranslationTableTableTableManager(
    _$AppDatabase db,
    $AzkarCategoryTranslationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarCategoryTranslationTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarCategoryTranslationTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarCategoryTranslationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
              }) => AzkarCategoryTranslationTableCompanion(
                id: id,
                categoryId: categoryId,
                language: language,
                categoryName: categoryName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required String language,
                required String categoryName,
              }) => AzkarCategoryTranslationTableCompanion.insert(
                id: id,
                categoryId: categoryId,
                language: language,
                categoryName: categoryName,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarCategoryTranslationTableTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable:
                                $$AzkarCategoryTranslationTableTableReferences
                                    ._categoryIdTable(db),
                            referencedColumn:
                                $$AzkarCategoryTranslationTableTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AzkarCategoryTranslationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarCategoryTranslationTableTable,
      AzkarCategoryTranslationRecord,
      $$AzkarCategoryTranslationTableTableFilterComposer,
      $$AzkarCategoryTranslationTableTableOrderingComposer,
      $$AzkarCategoryTranslationTableTableAnnotationComposer,
      $$AzkarCategoryTranslationTableTableCreateCompanionBuilder,
      $$AzkarCategoryTranslationTableTableUpdateCompanionBuilder,
      (
        AzkarCategoryTranslationRecord,
        $$AzkarCategoryTranslationTableTableReferences,
      ),
      AzkarCategoryTranslationRecord,
      PrefetchHooks Function({bool categoryId})
    >;
typedef $$AzkarChapterTableTableCreateCompanionBuilder =
    AzkarChapterTableCompanion Function({
      Value<int> id,
      required int categoryId,
    });
typedef $$AzkarChapterTableTableUpdateCompanionBuilder =
    AzkarChapterTableCompanion Function({Value<int> id, Value<int> categoryId});

final class $$AzkarChapterTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarChapterTableTable,
          AzkarChapterRecord
        > {
  $$AzkarChapterTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AzkarChapterTranslationTableTable,
    List<AzkarChapterTranslationRecord>
  >
  _azkarChapterTranslationTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.azkarChapterTranslationTable,
        aliasName: $_aliasNameGenerator(
          db.azkarChapterTable.id,
          db.azkarChapterTranslationTable.chapterId,
        ),
      );

  $$AzkarChapterTranslationTableTableProcessedTableManager
  get azkarChapterTranslationTableRefs {
    final manager = $$AzkarChapterTranslationTableTableTableManager(
      $_db,
      $_db.azkarChapterTranslationTable,
    ).filter((f) => f.chapterId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _azkarChapterTranslationTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AzkarChapterTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarChapterTableTable> {
  $$AzkarChapterTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> azkarChapterTranslationTableRefs(
    Expression<bool> Function(
      $$AzkarChapterTranslationTableTableFilterComposer f,
    )
    f,
  ) {
    final $$AzkarChapterTranslationTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarChapterTranslationTable,
          getReferencedColumn: (t) => t.chapterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarChapterTranslationTableTableFilterComposer(
                $db: $db,
                $table: $db.azkarChapterTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarChapterTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarChapterTableTable> {
  $$AzkarChapterTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AzkarChapterTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarChapterTableTable> {
  $$AzkarChapterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  Expression<T> azkarChapterTranslationTableRefs<T extends Object>(
    Expression<T> Function(
      $$AzkarChapterTranslationTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AzkarChapterTranslationTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarChapterTranslationTable,
          getReferencedColumn: (t) => t.chapterId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarChapterTranslationTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarChapterTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarChapterTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarChapterTableTable,
          AzkarChapterRecord,
          $$AzkarChapterTableTableFilterComposer,
          $$AzkarChapterTableTableOrderingComposer,
          $$AzkarChapterTableTableAnnotationComposer,
          $$AzkarChapterTableTableCreateCompanionBuilder,
          $$AzkarChapterTableTableUpdateCompanionBuilder,
          (AzkarChapterRecord, $$AzkarChapterTableTableReferences),
          AzkarChapterRecord,
          PrefetchHooks Function({bool azkarChapterTranslationTableRefs})
        > {
  $$AzkarChapterTableTableTableManager(
    _$AppDatabase db,
    $AzkarChapterTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarChapterTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarChapterTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarChapterTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
              }) => AzkarChapterTableCompanion(id: id, categoryId: categoryId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
              }) => AzkarChapterTableCompanion.insert(
                id: id,
                categoryId: categoryId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarChapterTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({azkarChapterTranslationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (azkarChapterTranslationTableRefs)
                  db.azkarChapterTranslationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (azkarChapterTranslationTableRefs)
                    await $_getPrefetchedData<
                      AzkarChapterRecord,
                      $AzkarChapterTableTable,
                      AzkarChapterTranslationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$AzkarChapterTableTableReferences
                          ._azkarChapterTranslationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AzkarChapterTableTableReferences(
                                db,
                                table,
                                p0,
                              ).azkarChapterTranslationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.chapterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AzkarChapterTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarChapterTableTable,
      AzkarChapterRecord,
      $$AzkarChapterTableTableFilterComposer,
      $$AzkarChapterTableTableOrderingComposer,
      $$AzkarChapterTableTableAnnotationComposer,
      $$AzkarChapterTableTableCreateCompanionBuilder,
      $$AzkarChapterTableTableUpdateCompanionBuilder,
      (AzkarChapterRecord, $$AzkarChapterTableTableReferences),
      AzkarChapterRecord,
      PrefetchHooks Function({bool azkarChapterTranslationTableRefs})
    >;
typedef $$AzkarChapterTranslationTableTableCreateCompanionBuilder =
    AzkarChapterTranslationTableCompanion Function({
      Value<int> id,
      required int chapterId,
      required String language,
      required String chapterName,
    });
typedef $$AzkarChapterTranslationTableTableUpdateCompanionBuilder =
    AzkarChapterTranslationTableCompanion Function({
      Value<int> id,
      Value<int> chapterId,
      Value<String> language,
      Value<String> chapterName,
    });

final class $$AzkarChapterTranslationTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarChapterTranslationTableTable,
          AzkarChapterTranslationRecord
        > {
  $$AzkarChapterTranslationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AzkarChapterTableTable _chapterIdTable(_$AppDatabase db) =>
      db.azkarChapterTable.createAlias(
        $_aliasNameGenerator(
          db.azkarChapterTranslationTable.chapterId,
          db.azkarChapterTable.id,
        ),
      );

  $$AzkarChapterTableTableProcessedTableManager get chapterId {
    final $_column = $_itemColumn<int>('chapter_id')!;

    final manager = $$AzkarChapterTableTableTableManager(
      $_db,
      $_db.azkarChapterTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chapterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AzkarChapterTranslationTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarChapterTranslationTableTable> {
  $$AzkarChapterTranslationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnFilters(column),
  );

  $$AzkarChapterTableTableFilterComposer get chapterId {
    final $$AzkarChapterTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.azkarChapterTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarChapterTableTableFilterComposer(
            $db: $db,
            $table: $db.azkarChapterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarChapterTranslationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarChapterTranslationTableTable> {
  $$AzkarChapterTranslationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => ColumnOrderings(column),
  );

  $$AzkarChapterTableTableOrderingComposer get chapterId {
    final $$AzkarChapterTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.chapterId,
      referencedTable: $db.azkarChapterTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarChapterTableTableOrderingComposer(
            $db: $db,
            $table: $db.azkarChapterTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarChapterTranslationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarChapterTranslationTableTable> {
  $$AzkarChapterTranslationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get chapterName => $composableBuilder(
    column: $table.chapterName,
    builder: (column) => column,
  );

  $$AzkarChapterTableTableAnnotationComposer get chapterId {
    final $$AzkarChapterTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.chapterId,
          referencedTable: $db.azkarChapterTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarChapterTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarChapterTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AzkarChapterTranslationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarChapterTranslationTableTable,
          AzkarChapterTranslationRecord,
          $$AzkarChapterTranslationTableTableFilterComposer,
          $$AzkarChapterTranslationTableTableOrderingComposer,
          $$AzkarChapterTranslationTableTableAnnotationComposer,
          $$AzkarChapterTranslationTableTableCreateCompanionBuilder,
          $$AzkarChapterTranslationTableTableUpdateCompanionBuilder,
          (
            AzkarChapterTranslationRecord,
            $$AzkarChapterTranslationTableTableReferences,
          ),
          AzkarChapterTranslationRecord,
          PrefetchHooks Function({bool chapterId})
        > {
  $$AzkarChapterTranslationTableTableTableManager(
    _$AppDatabase db,
    $AzkarChapterTranslationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarChapterTranslationTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarChapterTranslationTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarChapterTranslationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> chapterId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> chapterName = const Value.absent(),
              }) => AzkarChapterTranslationTableCompanion(
                id: id,
                chapterId: chapterId,
                language: language,
                chapterName: chapterName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int chapterId,
                required String language,
                required String chapterName,
              }) => AzkarChapterTranslationTableCompanion.insert(
                id: id,
                chapterId: chapterId,
                language: language,
                chapterName: chapterName,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarChapterTranslationTableTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({chapterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (chapterId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.chapterId,
                            referencedTable:
                                $$AzkarChapterTranslationTableTableReferences
                                    ._chapterIdTable(db),
                            referencedColumn:
                                $$AzkarChapterTranslationTableTableReferences
                                    ._chapterIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AzkarChapterTranslationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarChapterTranslationTableTable,
      AzkarChapterTranslationRecord,
      $$AzkarChapterTranslationTableTableFilterComposer,
      $$AzkarChapterTranslationTableTableOrderingComposer,
      $$AzkarChapterTranslationTableTableAnnotationComposer,
      $$AzkarChapterTranslationTableTableCreateCompanionBuilder,
      $$AzkarChapterTranslationTableTableUpdateCompanionBuilder,
      (
        AzkarChapterTranslationRecord,
        $$AzkarChapterTranslationTableTableReferences,
      ),
      AzkarChapterTranslationRecord,
      PrefetchHooks Function({bool chapterId})
    >;
typedef $$AzkarItemTableTableCreateCompanionBuilder =
    AzkarItemTableCompanion Function({
      Value<int> id,
      required int chapterId,
      required String item,
    });
typedef $$AzkarItemTableTableUpdateCompanionBuilder =
    AzkarItemTableCompanion Function({
      Value<int> id,
      Value<int> chapterId,
      Value<String> item,
    });

final class $$AzkarItemTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $AzkarItemTableTable, AzkarItemRecord> {
  $$AzkarItemTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AzkarItemTranslationTableTable,
    List<AzkarItemTranslationRecord>
  >
  _azkarItemTranslationTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.azkarItemTranslationTable,
        aliasName: $_aliasNameGenerator(
          db.azkarItemTable.id,
          db.azkarItemTranslationTable.itemId,
        ),
      );

  $$AzkarItemTranslationTableTableProcessedTableManager
  get azkarItemTranslationTableRefs {
    final manager = $$AzkarItemTranslationTableTableTableManager(
      $_db,
      $_db.azkarItemTranslationTable,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _azkarItemTranslationTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AzkarItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarItemTableTable> {
  $$AzkarItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get item => $composableBuilder(
    column: $table.item,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> azkarItemTranslationTableRefs(
    Expression<bool> Function($$AzkarItemTranslationTableTableFilterComposer f)
    f,
  ) {
    final $$AzkarItemTranslationTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarItemTranslationTable,
          getReferencedColumn: (t) => t.itemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarItemTranslationTableTableFilterComposer(
                $db: $db,
                $table: $db.azkarItemTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarItemTableTable> {
  $$AzkarItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chapterId => $composableBuilder(
    column: $table.chapterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get item => $composableBuilder(
    column: $table.item,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AzkarItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarItemTableTable> {
  $$AzkarItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<String> get item =>
      $composableBuilder(column: $table.item, builder: (column) => column);

  Expression<T> azkarItemTranslationTableRefs<T extends Object>(
    Expression<T> Function($$AzkarItemTranslationTableTableAnnotationComposer a)
    f,
  ) {
    final $$AzkarItemTranslationTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarItemTranslationTable,
          getReferencedColumn: (t) => t.itemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarItemTranslationTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarItemTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarItemTableTable,
          AzkarItemRecord,
          $$AzkarItemTableTableFilterComposer,
          $$AzkarItemTableTableOrderingComposer,
          $$AzkarItemTableTableAnnotationComposer,
          $$AzkarItemTableTableCreateCompanionBuilder,
          $$AzkarItemTableTableUpdateCompanionBuilder,
          (AzkarItemRecord, $$AzkarItemTableTableReferences),
          AzkarItemRecord,
          PrefetchHooks Function({bool azkarItemTranslationTableRefs})
        > {
  $$AzkarItemTableTableTableManager(
    _$AppDatabase db,
    $AzkarItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$AzkarItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AzkarItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> chapterId = const Value.absent(),
                Value<String> item = const Value.absent(),
              }) => AzkarItemTableCompanion(
                id: id,
                chapterId: chapterId,
                item: item,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int chapterId,
                required String item,
              }) => AzkarItemTableCompanion.insert(
                id: id,
                chapterId: chapterId,
                item: item,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarItemTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({azkarItemTranslationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (azkarItemTranslationTableRefs) db.azkarItemTranslationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (azkarItemTranslationTableRefs)
                    await $_getPrefetchedData<
                      AzkarItemRecord,
                      $AzkarItemTableTable,
                      AzkarItemTranslationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$AzkarItemTableTableReferences
                          ._azkarItemTranslationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AzkarItemTableTableReferences(
                                db,
                                table,
                                p0,
                              ).azkarItemTranslationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.itemId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AzkarItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarItemTableTable,
      AzkarItemRecord,
      $$AzkarItemTableTableFilterComposer,
      $$AzkarItemTableTableOrderingComposer,
      $$AzkarItemTableTableAnnotationComposer,
      $$AzkarItemTableTableCreateCompanionBuilder,
      $$AzkarItemTableTableUpdateCompanionBuilder,
      (AzkarItemRecord, $$AzkarItemTableTableReferences),
      AzkarItemRecord,
      PrefetchHooks Function({bool azkarItemTranslationTableRefs})
    >;
typedef $$AzkarItemTranslationTableTableCreateCompanionBuilder =
    AzkarItemTranslationTableCompanion Function({
      Value<int> id,
      required int itemId,
      required String language,
      required String itemTranslation,
    });
typedef $$AzkarItemTranslationTableTableUpdateCompanionBuilder =
    AzkarItemTranslationTableCompanion Function({
      Value<int> id,
      Value<int> itemId,
      Value<String> language,
      Value<String> itemTranslation,
    });

final class $$AzkarItemTranslationTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarItemTranslationTableTable,
          AzkarItemTranslationRecord
        > {
  $$AzkarItemTranslationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AzkarItemTableTable _itemIdTable(_$AppDatabase db) =>
      db.azkarItemTable.createAlias(
        $_aliasNameGenerator(
          db.azkarItemTranslationTable.itemId,
          db.azkarItemTable.id,
        ),
      );

  $$AzkarItemTableTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$AzkarItemTableTableTableManager(
      $_db,
      $_db.azkarItemTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AzkarItemTranslationTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarItemTranslationTableTable> {
  $$AzkarItemTranslationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemTranslation => $composableBuilder(
    column: $table.itemTranslation,
    builder: (column) => ColumnFilters(column),
  );

  $$AzkarItemTableTableFilterComposer get itemId {
    final $$AzkarItemTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.azkarItemTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarItemTableTableFilterComposer(
            $db: $db,
            $table: $db.azkarItemTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarItemTranslationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarItemTranslationTableTable> {
  $$AzkarItemTranslationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemTranslation => $composableBuilder(
    column: $table.itemTranslation,
    builder: (column) => ColumnOrderings(column),
  );

  $$AzkarItemTableTableOrderingComposer get itemId {
    final $$AzkarItemTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.azkarItemTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarItemTableTableOrderingComposer(
            $db: $db,
            $table: $db.azkarItemTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarItemTranslationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarItemTranslationTableTable> {
  $$AzkarItemTranslationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get itemTranslation => $composableBuilder(
    column: $table.itemTranslation,
    builder: (column) => column,
  );

  $$AzkarItemTableTableAnnotationComposer get itemId {
    final $$AzkarItemTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.azkarItemTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarItemTableTableAnnotationComposer(
            $db: $db,
            $table: $db.azkarItemTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarItemTranslationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarItemTranslationTableTable,
          AzkarItemTranslationRecord,
          $$AzkarItemTranslationTableTableFilterComposer,
          $$AzkarItemTranslationTableTableOrderingComposer,
          $$AzkarItemTranslationTableTableAnnotationComposer,
          $$AzkarItemTranslationTableTableCreateCompanionBuilder,
          $$AzkarItemTranslationTableTableUpdateCompanionBuilder,
          (
            AzkarItemTranslationRecord,
            $$AzkarItemTranslationTableTableReferences,
          ),
          AzkarItemTranslationRecord,
          PrefetchHooks Function({bool itemId})
        > {
  $$AzkarItemTranslationTableTableTableManager(
    _$AppDatabase db,
    $AzkarItemTranslationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarItemTranslationTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarItemTranslationTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarItemTranslationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> itemTranslation = const Value.absent(),
              }) => AzkarItemTranslationTableCompanion(
                id: id,
                itemId: itemId,
                language: language,
                itemTranslation: itemTranslation,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                required String language,
                required String itemTranslation,
              }) => AzkarItemTranslationTableCompanion.insert(
                id: id,
                itemId: itemId,
                language: language,
                itemTranslation: itemTranslation,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarItemTranslationTableTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (itemId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.itemId,
                            referencedTable:
                                $$AzkarItemTranslationTableTableReferences
                                    ._itemIdTable(db),
                            referencedColumn:
                                $$AzkarItemTranslationTableTableReferences
                                    ._itemIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AzkarItemTranslationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarItemTranslationTableTable,
      AzkarItemTranslationRecord,
      $$AzkarItemTranslationTableTableFilterComposer,
      $$AzkarItemTranslationTableTableOrderingComposer,
      $$AzkarItemTranslationTableTableAnnotationComposer,
      $$AzkarItemTranslationTableTableCreateCompanionBuilder,
      $$AzkarItemTranslationTableTableUpdateCompanionBuilder,
      (AzkarItemTranslationRecord, $$AzkarItemTranslationTableTableReferences),
      AzkarItemTranslationRecord,
      PrefetchHooks Function({bool itemId})
    >;
typedef $$AzkarReferenceTableTableCreateCompanionBuilder =
    AzkarReferenceTableCompanion Function({Value<int> id, required int itemId});
typedef $$AzkarReferenceTableTableUpdateCompanionBuilder =
    AzkarReferenceTableCompanion Function({Value<int> id, Value<int> itemId});

final class $$AzkarReferenceTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarReferenceTableTable,
          AzkarReferenceRecord
        > {
  $$AzkarReferenceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $AzkarReferenceTranslationTableTable,
    List<AzkarReferenceTranslationRecord>
  >
  _azkarReferenceTranslationTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.azkarReferenceTranslationTable,
        aliasName: $_aliasNameGenerator(
          db.azkarReferenceTable.id,
          db.azkarReferenceTranslationTable.referenceId,
        ),
      );

  $$AzkarReferenceTranslationTableTableProcessedTableManager
  get azkarReferenceTranslationTableRefs {
    final manager = $$AzkarReferenceTranslationTableTableTableManager(
      $_db,
      $_db.azkarReferenceTranslationTable,
    ).filter((f) => f.referenceId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _azkarReferenceTranslationTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AzkarReferenceTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTableTable> {
  $$AzkarReferenceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> azkarReferenceTranslationTableRefs(
    Expression<bool> Function(
      $$AzkarReferenceTranslationTableTableFilterComposer f,
    )
    f,
  ) {
    final $$AzkarReferenceTranslationTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarReferenceTranslationTable,
          getReferencedColumn: (t) => t.referenceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarReferenceTranslationTableTableFilterComposer(
                $db: $db,
                $table: $db.azkarReferenceTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarReferenceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTableTable> {
  $$AzkarReferenceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AzkarReferenceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTableTable> {
  $$AzkarReferenceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  Expression<T> azkarReferenceTranslationTableRefs<T extends Object>(
    Expression<T> Function(
      $$AzkarReferenceTranslationTableTableAnnotationComposer a,
    )
    f,
  ) {
    final $$AzkarReferenceTranslationTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.azkarReferenceTranslationTable,
          getReferencedColumn: (t) => t.referenceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarReferenceTranslationTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarReferenceTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AzkarReferenceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarReferenceTableTable,
          AzkarReferenceRecord,
          $$AzkarReferenceTableTableFilterComposer,
          $$AzkarReferenceTableTableOrderingComposer,
          $$AzkarReferenceTableTableAnnotationComposer,
          $$AzkarReferenceTableTableCreateCompanionBuilder,
          $$AzkarReferenceTableTableUpdateCompanionBuilder,
          (AzkarReferenceRecord, $$AzkarReferenceTableTableReferences),
          AzkarReferenceRecord,
          PrefetchHooks Function({bool azkarReferenceTranslationTableRefs})
        > {
  $$AzkarReferenceTableTableTableManager(
    _$AppDatabase db,
    $AzkarReferenceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarReferenceTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarReferenceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarReferenceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
              }) => AzkarReferenceTableCompanion(id: id, itemId: itemId),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required int itemId}) =>
                  AzkarReferenceTableCompanion.insert(id: id, itemId: itemId),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarReferenceTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            azkarReferenceTranslationTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (azkarReferenceTranslationTableRefs)
                  db.azkarReferenceTranslationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (azkarReferenceTranslationTableRefs)
                    await $_getPrefetchedData<
                      AzkarReferenceRecord,
                      $AzkarReferenceTableTable,
                      AzkarReferenceTranslationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$AzkarReferenceTableTableReferences
                          ._azkarReferenceTranslationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AzkarReferenceTableTableReferences(
                                db,
                                table,
                                p0,
                              ).azkarReferenceTranslationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.referenceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AzkarReferenceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarReferenceTableTable,
      AzkarReferenceRecord,
      $$AzkarReferenceTableTableFilterComposer,
      $$AzkarReferenceTableTableOrderingComposer,
      $$AzkarReferenceTableTableAnnotationComposer,
      $$AzkarReferenceTableTableCreateCompanionBuilder,
      $$AzkarReferenceTableTableUpdateCompanionBuilder,
      (AzkarReferenceRecord, $$AzkarReferenceTableTableReferences),
      AzkarReferenceRecord,
      PrefetchHooks Function({bool azkarReferenceTranslationTableRefs})
    >;
typedef $$AzkarReferenceTranslationTableTableCreateCompanionBuilder =
    AzkarReferenceTranslationTableCompanion Function({
      Value<int> id,
      required int referenceId,
      required String language,
      required String reference,
    });
typedef $$AzkarReferenceTranslationTableTableUpdateCompanionBuilder =
    AzkarReferenceTranslationTableCompanion Function({
      Value<int> id,
      Value<int> referenceId,
      Value<String> language,
      Value<String> reference,
    });

final class $$AzkarReferenceTranslationTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AzkarReferenceTranslationTableTable,
          AzkarReferenceTranslationRecord
        > {
  $$AzkarReferenceTranslationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AzkarReferenceTableTable _referenceIdTable(_$AppDatabase db) =>
      db.azkarReferenceTable.createAlias(
        $_aliasNameGenerator(
          db.azkarReferenceTranslationTable.referenceId,
          db.azkarReferenceTable.id,
        ),
      );

  $$AzkarReferenceTableTableProcessedTableManager get referenceId {
    final $_column = $_itemColumn<int>('reference_id')!;

    final manager = $$AzkarReferenceTableTableTableManager(
      $_db,
      $_db.azkarReferenceTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_referenceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AzkarReferenceTranslationTableTableFilterComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTranslationTableTable> {
  $$AzkarReferenceTranslationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  $$AzkarReferenceTableTableFilterComposer get referenceId {
    final $$AzkarReferenceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.referenceId,
      referencedTable: $db.azkarReferenceTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AzkarReferenceTableTableFilterComposer(
            $db: $db,
            $table: $db.azkarReferenceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AzkarReferenceTranslationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTranslationTableTable> {
  $$AzkarReferenceTranslationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  $$AzkarReferenceTableTableOrderingComposer get referenceId {
    final $$AzkarReferenceTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.referenceId,
          referencedTable: $db.azkarReferenceTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarReferenceTableTableOrderingComposer(
                $db: $db,
                $table: $db.azkarReferenceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AzkarReferenceTranslationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AzkarReferenceTranslationTableTable> {
  $$AzkarReferenceTranslationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  $$AzkarReferenceTableTableAnnotationComposer get referenceId {
    final $$AzkarReferenceTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.referenceId,
          referencedTable: $db.azkarReferenceTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AzkarReferenceTableTableAnnotationComposer(
                $db: $db,
                $table: $db.azkarReferenceTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AzkarReferenceTranslationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AzkarReferenceTranslationTableTable,
          AzkarReferenceTranslationRecord,
          $$AzkarReferenceTranslationTableTableFilterComposer,
          $$AzkarReferenceTranslationTableTableOrderingComposer,
          $$AzkarReferenceTranslationTableTableAnnotationComposer,
          $$AzkarReferenceTranslationTableTableCreateCompanionBuilder,
          $$AzkarReferenceTranslationTableTableUpdateCompanionBuilder,
          (
            AzkarReferenceTranslationRecord,
            $$AzkarReferenceTranslationTableTableReferences,
          ),
          AzkarReferenceTranslationRecord,
          PrefetchHooks Function({bool referenceId})
        > {
  $$AzkarReferenceTranslationTableTableTableManager(
    _$AppDatabase db,
    $AzkarReferenceTranslationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AzkarReferenceTranslationTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$AzkarReferenceTranslationTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AzkarReferenceTranslationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> referenceId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> reference = const Value.absent(),
              }) => AzkarReferenceTranslationTableCompanion(
                id: id,
                referenceId: referenceId,
                language: language,
                reference: reference,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int referenceId,
                required String language,
                required String reference,
              }) => AzkarReferenceTranslationTableCompanion.insert(
                id: id,
                referenceId: referenceId,
                language: language,
                reference: reference,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AzkarReferenceTranslationTableTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({referenceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (referenceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.referenceId,
                            referencedTable:
                                $$AzkarReferenceTranslationTableTableReferences
                                    ._referenceIdTable(db),
                            referencedColumn:
                                $$AzkarReferenceTranslationTableTableReferences
                                    ._referenceIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AzkarReferenceTranslationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AzkarReferenceTranslationTableTable,
      AzkarReferenceTranslationRecord,
      $$AzkarReferenceTranslationTableTableFilterComposer,
      $$AzkarReferenceTranslationTableTableOrderingComposer,
      $$AzkarReferenceTranslationTableTableAnnotationComposer,
      $$AzkarReferenceTranslationTableTableCreateCompanionBuilder,
      $$AzkarReferenceTranslationTableTableUpdateCompanionBuilder,
      (
        AzkarReferenceTranslationRecord,
        $$AzkarReferenceTranslationTableTableReferences,
      ),
      AzkarReferenceTranslationRecord,
      PrefetchHooks Function({bool referenceId})
    >;
typedef $$CountryTableTableCreateCompanionBuilder =
    CountryTableCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String continent,
      required String language,
    });
typedef $$CountryTableTableUpdateCompanionBuilder =
    CountryTableCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> continent,
      Value<String> language,
    });

final class $$CountryTableTableReferences
    extends BaseReferences<_$AppDatabase, $CountryTableTable, CountryRecord> {
  $$CountryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LocationTableTable, List<LocationRecord>>
  _locationTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.locationTable,
    aliasName: $_aliasNameGenerator(
      db.countryTable.id,
      db.locationTable.countryId,
    ),
  );

  $$LocationTableTableProcessedTableManager get locationTableRefs {
    final manager = $$LocationTableTableTableManager(
      $_db,
      $_db.locationTable,
    ).filter((f) => f.countryId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(_locationTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CountryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get continent => $composableBuilder(
    column: $table.continent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> locationTableRefs(
    Expression<bool> Function($$LocationTableTableFilterComposer f) f,
  ) {
    final $$LocationTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get continent => $composableBuilder(
    column: $table.continent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountryTableTable> {
  $$CountryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get continent =>
      $composableBuilder(column: $table.continent, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  Expression<T> locationTableRefs<T extends Object>(
    Expression<T> Function($$LocationTableTableAnnotationComposer a) f,
  ) {
    final $$LocationTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableAnnotationComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountryTableTable,
          CountryRecord,
          $$CountryTableTableFilterComposer,
          $$CountryTableTableOrderingComposer,
          $$CountryTableTableAnnotationComposer,
          $$CountryTableTableCreateCompanionBuilder,
          $$CountryTableTableUpdateCompanionBuilder,
          (CountryRecord, $$CountryTableTableReferences),
          CountryRecord,
          PrefetchHooks Function({bool locationTableRefs})
        > {
  $$CountryTableTableTableManager(_$AppDatabase db, $CountryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CountryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CountryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$CountryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> continent = const Value.absent(),
                Value<String> language = const Value.absent(),
              }) => CountryTableCompanion(
                id: id,
                code: code,
                name: name,
                continent: continent,
                language: language,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String continent,
                required String language,
              }) => CountryTableCompanion.insert(
                id: id,
                code: code,
                name: name,
                continent: continent,
                language: language,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CountryTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({locationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (locationTableRefs) db.locationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (locationTableRefs)
                    await $_getPrefetchedData<
                      CountryRecord,
                      $CountryTableTable,
                      LocationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$CountryTableTableReferences
                          ._locationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CountryTableTableReferences(
                                db,
                                table,
                                p0,
                              ).locationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.countryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CountryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountryTableTable,
      CountryRecord,
      $$CountryTableTableFilterComposer,
      $$CountryTableTableOrderingComposer,
      $$CountryTableTableAnnotationComposer,
      $$CountryTableTableCreateCompanionBuilder,
      $$CountryTableTableUpdateCompanionBuilder,
      (CountryRecord, $$CountryTableTableReferences),
      CountryRecord,
      PrefetchHooks Function({bool locationTableRefs})
    >;
typedef $$LocationTableTableCreateCompanionBuilder =
    LocationTableCompanion Function({
      Value<int> id,
      required int countryId,
      required String name,
      required double latitude,
      required double longitude,
      Value<bool> hasFixedPrayerTime,
      Value<int?> prayerDependentId,
    });
typedef $$LocationTableTableUpdateCompanionBuilder =
    LocationTableCompanion Function({
      Value<int> id,
      Value<int> countryId,
      Value<String> name,
      Value<double> latitude,
      Value<double> longitude,
      Value<bool> hasFixedPrayerTime,
      Value<int?> prayerDependentId,
    });

final class $$LocationTableTableReferences
    extends BaseReferences<_$AppDatabase, $LocationTableTable, LocationRecord> {
  $$LocationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CountryTableTable _countryIdTable(_$AppDatabase db) =>
      db.countryTable.createAlias(
        $_aliasNameGenerator(db.locationTable.countryId, db.countryTable.id),
      );

  $$CountryTableTableProcessedTableManager get countryId {
    final $_column = $_itemColumn<int>('country_id')!;

    final manager = $$CountryTableTableTableManager(
      $_db,
      $_db.countryTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LocationTableTable _prayerDependentIdTable(_$AppDatabase db) =>
      db.locationTable.createAlias(
        $_aliasNameGenerator(
          db.locationTable.prayerDependentId,
          db.locationTable.id,
        ),
      );

  $$LocationTableTableProcessedTableManager? get prayerDependentId {
    final $_column = $_itemColumn<int>('prayer_dependent_id');
    if ($_column == null) return null;
    final manager = $$LocationTableTableTableManager(
      $_db,
      $_db.locationTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_prayerDependentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PrayerTimeTableTable, List<PrayerTimeRecord>>
  _prayerTimeTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.prayerTimeTable,
    aliasName: $_aliasNameGenerator(
      db.locationTable.id,
      db.prayerTimeTable.locationId,
    ),
  );

  $$PrayerTimeTableTableProcessedTableManager get prayerTimeTableRefs {
    final manager = $$PrayerTimeTableTableTableManager(
      $_db,
      $_db.prayerTimeTable,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _prayerTimeTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationTableTableFilterComposer
    extends Composer<_$AppDatabase, $LocationTableTable> {
  $$LocationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasFixedPrayerTime => $composableBuilder(
    column: $table.hasFixedPrayerTime,
    builder: (column) => ColumnFilters(column),
  );

  $$CountryTableTableFilterComposer get countryId {
    final $$CountryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableTableFilterComposer(
            $db: $db,
            $table: $db.countryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationTableTableFilterComposer get prayerDependentId {
    final $$LocationTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerDependentId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> prayerTimeTableRefs(
    Expression<bool> Function($$PrayerTimeTableTableFilterComposer f) f,
  ) {
    final $$PrayerTimeTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prayerTimeTable,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTimeTableTableFilterComposer(
            $db: $db,
            $table: $db.prayerTimeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationTableTable> {
  $$LocationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasFixedPrayerTime => $composableBuilder(
    column: $table.hasFixedPrayerTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$CountryTableTableOrderingComposer get countryId {
    final $$CountryTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableTableOrderingComposer(
            $db: $db,
            $table: $db.countryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationTableTableOrderingComposer get prayerDependentId {
    final $$LocationTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerDependentId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableOrderingComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationTableTable> {
  $$LocationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<bool> get hasFixedPrayerTime => $composableBuilder(
    column: $table.hasFixedPrayerTime,
    builder: (column) => column,
  );

  $$CountryTableTableAnnotationComposer get countryId {
    final $$CountryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.countryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.countryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LocationTableTableAnnotationComposer get prayerDependentId {
    final $$LocationTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerDependentId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableAnnotationComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> prayerTimeTableRefs<T extends Object>(
    Expression<T> Function($$PrayerTimeTableTableAnnotationComposer a) f,
  ) {
    final $$PrayerTimeTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prayerTimeTable,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTimeTableTableAnnotationComposer(
            $db: $db,
            $table: $db.prayerTimeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationTableTable,
          LocationRecord,
          $$LocationTableTableFilterComposer,
          $$LocationTableTableOrderingComposer,
          $$LocationTableTableAnnotationComposer,
          $$LocationTableTableCreateCompanionBuilder,
          $$LocationTableTableUpdateCompanionBuilder,
          (LocationRecord, $$LocationTableTableReferences),
          LocationRecord,
          PrefetchHooks Function({
            bool countryId,
            bool prayerDependentId,
            bool prayerTimeTableRefs,
          })
        > {
  $$LocationTableTableTableManager(_$AppDatabase db, $LocationTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LocationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$LocationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LocationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> countryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<bool> hasFixedPrayerTime = const Value.absent(),
                Value<int?> prayerDependentId = const Value.absent(),
              }) => LocationTableCompanion(
                id: id,
                countryId: countryId,
                name: name,
                latitude: latitude,
                longitude: longitude,
                hasFixedPrayerTime: hasFixedPrayerTime,
                prayerDependentId: prayerDependentId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int countryId,
                required String name,
                required double latitude,
                required double longitude,
                Value<bool> hasFixedPrayerTime = const Value.absent(),
                Value<int?> prayerDependentId = const Value.absent(),
              }) => LocationTableCompanion.insert(
                id: id,
                countryId: countryId,
                name: name,
                latitude: latitude,
                longitude: longitude,
                hasFixedPrayerTime: hasFixedPrayerTime,
                prayerDependentId: prayerDependentId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$LocationTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            countryId = false,
            prayerDependentId = false,
            prayerTimeTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (prayerTimeTableRefs) db.prayerTimeTable,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (countryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.countryId,
                            referencedTable: $$LocationTableTableReferences
                                ._countryIdTable(db),
                            referencedColumn:
                                $$LocationTableTableReferences
                                    ._countryIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (prayerDependentId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.prayerDependentId,
                            referencedTable: $$LocationTableTableReferences
                                ._prayerDependentIdTable(db),
                            referencedColumn:
                                $$LocationTableTableReferences
                                    ._prayerDependentIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (prayerTimeTableRefs)
                    await $_getPrefetchedData<
                      LocationRecord,
                      $LocationTableTable,
                      PrayerTimeRecord
                    >(
                      currentTable: table,
                      referencedTable: $$LocationTableTableReferences
                          ._prayerTimeTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$LocationTableTableReferences(
                                db,
                                table,
                                p0,
                              ).prayerTimeTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.locationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationTableTable,
      LocationRecord,
      $$LocationTableTableFilterComposer,
      $$LocationTableTableOrderingComposer,
      $$LocationTableTableAnnotationComposer,
      $$LocationTableTableCreateCompanionBuilder,
      $$LocationTableTableUpdateCompanionBuilder,
      (LocationRecord, $$LocationTableTableReferences),
      LocationRecord,
      PrefetchHooks Function({
        bool countryId,
        bool prayerDependentId,
        bool prayerTimeTableRefs,
      })
    >;
typedef $$NameTableTableCreateCompanionBuilder =
    NameTableCompanion Function({Value<int> id, required String name});
typedef $$NameTableTableUpdateCompanionBuilder =
    NameTableCompanion Function({Value<int> id, Value<String> name});

final class $$NameTableTableReferences
    extends BaseReferences<_$AppDatabase, $NameTableTable, NameRecord> {
  $$NameTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $NameTranslationTableTable,
    List<NameTranslationRecord>
  >
  _nameTranslationTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.nameTranslationTable,
        aliasName: $_aliasNameGenerator(
          db.nameTable.id,
          db.nameTranslationTable.nameId,
        ),
      );

  $$NameTranslationTableTableProcessedTableManager
  get nameTranslationTableRefs {
    final manager = $$NameTranslationTableTableTableManager(
      $_db,
      $_db.nameTranslationTable,
    ).filter((f) => f.nameId.id.sqlEquals($_itemColumn<int>('_id')!));

    final cache = $_typedResult.readTableOrNull(
      _nameTranslationTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NameTableTableFilterComposer
    extends Composer<_$AppDatabase, $NameTableTable> {
  $$NameTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> nameTranslationTableRefs(
    Expression<bool> Function($$NameTranslationTableTableFilterComposer f) f,
  ) {
    final $$NameTranslationTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.nameTranslationTable,
      getReferencedColumn: (t) => t.nameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NameTranslationTableTableFilterComposer(
            $db: $db,
            $table: $db.nameTranslationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NameTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NameTableTable> {
  $$NameTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NameTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NameTableTable> {
  $$NameTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> nameTranslationTableRefs<T extends Object>(
    Expression<T> Function($$NameTranslationTableTableAnnotationComposer a) f,
  ) {
    final $$NameTranslationTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.nameTranslationTable,
          getReferencedColumn: (t) => t.nameId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NameTranslationTableTableAnnotationComposer(
                $db: $db,
                $table: $db.nameTranslationTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$NameTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NameTableTable,
          NameRecord,
          $$NameTableTableFilterComposer,
          $$NameTableTableOrderingComposer,
          $$NameTableTableAnnotationComposer,
          $$NameTableTableCreateCompanionBuilder,
          $$NameTableTableUpdateCompanionBuilder,
          (NameRecord, $$NameTableTableReferences),
          NameRecord,
          PrefetchHooks Function({bool nameTranslationTableRefs})
        > {
  $$NameTableTableTableManager(_$AppDatabase db, $NameTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NameTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$NameTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$NameTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => NameTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  NameTableCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$NameTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({nameTranslationTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (nameTranslationTableRefs) db.nameTranslationTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (nameTranslationTableRefs)
                    await $_getPrefetchedData<
                      NameRecord,
                      $NameTableTable,
                      NameTranslationRecord
                    >(
                      currentTable: table,
                      referencedTable: $$NameTableTableReferences
                          ._nameTranslationTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$NameTableTableReferences(
                                db,
                                table,
                                p0,
                              ).nameTranslationTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.nameId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NameTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NameTableTable,
      NameRecord,
      $$NameTableTableFilterComposer,
      $$NameTableTableOrderingComposer,
      $$NameTableTableAnnotationComposer,
      $$NameTableTableCreateCompanionBuilder,
      $$NameTableTableUpdateCompanionBuilder,
      (NameRecord, $$NameTableTableReferences),
      NameRecord,
      PrefetchHooks Function({bool nameTranslationTableRefs})
    >;
typedef $$NameTranslationTableTableCreateCompanionBuilder =
    NameTranslationTableCompanion Function({
      Value<int> id,
      required int nameId,
      required String language,
      required String name,
    });
typedef $$NameTranslationTableTableUpdateCompanionBuilder =
    NameTranslationTableCompanion Function({
      Value<int> id,
      Value<int> nameId,
      Value<String> language,
      Value<String> name,
    });

final class $$NameTranslationTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NameTranslationTableTable,
          NameTranslationRecord
        > {
  $$NameTranslationTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NameTableTable _nameIdTable(_$AppDatabase db) =>
      db.nameTable.createAlias(
        $_aliasNameGenerator(db.nameTranslationTable.nameId, db.nameTable.id),
      );

  $$NameTableTableProcessedTableManager get nameId {
    final $_column = $_itemColumn<int>('name_id')!;

    final manager = $$NameTableTableTableManager(
      $_db,
      $_db.nameTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NameTranslationTableTableFilterComposer
    extends Composer<_$AppDatabase, $NameTranslationTableTable> {
  $$NameTranslationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$NameTableTableFilterComposer get nameId {
    final $$NameTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nameId,
      referencedTable: $db.nameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NameTableTableFilterComposer(
            $db: $db,
            $table: $db.nameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NameTranslationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NameTranslationTableTable> {
  $$NameTranslationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$NameTableTableOrderingComposer get nameId {
    final $$NameTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nameId,
      referencedTable: $db.nameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NameTableTableOrderingComposer(
            $db: $db,
            $table: $db.nameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NameTranslationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NameTranslationTableTable> {
  $$NameTranslationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$NameTableTableAnnotationComposer get nameId {
    final $$NameTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nameId,
      referencedTable: $db.nameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NameTableTableAnnotationComposer(
            $db: $db,
            $table: $db.nameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NameTranslationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NameTranslationTableTable,
          NameTranslationRecord,
          $$NameTranslationTableTableFilterComposer,
          $$NameTranslationTableTableOrderingComposer,
          $$NameTranslationTableTableAnnotationComposer,
          $$NameTranslationTableTableCreateCompanionBuilder,
          $$NameTranslationTableTableUpdateCompanionBuilder,
          (NameTranslationRecord, $$NameTranslationTableTableReferences),
          NameTranslationRecord,
          PrefetchHooks Function({bool nameId})
        > {
  $$NameTranslationTableTableTableManager(
    _$AppDatabase db,
    $NameTranslationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NameTranslationTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$NameTranslationTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$NameTranslationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> nameId = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => NameTranslationTableCompanion(
                id: id,
                nameId: nameId,
                language: language,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int nameId,
                required String language,
                required String name,
              }) => NameTranslationTableCompanion.insert(
                id: id,
                nameId: nameId,
                language: language,
                name: name,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$NameTranslationTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({nameId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (nameId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.nameId,
                            referencedTable:
                                $$NameTranslationTableTableReferences
                                    ._nameIdTable(db),
                            referencedColumn:
                                $$NameTranslationTableTableReferences
                                    ._nameIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NameTranslationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NameTranslationTableTable,
      NameTranslationRecord,
      $$NameTranslationTableTableFilterComposer,
      $$NameTranslationTableTableOrderingComposer,
      $$NameTranslationTableTableAnnotationComposer,
      $$NameTranslationTableTableCreateCompanionBuilder,
      $$NameTranslationTableTableUpdateCompanionBuilder,
      (NameTranslationRecord, $$NameTranslationTableTableReferences),
      NameTranslationRecord,
      PrefetchHooks Function({bool nameId})
    >;
typedef $$PrayerTimeTableTableCreateCompanionBuilder =
    PrayerTimeTableCompanion Function({
      Value<int> id,
      required int locationId,
      required String date,
      required String fajr,
      required String sunrise,
      required String dhuhr,
      required String asr,
      required String maghrib,
      required String isha,
    });
typedef $$PrayerTimeTableTableUpdateCompanionBuilder =
    PrayerTimeTableCompanion Function({
      Value<int> id,
      Value<int> locationId,
      Value<String> date,
      Value<String> fajr,
      Value<String> sunrise,
      Value<String> dhuhr,
      Value<String> asr,
      Value<String> maghrib,
      Value<String> isha,
    });

final class $$PrayerTimeTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $PrayerTimeTableTable, PrayerTimeRecord> {
  $$PrayerTimeTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LocationTableTable _locationIdTable(_$AppDatabase db) =>
      db.locationTable.createAlias(
        $_aliasNameGenerator(
          db.prayerTimeTable.locationId,
          db.locationTable.id,
        ),
      );

  $$LocationTableTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<int>('location_id')!;

    final manager = $$LocationTableTableTableManager(
      $_db,
      $_db.locationTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PrayerTimeTableTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerTimeTableTable> {
  $$PrayerTimeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fajr => $composableBuilder(
    column: $table.fajr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sunrise => $composableBuilder(
    column: $table.sunrise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dhuhr => $composableBuilder(
    column: $table.dhuhr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get asr => $composableBuilder(
    column: $table.asr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get maghrib => $composableBuilder(
    column: $table.maghrib,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isha => $composableBuilder(
    column: $table.isha,
    builder: (column) => ColumnFilters(column),
  );

  $$LocationTableTableFilterComposer get locationId {
    final $$LocationTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableFilterComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTimeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerTimeTableTable> {
  $$PrayerTimeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fajr => $composableBuilder(
    column: $table.fajr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sunrise => $composableBuilder(
    column: $table.sunrise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dhuhr => $composableBuilder(
    column: $table.dhuhr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get asr => $composableBuilder(
    column: $table.asr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get maghrib => $composableBuilder(
    column: $table.maghrib,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isha => $composableBuilder(
    column: $table.isha,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocationTableTableOrderingComposer get locationId {
    final $$LocationTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableOrderingComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTimeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerTimeTableTable> {
  $$PrayerTimeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get fajr =>
      $composableBuilder(column: $table.fajr, builder: (column) => column);

  GeneratedColumn<String> get sunrise =>
      $composableBuilder(column: $table.sunrise, builder: (column) => column);

  GeneratedColumn<String> get dhuhr =>
      $composableBuilder(column: $table.dhuhr, builder: (column) => column);

  GeneratedColumn<String> get asr =>
      $composableBuilder(column: $table.asr, builder: (column) => column);

  GeneratedColumn<String> get maghrib =>
      $composableBuilder(column: $table.maghrib, builder: (column) => column);

  GeneratedColumn<String> get isha =>
      $composableBuilder(column: $table.isha, builder: (column) => column);

  $$LocationTableTableAnnotationComposer get locationId {
    final $$LocationTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableTableAnnotationComposer(
            $db: $db,
            $table: $db.locationTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTimeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerTimeTableTable,
          PrayerTimeRecord,
          $$PrayerTimeTableTableFilterComposer,
          $$PrayerTimeTableTableOrderingComposer,
          $$PrayerTimeTableTableAnnotationComposer,
          $$PrayerTimeTableTableCreateCompanionBuilder,
          $$PrayerTimeTableTableUpdateCompanionBuilder,
          (PrayerTimeRecord, $$PrayerTimeTableTableReferences),
          PrayerTimeRecord,
          PrefetchHooks Function({bool locationId})
        > {
  $$PrayerTimeTableTableTableManager(
    _$AppDatabase db,
    $PrayerTimeTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$PrayerTimeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PrayerTimeTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$PrayerTimeTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> locationId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> fajr = const Value.absent(),
                Value<String> sunrise = const Value.absent(),
                Value<String> dhuhr = const Value.absent(),
                Value<String> asr = const Value.absent(),
                Value<String> maghrib = const Value.absent(),
                Value<String> isha = const Value.absent(),
              }) => PrayerTimeTableCompanion(
                id: id,
                locationId: locationId,
                date: date,
                fajr: fajr,
                sunrise: sunrise,
                dhuhr: dhuhr,
                asr: asr,
                maghrib: maghrib,
                isha: isha,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int locationId,
                required String date,
                required String fajr,
                required String sunrise,
                required String dhuhr,
                required String asr,
                required String maghrib,
                required String isha,
              }) => PrayerTimeTableCompanion.insert(
                id: id,
                locationId: locationId,
                date: date,
                fajr: fajr,
                sunrise: sunrise,
                dhuhr: dhuhr,
                asr: asr,
                maghrib: maghrib,
                isha: isha,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PrayerTimeTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (locationId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.locationId,
                            referencedTable: $$PrayerTimeTableTableReferences
                                ._locationIdTable(db),
                            referencedColumn:
                                $$PrayerTimeTableTableReferences
                                    ._locationIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PrayerTimeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerTimeTableTable,
      PrayerTimeRecord,
      $$PrayerTimeTableTableFilterComposer,
      $$PrayerTimeTableTableOrderingComposer,
      $$PrayerTimeTableTableAnnotationComposer,
      $$PrayerTimeTableTableCreateCompanionBuilder,
      $$PrayerTimeTableTableUpdateCompanionBuilder,
      (PrayerTimeRecord, $$PrayerTimeTableTableReferences),
      PrayerTimeRecord,
      PrefetchHooks Function({bool locationId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AzkarCategoryTableTableTableManager get azkarCategoryTable =>
      $$AzkarCategoryTableTableTableManager(_db, _db.azkarCategoryTable);
  $$AzkarCategoryTranslationTableTableTableManager
  get azkarCategoryTranslationTable =>
      $$AzkarCategoryTranslationTableTableTableManager(
        _db,
        _db.azkarCategoryTranslationTable,
      );
  $$AzkarChapterTableTableTableManager get azkarChapterTable =>
      $$AzkarChapterTableTableTableManager(_db, _db.azkarChapterTable);
  $$AzkarChapterTranslationTableTableTableManager
  get azkarChapterTranslationTable =>
      $$AzkarChapterTranslationTableTableTableManager(
        _db,
        _db.azkarChapterTranslationTable,
      );
  $$AzkarItemTableTableTableManager get azkarItemTable =>
      $$AzkarItemTableTableTableManager(_db, _db.azkarItemTable);
  $$AzkarItemTranslationTableTableTableManager get azkarItemTranslationTable =>
      $$AzkarItemTranslationTableTableTableManager(
        _db,
        _db.azkarItemTranslationTable,
      );
  $$AzkarReferenceTableTableTableManager get azkarReferenceTable =>
      $$AzkarReferenceTableTableTableManager(_db, _db.azkarReferenceTable);
  $$AzkarReferenceTranslationTableTableTableManager
  get azkarReferenceTranslationTable =>
      $$AzkarReferenceTranslationTableTableTableManager(
        _db,
        _db.azkarReferenceTranslationTable,
      );
  $$CountryTableTableTableManager get countryTable =>
      $$CountryTableTableTableManager(_db, _db.countryTable);
  $$LocationTableTableTableManager get locationTable =>
      $$LocationTableTableTableManager(_db, _db.locationTable);
  $$NameTableTableTableManager get nameTable =>
      $$NameTableTableTableManager(_db, _db.nameTable);
  $$NameTranslationTableTableTableManager get nameTranslationTable =>
      $$NameTranslationTableTableTableManager(_db, _db.nameTranslationTable);
  $$PrayerTimeTableTableTableManager get prayerTimeTable =>
      $$PrayerTimeTableTableTableManager(_db, _db.prayerTimeTable);
}
