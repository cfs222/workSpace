import 'package:dartz/dartz.dart';
import 'package:himah/core/errors/expentions.dart';
import 'package:himah/core/errors/failure.dart';
import 'package:himah/features/on_boarding/data/datasources/user_local_data_source.dart';
import 'package:himah/features/on_boarding/data/models/user_model.dart';
import 'package:himah/features/on_boarding/domain/entities/user_entitiy.dart';
import 'package:himah/features/on_boarding/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> createUser(UserEntity user) async {
    try {
      final model = UserModel.fromEntity(user);
      await localDataSource.cacheUser(model);
      return const Right(unit);
    } on CacheExeption catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserData() async {
    try {
      final user = await localDataSource.getCurrentUser();
      return Right(user);
    } on CacheExeption catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
