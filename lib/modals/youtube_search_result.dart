library youtube_search_result;

import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voice_based_app/serializer/serializers.dart';
import 'search_item.dart';

part 'youtube_search_result.g.dart';

abstract class YoutubeSearchResult implements Built<YoutubeSearchResult, YoutubeSearchResultBuilder> {
  @nullable
  String get nextPageToken;
  BuiltList<SearchItem> get items;

  YoutubeSearchResult._();

  factory YoutubeSearchResult([updates(YoutubeSearchResultBuilder builder)]) = _$YoutubeSearchResult;

  String toJson() {
    return json.encode(serializers.serializeWith(YoutubeSearchResult.serializer, this));
  }

  static YoutubeSearchResult fromJson(String jsonString) {
    return serializers.deserializeWith(YoutubeSearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<YoutubeSearchResult> get serializer => _$youtubeSearchResultSerializer;
}