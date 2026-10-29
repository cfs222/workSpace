import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/databases/cache/cache_helper.dart';
import 'package:himah/features/on_boarding/data/datasources/user_local_data_source.dart';
import 'package:himah/features/on_boarding/data/repositories/user_repository_impl.dart';
import 'package:himah/features/on_boarding/domain/repositories/user_repository.dart';
import 'package:himah/features/on_boarding/domain/usecases/create_user_usecase.dart';

final cacheHelperProvider = Provider<CacheHelper>((ref) {
  return CacheHelper(); // تأكد أنه تم init في main
});

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource(cache: ref.read(cacheHelperProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    localDataSource: ref.read(userLocalDataSourceProvider),
  );
});

final createUserUseCaseProvider = Provider<CreateUser>((ref) {
  return CreateUser(repository: ref.read(userRepositoryProvider));
});
