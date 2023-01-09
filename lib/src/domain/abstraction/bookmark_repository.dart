import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, bool>> addBookmark(NewsEntities news);
  Future<Either<Failure, bool>> removeBookmark(NewsEntities news);
  Future<Either<Failure, NewsEntities>> readBookmark();
}
