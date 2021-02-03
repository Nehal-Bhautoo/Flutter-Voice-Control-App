import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voice_based_app/modals/model_search.dart';
import 'package:voice_based_app/network/api_key.dart';

const int MAX_SEARCH_RESULTS = 5;

class YoutubeDataSource {
  final http.Client client;
  final String _searchBaseUrl = 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=$MAX_SEARCH_RESULTS&type=video&key=$API_KEY';
  YoutubeDataSource(this.client);

  Future<YoutubeSearchResult> searchVideo({
    String query,
    String pageToken = '',
  }) async {
    final urlRaw = _searchBaseUrl + '&q=$query' + (pageToken.isNotEmpty ? '&pageToken=$pageToken' : '');
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if(response.statusCode == 200) {
      return YoutubeSearchResult.fromJson(response.body);
    } else {
      throw YoutubeSearchError(json.decode(response.body)['error']['message']);
    }
  }
}