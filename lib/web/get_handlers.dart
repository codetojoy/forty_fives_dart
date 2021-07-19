import 'dart:io';

import './filter_handler.dart';
import './rank_handler.dart';
import './utils.dart';

final _filterHandler = FilterHandler();
final _rankHandler = RankHandler();

void handleGet(HttpRequest request) {
  final path = request.uri.path;

  print('TRACER path: $path');

  switch (path) {
    case '/ping':
      handlePing(request);
      break;
    case '/filter':
      _filterHandler.handleFilter(request);
      break;
    case '/rank':
      _rankHandler.handleRank(request);
      break;
    default:
      handleUnknown(request);
      break;
  }
}
