import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/core/usecase/usecase.dart';
import 'package:codehub/src/data/models/snippet_model.dart';
import 'package:codehub/src/domain/repositories/snippet_repository.dart';

class CreateSnippetUseCase
    extends UseCase<DataState<SnippetModel>, Map<String, dynamic>> {
  final SnippetRepository _snippetRepository;

  CreateSnippetUseCase(this._snippetRepository);

  @override
  Future<DataState<SnippetModel>> call({Map<String, dynamic>? params}) {
    return _snippetRepository.createSnippet(params!);
  }
}
