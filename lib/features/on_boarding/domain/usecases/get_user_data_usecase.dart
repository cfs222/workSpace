import 'package:dartz/dartz.dart';
import 'package:himah/core/errors/failure.dart';
import 'package:himah/features/on_boarding/domain/entities/user_entitiy.dart';
import 'package:himah/features/on_boarding/domain/repositories/user_repository.dart';

class GetUserData {
  final UserRepository repository;

  GetUserData({required this.repository});

  Future<Either<Failure, UserEntity?>> call() {
    return repository.getUserData();
  }
}
