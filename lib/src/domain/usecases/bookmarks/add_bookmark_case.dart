import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../domain.dart';

class AddBookmarkCase implements UseCase<bool, AddBookmarkParams> {
  final BookmarkRepository repository;

  AddBookmarkCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(AddBookmarkParams params) async {
    return await repository.addBookmark(params.news);
  }
}

class AddBookmarkParams extends Equatable {
  final NewsEntities news;

  const AddBookmarkParams(this.news);

  @override
  List<Object> get props => [news];
}
