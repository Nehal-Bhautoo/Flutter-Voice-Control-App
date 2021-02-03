library id;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voice_based_app/serializer/serializers.dart';

part 'id.g.dart';

abstract class Id implements Built<Id, IdBuilder> {
  Id._();

  factory Id([updates(IdBuilder builder)]) = _$Id;

  String toJson() {
    return json.encode(serializers.serializeWith(Id.serializer, this));
  }

  static Id fromJson(String jsonString) {
    return serializers.deserializeWith(Id.serializer, json.decode(jsonString));
  }

  static Serializer<Id> get serializer => _$idSerializer;
}