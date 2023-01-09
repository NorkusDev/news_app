import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../domain.dart';

class RemoveBookmarkCase implements UseCase<bool, RemoveBookmarkParams> {
  final BookmarkRepository repository;

  RemoveBookmarkCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(RemoveBookmarkParams params) async {
    return await repository.removeBookmark(params.news);
  }
}

class RemoveBookmarkParams {
  final NewsEntities news;

  RemoveBookmarkParams(this.news);
}
