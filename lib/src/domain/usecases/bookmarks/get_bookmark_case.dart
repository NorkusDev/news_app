import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../domain.dart';

class GetBookmarkCase implements UseCase<NewsEntities, NoParams> {
  final BookmarkRepository repository;

  GetBookmarkCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.readBookmark();
  }
}
