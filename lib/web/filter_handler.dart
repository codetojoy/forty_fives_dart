import 'dart:io';

import './keys.dart';
import './utils.dart';
import './services/filter_adapter.dart';
import '../utils/logger.dart';

class FilterHandler {
  final _filterAdapter = FilterAdapter();

  bool _validateQuery(Map<String, String> params) {
    var result = params.containsKey(Keys.CARDS) &&
        params.containsKey(Keys.LEADING) &&
        params.containsKey(Keys.TRUMP) &&
        params.containsKey(Keys.TRUMP_PLAYED);
    return result;
  }

  void handleFilter(HttpRequest request) {
    final uri = request.uri;
    final queryParams = uri.queryParameters;

    if (!_validateQuery(queryParams)) {
      handleError(request, 'bad request');
      return;
    }
    final trump = queryParams[Keys.TRUMP]!;
    final leading = queryParams[Keys.LEADING]!;
    final trumpPlayed = queryParams[Keys.TRUMP_PLAYED]!;
    final cards = queryParams[Keys.CARDS]!;
    L.log('getCandidates t: $trump l: $leading tp: $trumpPlayed cards: $cards');
    var jsonString = '';
    try {
      jsonString = _filterAdapter.getCandidates(trump, leading, trumpPlayed, cards);
    } catch (ex) {
      handleError(request, ex.toString());
      return;
    }

    request.response.headers
        .set(HttpHeaders.contentTypeHeader, 'application/json');
    request.response
      ..write(jsonString)
      ..close();
  }
}
