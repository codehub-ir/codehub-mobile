import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/data/models/snippet_model.dart';

abstract class SnippetRepository {
  Future<DataState<SnippetModel>> createSnippet(Map params);
}
